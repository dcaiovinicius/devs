class AdminMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_developer.subject
  #
  def new_developer
    @user = params[:user]

    mail(
      to: @user.email,
      subject: "New developer has created a profile"
    )
  end
end
