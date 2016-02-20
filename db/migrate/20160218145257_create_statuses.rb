class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :user
      t.string :question
      t.string :answer
      t.datetime :created

      t.timestamps null: false
    end
  end
end
