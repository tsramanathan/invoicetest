class CreateCbInvoices < ActiveRecord::Migration
  def change
    create_table :cb_invoices do |t|
      t.string :did
      t.string :invoice_number
      t.string :bill_company_name
      t.date :invoice_date
      t.string :status
      t.decimal :total

      t.timestamps
    end
  end
end
