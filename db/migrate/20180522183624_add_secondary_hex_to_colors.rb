class AddSecondaryHexToColors < ActiveRecord::Migration[5.1]
  def change
    add_column :colors, :secondary_hex_code, :string
  end
end
