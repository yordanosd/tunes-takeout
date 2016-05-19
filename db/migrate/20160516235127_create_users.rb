class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name # could be a nickname from provider
      t.timestamps null: false
    end
  end
end
