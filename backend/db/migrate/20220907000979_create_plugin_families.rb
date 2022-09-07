class CreatePluginFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :plugin_families do |t|
      t.string :name
      t.timestamps
    end
  end
end
