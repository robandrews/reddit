# == Schema Information
#
# Table name: links
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  url          :string(255)
#  text         :text
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Link < ActiveRecord::Base
  belongs_to(
    :submitter,
    :primary_key => :id,
    :foreign_key => :submitter_id,
    :class_name => "User"
  )

  has_many(
    :link_subs,
    :primary_key => :id,
    :foreign_key => :link_id,
    :class_name => "LinkSub"
  )

  has_many(
    :subs,
    :through => :link_subs,
    :source => :sub
  )

  has_many(
    :comments,
    :primary_key => :id,
    :foreign_key => :link_id,
    :class_name => "Comment"
  )

  validate :belongs_to_at_least_one_sub


  def comments_by_parent
    comments_by_parent = Hash.new { |hash, key| hash[key] = [] }

    comments.each do |comment|
      comments_by_parent[comment.parent_comment_id] << comment
    end

    comments_by_parent
  end
  
  def belongs_to_at_least_one_sub
    if link_subs.empty?
      errors[:base] << "must belong to at least one sub"
    end
  end
  
  def votes
    self.user_votes.sum(:value)
  end
end
