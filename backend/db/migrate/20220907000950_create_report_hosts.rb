class CreateReportHosts < ActiveRecord::Migration[6.1]
  def change
    create_table :report_hosts do |t|
      t.string :name
      t.belongs_to :report
      t.text :props, :default => "{}"

      t.timestamps
    end
  end
end
