class AddIdStrToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :id_str, :string

  end
end
