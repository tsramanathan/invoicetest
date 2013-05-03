class CreateInvoiceVms < ActiveRecord::Migration
  def change
    create_table :invoice_vms do |t|

      t.timestamps
    end
  end
end
