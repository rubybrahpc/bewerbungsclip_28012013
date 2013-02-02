class AddRememberTokenToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :remember_token, :string
    add_index  :templates, :remember_token
  end
end