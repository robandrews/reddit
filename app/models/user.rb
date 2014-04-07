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


class User < ActiveRecord::Base
  before_validation :ensure_session_token
  
  validates :username, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :password_digest, presence: true
  
  attr_reader :password

  has_many(
    :links,
    :primary_key => :id,
    :foreign_key => :submitter_id,
    :class_name => "Link"
  )

  has_many(
    :comments,
    :primary_key => :id,
    :foreign_key => :author_id,
    :class_name => "Comment"
  )

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if !!user && user.is_password?(password)
    nil
  end
  
  private

  def ensure_session_token
    self.session_token ||= reset_session_token!
  end
end
