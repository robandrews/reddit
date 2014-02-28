# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  parent_comment_id :integer
#  link_id           :integer
#  author_id         :integer
#  text              :text
#  created_at        :datetime
#  updated_at        :datetime
#

class Comment < ActiveRecord::Base
  belongs_to(
    :link,
    :primary_key => :id,
    :foreign_key => :link_id,
    :class_name => "Link"
  )

  belongs_to(
    :author,
    :primary_key => :id,
    :foreign_key => :author_id,
    :class_name => "User"
  )

  belongs_to(
    :parent_comment,
    :primary_key => :id,
    :foreign_key => :parent_comment_id,
    :class_name => "Comment"
  )
end
