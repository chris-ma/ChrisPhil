class CreateEmbedcards < ActiveRecord::Migration
  def change
    create_table :embedcards do |t|
      t.string :index
      t.string :new
      t.string :create
      t.string :destroy

      t.timestamps null: false
    end
  end
end
