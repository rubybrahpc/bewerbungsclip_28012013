class AddPasswordDigestToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :password_digest, :string
  end
end
