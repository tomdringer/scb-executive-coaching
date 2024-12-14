class ContactUsController < ApplicationController

  require 'net/dns'
  def new
    @contact_us = ContactUs.new
  end

  def create
    @contact_us = ContactUs.new(params[:contact_us])
    @contact_us.request = request
    if @contact_us.nickname.blank?
      @contact_us.deliver
      redirect_to '/contact_us/sent'
    else
      redirect_to '/contact_us/error'
    end
  end

  private

  def contact_us_params
    params.require(:contact_us).permit(:name, :subject, :email, :message, :nickname)
  end
end
