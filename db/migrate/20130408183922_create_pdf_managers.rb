class CreatePdfManagers < ActiveRecord::Migration
  def change
    create_table :pdf_managers do |t|

      t.timestamps
    end
  end
end
