class WelcomeController < ApplicationController
  def register
  end

  # GET /urls
  # GET /urls.json
  def index

    # Student.joins(:urls)
    @students = Student.all
    @urls = Url.all

    # We will be creating a new student object to use with Register URL form
    @student = Student.new 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @urls }
    end
  end

  def create
    # Create a student
    # You can see the Students table id db/migrate
    @student = Student.new({:name =>params[:student][:name],:course => params[:student][:course]})

    # Sometimes displaying the error page comes back with a blank page and the following logs:
    #       Rendered welcome/error.html.erb within layouts/application (0.0ms)
    #     Completed 406 Not Acceptable in 207ms (Views: 54.7ms | ActiveRecord: 133.8ms)
    # http://hybernaut.github.io/blog/2012/03/22/rails-controller-returning-406-not-acceptable/
    # Comment out respond_to and not do json format
    # respond_to do |format|
        begin
            if @student.save and @student.urls.create!({:name => '',:url => params[:url]})
                # format.html { redirect_to  '/urls', notice: 'Your Heroku application was successfully registered.' }
                # format.json { render json: @url, status: :created, location: @url }
                redirect_to  '/urls', notice: 'Your Heroku application was successfully registered.'
            else
                render "app/views/students/new.html.erb"
            end
        rescue ActiveRecord::RecordInvalid
            redirect_to  '/error'
        rescue
            raise 'error'
            redirect_to  '/error'
        end
    # end
  end

end
