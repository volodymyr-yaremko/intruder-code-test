class CreateReportItems < ActiveRecord::Migration[6.1]
  def change
    create_table :report_items do |t|
      t.string :svc_name
      t.integer :port
      t.integer :protocol, :default => 0
      t.integer :severity, :default => 0
      t.integer :risk_factor, :default => 0
      t.text :synopsis
      t.text :description
      t.text :solution
      t.text :output
      t.belongs_to :report_host
      t.belongs_to :plugin

      t.timestamps
    end
  end
end
