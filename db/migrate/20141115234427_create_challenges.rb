class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :ticket
      t.integer :trailer
      t.integer :checkin
      t.integer :quiz
      t.integer :fblike
      t.integer :fbshare
      t.integer :tfollow
      t.integer :tweet

      t.timestamps
    end
  end
end
