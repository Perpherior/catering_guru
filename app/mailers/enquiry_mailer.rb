class EnquiryMailer < ApplicationMailer
  default to: "139520519@qq.com"

  def send_mail(enquiry)
    @enquiry = enquiry
    from = @enquiry.email

    mail :subject => 'Enquiry from Customer',
         :from => from
  end
end
