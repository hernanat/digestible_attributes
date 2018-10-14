class CreateTestModels < ActiveRecord::Migration[5.2]
  def change
    create_table :test_models do |t|
      t.text :foo
      t.text :bar
      t.text :baz
      t.text :md5_digest

      t.timestamps
    end
  end
end
