class OrderMailer < ApplicationMailer

  default from: 'Rab It <clemdelatang@gmail.com>'
  helper ApplicationHelper

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.places.subject
  #
  def placed(order, user)
    @order = order
    @user = user

    email_with_name = %("#{user.first_name}" <#{user.email}>)
    mail(to: email_with_name, subject: 'Confirmation de ta commande')
  end

  def placed_without_logged_in(order)
    @order = order

    email_with_name = %("#{order.first_name}" <#{order.email}>)
    mail(to: email_with_name, subject: 'Confirmation de ta commande')
  end

  def received(order, cook, order_item)
    @order = order
    @cook = cook
    @order_item = order_item

    email_with_name = %("#{cook.user.first_name}" <#{cook.user.email}>)
    order_with_name = %("#{order.first_name} veut du rab")
    mail(to: email_with_name, subject: order_with_name)
  end
end
