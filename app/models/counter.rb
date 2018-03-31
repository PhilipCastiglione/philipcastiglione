# == Schema Information
#
# Table name: counters
#
#  id         :uuid             not null, primary key
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Counter is useful for counting things. A toy for tracking state.
class Counter < ApplicationRecord
  def self.singleton
    if Counter.any?
      Counter.first
    else
      Counter.create(count: 0)
    end
  end

  def increment
    update_attribute(:count, count + 1)
  end
end
