class AddChallengeToUser < ActiveRecord::Migration
  def change
    add_reference :users, :challenge, index: true
  end
end
