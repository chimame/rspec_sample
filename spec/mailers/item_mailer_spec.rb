require "rails_helper"

RSpec.describe ItemMailer, type: :mailer do
  let(:item) {build_stubbed(:item)}
  let(:mail) {described_class.thanks_email(item)}

  example 'subject is `test thanks email`' do
    expect(mail.subject).to eq 'test thanks email'
  end

  example 'mailto is `to_test@example.com`' do
    expect(mail.to).to eq ['to_test@example.com']
  end

  example 'mailbody match item name' do
    expect(mail.body.encoded).to match item.name
  end
end
