class CreateSecurityRolesManagers < ActiveRecord::Migration
  def change
    create_table :security_roles_managers do |t|

      t.timestamps
    end
  end
end
