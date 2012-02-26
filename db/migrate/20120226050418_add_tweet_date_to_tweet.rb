class AddTweetDateToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :date, :datetime

  end
end
