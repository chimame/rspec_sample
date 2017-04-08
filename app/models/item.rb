class Item < ApplicationRecord
  after_create :send_thanks_email

  def send_thanks_email
    ItemMailer.thanks_email(self).deliver_now
  end
end
