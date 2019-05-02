class CreateJoinTableProfileInterest < ActiveRecord::Migration[5.2]
  def change
    create_join_table :profiles, :interests do |t|
      t.index [:profile_id, :interest_id]
    end
  end
end
