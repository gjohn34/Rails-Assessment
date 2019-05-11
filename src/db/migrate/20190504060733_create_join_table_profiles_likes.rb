class CreateJoinTableProfilesLikes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :profiles, :likes do |t|
      t.index [:profile_id, :like_id]
    end
  end
end
