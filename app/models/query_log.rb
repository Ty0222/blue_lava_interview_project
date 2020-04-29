class QueryLog < ApplicationRecord
  has_many :population_query_logs, inverse_of: :query_log
  has_many :populations, through: :population_query_logs

  def self.log(query:, response:, response_source: nil)
    new(query: query, response: response, response_source: response_source).tap do |record|
      record.save
    end
  end
end
