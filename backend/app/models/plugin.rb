class Plugin < ApplicationRecord
    enum check_type: %i(local remote summary combined), _suffix: true
    belongs_to :plugin_family
end
