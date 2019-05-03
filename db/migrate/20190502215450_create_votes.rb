class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      t.references :voteable, polymorphic: true # creates 2 columns voteable_id and voteable_type
      t.timestamps
    end
  end
end
