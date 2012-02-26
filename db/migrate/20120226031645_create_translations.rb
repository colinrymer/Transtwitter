class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :tweet_id
      t.string :text

      t.timestamps
    end
  end
end
