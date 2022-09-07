class ReportHost < ApplicationRecord
    serialize :props, JSON

    belongs_to :report
    has_many :report_items
end
