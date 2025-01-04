class TestMailer < ApplicationMailer
  def test_email
    mail(
      to: 'tom@tomdringer.com', # Replace with your email address
      from: ENV['MAIL_USERNAME'],  # Uses Gmail username from environment variables
      subject: 'Test Email',
      body: 'This is a test email sent from the Rails application.'
    )
  end
end