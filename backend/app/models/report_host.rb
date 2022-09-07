class ReportHost < ApplicationRecord
    belongs_to :report
    has_many :report_items
end
