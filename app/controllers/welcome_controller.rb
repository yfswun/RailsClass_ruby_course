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

    respond_to do |format|
        begin
          # add the URL to the student
          # Ruby will give the URL the correct student_id
          # if @student.save and @student.urls.create!({:name => '',:url => params[:url]})
            # format.html { redirect_to  '/urls', notice: 'Url was successfully created.' }
            # format.json { render json: @url, status: :created, location: @url }
            @student.save
            @student.urls.create!({:name => '',:url => params[:url]})
            format.html { redirect_to  '/urls', notice: 'The URL was successfully registered.' }
            format.json { render json: @url, status: :created, location: @url }
        rescue ActiveRecord::RecordInvalid
            # else
            # If the form doesn't validate we'll just redirect.
            # We have to create a route in config/routes.rb for this to work
            # msgs = ''
            # @student.errors.full_messages.each { |msg| msgs = msgs + msg + "\n" }
            # flash.now[:error] = msgs
            # # format.html { render "/urls/new" }
            # format.html { redirect_to '/error'}

            # @url = Url.new(:url => params[:url],
                           # :student_id => params[:student][:name],
                           # :name => params[:student][:course])
            # @student.errors.each do |attrib, errArr|
                # @url.errors.add(attrib, errArr)
            # end
            
            format.html { render "app/views/students/new.html.erb" }
            format.json { render json: @student.errors, status: :unprocessable_entity }
        rescue Exception
            format.html { redirect_to '/error'}
        end
    end
  end
end
