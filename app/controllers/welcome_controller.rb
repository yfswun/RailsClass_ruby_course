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
        @student = Student.new({:name => params[:student][:name], :course => params[:student][:course]})
        # respond_to do |format|
        begin
          # add the URL to the student
          # Ruby will give the URL the correct student_id
            if (@student.save and @student.urls.create!({:name => '',:url => params[:url]}))
                redirect_to  '/urls', notice: 'Your Heroku application was successfully registered.'
            else
            # If the form doesn't validate we'll just redirect.
            # We have to create a route in config/routes.rb for this to work
                render "app/views/students/new.html.erb"
            end
        rescue ActiveRecord::RecordInvalid
            render 'error'
        rescue Exception
            redirect_to '/error'
        end
    end
end
