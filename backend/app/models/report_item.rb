class ReportItem < ApplicationRecord
    enum protocol: %i(tcp udp icmp), _suffix: true
    enum severity: %i(informational low medium high critical), _suffix: true
    enum risk_factor: %i(none low medium high critical), _suffix: true
    
    belongs_to :report_host
    belongs_to :plugin

    paginates_per 30
end
