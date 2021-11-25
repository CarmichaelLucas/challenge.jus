# frozen_string_literal: true

# Migrate Class
class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.integer :number
      t.text :content
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
