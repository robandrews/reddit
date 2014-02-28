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

class Sub < ActiveRecord::Base
  validates :name, :moderator_id, presence: true

  belongs_to(
    :moderator,
    :primary_key => :id,
    :foreign_key => :moderator_id,
    :class_name => "User"
  )

  has_many(
    :link_subs,
    :primary_key => :id,
    :foreign_key => :sub_id,
    :class_name => "LinkSub"
  )

  has_many(
    :links,
    :through => :link_subs,
    :source => :link
  )
end
