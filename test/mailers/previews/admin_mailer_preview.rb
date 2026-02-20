# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/new_developer
  def new_developer
    AdminMailer.with(user: User.admins.first).new_developer
  end
end
