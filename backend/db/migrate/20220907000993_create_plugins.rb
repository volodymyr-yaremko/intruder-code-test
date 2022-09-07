class CreatePlugins < ActiveRecord::Migration[6.1]
  def change
    create_table :plugins do |t|
      t.string :nessus_id
      t.string :name
      t.integer :check_type
      t.string :version
      t.belongs_to :plugin_family
      t.datetime :modified_at
      t.datetime :published_at
    end
  end
end
