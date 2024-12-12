class ContactUs < MailForm::Base
  attribute :first_name
  attribute :last_name
  attribute :email
  attribute :message

  def headers
    { to: "PLEASE-CHANGE-ME@example.org" }
  end
end
