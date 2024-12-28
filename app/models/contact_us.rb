# frozen_string_literal: true
class ContactUs < MailForm::Base
  attribute :name
  attribute :nickname
  attribute :subject
  attribute :email
  attribute :email_confirmation
  attribute :message

  validates :name, :subject,
            presence: true,
            allow_blank: false,
            format: { with: /\A[a-zA-Z\s-]+\z/, message: 'Only allows letters, spaces, and hyphens' }

  validates :email,
            presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
            allow_blank: false,
            length: {
              minimum: 5,
              maximum: 50
            }

  validates :email_confirmation,
            presence: true

  validate :emails_match

  validates :message,
            allow_blank: false,
            length: {
              minimum: 10,
              maximum: 500
            }

  private

  def headers
    {
      to: 'stuart@scbexecutivecoaching.com', # change this to be the email you want sent to
      subject: 'SCB Executive Coaching Query',
      from: 'stuart@scbexecutivecoaching.com',  # change this to be the email it is coming from
      reply_to: %("#{name}" <#{email}>)
    }
  end

  def emails_match
    if email != email_confirmation
      errors.add(:email_confirmation, "doesn't match Email")
    end
  end
end

