class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.integer :user_id
      t.string :from_user
      t.string :for_company
      t.string :video

      t.timestamps
    end
  end
end
