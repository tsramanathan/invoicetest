class CreateInvoiceManagers < ActiveRecord::Migration
  def change
    create_table :invoice_managers do |t|

      t.timestamps
    end
  end
end
