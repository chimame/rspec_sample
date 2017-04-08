class ItemMailer < ApplicationMailer
  def thanks_email(item)
    @item = item
    mail(to: 'to_test@example.com', subject: 'test thanks email')
  end
end
