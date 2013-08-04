class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :expires_at
      t.string :token
      t.references :user

      t.timestamps
    end
  end
end
