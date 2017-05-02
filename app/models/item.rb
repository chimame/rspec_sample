class Item < ApplicationRecord
  after_create :send_thanks_email

  def method1
    method2
  end

  def method2
    "test"
  end

  def send_thanks_email
    ItemMailer.thanks_email(self).deliver_now
  end
end
