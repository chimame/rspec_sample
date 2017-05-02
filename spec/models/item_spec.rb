require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#method1' do
    let(:item) { Item.new }
    subject { item.method1 }
    before{ allow(item).to receive(:method2).and_return("mock") }

    example 'return "mock"' do
      is_expected.to eq 'mock'
    end
  end

  describe 'before create' do
    example 'send mail when created' do
      expect do
        create(:item)
      end.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
