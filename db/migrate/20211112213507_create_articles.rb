# frozen_string_literal: true

# Migrate Class
class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.boolean :status
      t.datetime :publish_at
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
