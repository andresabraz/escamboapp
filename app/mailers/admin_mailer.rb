class AdminMailer < ApplicationMailer

  def update_email(current_admin, admin)
  	@current_admin = current_admin
  	@admin = admin

  	mail(to: @admin.email, subject: "Seus dados foram alterados!")
  end

  def send_message(current_admin, params)
  	@current_admin = current_admin
  	@recipient = params['recipient-name']
  	@subject = params['subject-text']
  	@message = params['message-text']

  	mail(to: @recipient, subject: @subject)
  end

end
