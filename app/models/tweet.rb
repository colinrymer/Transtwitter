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

class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :translations

  validates :user_id, presence: true
  validates :id_str,  presence: true, uniqueness: { case_sensitive: false }
end
