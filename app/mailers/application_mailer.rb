# This is the base class for all mailers in the application. It is inherited by all other mailers in the application.
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end
