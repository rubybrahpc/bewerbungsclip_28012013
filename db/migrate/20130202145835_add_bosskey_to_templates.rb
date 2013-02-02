class AddBosskeyToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :bosskey, :string
  end
end
