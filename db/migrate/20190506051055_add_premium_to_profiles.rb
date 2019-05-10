class AddPremiumToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :premium, :boolean, default: false
  end
end
