require 'rails_helper'

RSpec.describe Item, type: :model do
  example 'send mail when created' do
    expect do
      create(:item)
    end.to change { ActionMailer::Base.deliveries.size }.by(1)
  end
end
