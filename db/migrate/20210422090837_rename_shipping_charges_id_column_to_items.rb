class RenameShippingChargesIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_charges_id, :shipping_charge_id
    rename_column :items, :shipping_days_id, :shipping_day_id
  end
end
