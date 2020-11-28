class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,              null: false
      t.integer :price,             null: false
      t.integer :status_id,         null: false
      t.integer :shopping_cost_id,  null: false
      t.integer :shopping_days_id,  null: false
      t.integer :prefecture_id,    null: false
      t.string  :category_id,       null: false
      t.text    :description,       null: false
      t.integer :user_id,           null: false, foreign_key: true
      t.timestamps
    end
  end
end

# rails db:rollback STEP=2
# からむをしゅうせい
# rails db:migrate