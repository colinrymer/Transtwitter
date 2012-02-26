# == Schema Information
#
# Table name: translations
#
#  id         :integer         not null, primary key
#  tweet_id   :integer
#  text       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  language   :string(255)
#

class Translation < ActiveRecord::Base
  belongs_to :tweet
end
