# == Schema Information
#
# Table name: translations
#
#  id         :integer         not null, primary key
#  tweet_id   :integer
#  text       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
