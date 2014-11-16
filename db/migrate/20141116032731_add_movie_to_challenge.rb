class AddMovieToChallenge < ActiveRecord::Migration
  def change
    add_reference :challenges, :movie, index: true
  end
end
