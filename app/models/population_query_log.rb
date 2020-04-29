class PopulationQueryLog < ApplicationRecord
  belongs_to :query_log
  belongs_to :population

  validates_presence_of :query_log_id, :population_id
end
