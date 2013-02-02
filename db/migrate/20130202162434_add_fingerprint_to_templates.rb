class AddFingerprintToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :fingerprint, :string
  end
end
