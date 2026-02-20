require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  test "send email to admin when new developer creates profile" do
    admin = users(:admin)
    mail = AdminMailer.with(user: admin).new_developer

    assert_equal "New developer has created a profile", mail.subject
  end
end
