class AddChallengeToMovie < ActiveRecord::Migration
  def change
    add_reference :movies, :challenge, index: true
  end
end
