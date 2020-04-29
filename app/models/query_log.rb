class QueryLog < ApplicationRecord
  def self.log(query:, response:)
    new(query: query, response: response).save
  end
end
