class RemoveInterestsIdFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :interests_id
  end
end
