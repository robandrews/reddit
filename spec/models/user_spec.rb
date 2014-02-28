# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  it "should look up self by credentials" do
    user = FactoryGirl.create(:user)
    User.find_by_credentials(user.username, user.password).should eq user
  end
end
