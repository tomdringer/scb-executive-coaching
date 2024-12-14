# frozen_string_literal: true
class ContactUs < MailForm::Base
  attribute :name
  attribute :nickname
  attribute :subject
  attribute :email
  attribute :message

  validates :name, :subject,
            presence: true,
            allow_blank: false,
            format: { with: /\A[a-zA-Z\s-]+\z/, message: 'Only allows letters, spaces, and hyphens' }

  validates :email,
            presence: true,
            allow_blank: false,
            length: {
              minimum: 5,
              maximum: 50
            }

  validates :message,
            allow_blank: false,
            length: {
              minimum: 10,
              maximum: 500
            }



  def headers
    {
      to: 'tom@tomdringer.com', # change this to be the email you want sent to
      subject: 'RDD Query',
      from: 'tom@eigotec.com',  # change this to be the email it is coming from
      reply_to: %("#{name}" <#{email}>)
    }
  end
end
