class AddProfileToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :sender, foreign_key: { to_table: :profiles }
  end
end
