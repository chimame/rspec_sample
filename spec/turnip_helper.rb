require 'turnip'
require 'turnip/capybara'
require 'rails_helper'
Dir.glob("spec/**/*steps.rb") { |f| load f, true }
