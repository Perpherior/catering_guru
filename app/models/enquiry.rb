class Enquiry
  include ActiveAttr::Model

  attribute :first_name
  attribute :last_name
  attribute :phone
  attribute :email
  attribute :content
  attribute :services

  validates :last_name,
            presence: { message: "Last name cann't be blank!" }
  validates :email,
            presence: { message: "Email cann't be blank!" }
  validates :content,
            presence: { message: "Enquiry cann't be blank!" }

  validates_format_of :email,
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "Email format is 'example@gmail.com'"
  validates_length_of :content, maximum: 150

end
