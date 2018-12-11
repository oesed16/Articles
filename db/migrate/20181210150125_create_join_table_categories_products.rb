class CreateJoinTableCategoriesProducts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :products do |t|
      t.references :categories, foreign_key: true
      t.references :products, foreign_key: true
    end
  end
end
