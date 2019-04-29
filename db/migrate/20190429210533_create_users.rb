class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.timestamps # adds "created at" and 'updated at' columns 
    end
  end
end
