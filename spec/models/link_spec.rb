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

require 'spec_helper'

describe Link do
  pending "add some examples to (or delete) #{__FILE__}"
end
