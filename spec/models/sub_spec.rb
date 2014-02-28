# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Sub do
  it "creates a sub with a name and moderator id" do
    mod = FactoryGirl.create(:user)
    sub = FactoryGirl.create(:sub, :moderator_id => mod.id)
    expect(sub).to be_valid
  end

  it "validates presence of name and moderator" do
    expect(FactoryGirl.build(:sub, :name => nil, :moderator_id => nil)).to_not be_valid
  end

  it "can create links through associations" do
    mod = FactoryGirl.create(:user)
    sub = FactoryGirl.create(:sub, :moderator_id => mod.id)
    link = {:title => "link title", :url => "test.com", :text => "cool text"}
    sub.links.new(link)
    expect(sub.links.first).to be_a Link
  end

end
