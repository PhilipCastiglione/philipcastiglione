# Common behaviour for records.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
