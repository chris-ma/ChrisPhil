class AddColumnToEmbedcards < ActiveRecord::Migration
  def change
    add_column :embedcards, :media, :string
  end
end
