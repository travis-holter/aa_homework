# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }  
    it { should validate_presence_of(:password_digest) } 
    it { should validate_presence_of(:session_token) } 
  end

  describe 'associations' do

  end

  describe 'is_password?' do
  end

end

# https://open.appacademy.io/learn/swe-in-person/rails/testing-models