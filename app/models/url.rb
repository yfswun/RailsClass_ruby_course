class Url < ActiveRecord::Base
    attr_accessible :comment, :name, :student_id, :url

    # Write code the shows a url belongs to a student
    belongs_to :student

    # URL is required
    # validates :url, presence: true
    
    # Write code the validates urls have a domain name of herokuapp.com.
    domain = 'herokuapp.com'
    validates :url, format: { with: /.*herokuapp.com\/?\z/i,
                              message: "The URL must be hosted by Heroku." }

    # URL should be unique, case-insensitively
    validates :url, uniqueness: { case_sensitive: false,
                                  message: "This URL has already been registered." }

end
