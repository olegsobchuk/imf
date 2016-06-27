class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@imf.test'

  layout 'mailer'
end
