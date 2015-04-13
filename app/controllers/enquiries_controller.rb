class EnquiriesController < ::ApplicationController
  def create
    enquiry = Enquiry.new(params[:enquiry])
    EnquiryMailer.delay.send_mail(enquiry)
    redirect_to root_url
  end
end
