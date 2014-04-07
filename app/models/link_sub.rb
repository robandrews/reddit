# == Schema Information
#
# Table name: link_subs
#
#  id         :integer          not null, primary key
#  link_id    :integer
#  sub_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class LinkSub < ActiveRecord::Base
  belongs_to(
    :sub,
    :primary_key => :id,
    :foreign_key => :sub_id,
    :class_name => "Sub",
    :inverse_of => :link_subs
  )

  belongs_to(
    :link,
    :primary_key => :id,
    :foreign_key => :link_id,
    :class_name => "Link",
    :inverse_of => :link_subs
  )
end
