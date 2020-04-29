class QueryLog < ApplicationRecord
  def self.log(query:, response:, response_source: nil)
    new(query: query, response: response, response_source: response_source).save
  end
end
