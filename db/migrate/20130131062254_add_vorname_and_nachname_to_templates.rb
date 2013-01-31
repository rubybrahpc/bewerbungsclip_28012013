class AddVornameAndNachnameToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :vorname, :string
    add_column :templates, :nachname, :string
  end
end
