# == Schema Information
#
# Table name: tweets
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  text       :string(255)
#  user_id    :string(255)
#  id_str     :string(255)
#

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
