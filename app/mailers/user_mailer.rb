class UserMailer < ApplicationMailer
  default from: 'notifications@shoppe.com'

  def welcome_email(user)
    @user = user
    # Figure what this needs to be
    @url  = 'http://example.com/users/new'
    mail(to: @user.email, subject: 'Welcome to Shoppe!')
  end

  def invoice_email(order)
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @order.user.email, subject: 'Thank you for your purchase!')
  end
end
