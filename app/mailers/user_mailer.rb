class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.deposit_success.subject
  #
  def deposit_success
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
