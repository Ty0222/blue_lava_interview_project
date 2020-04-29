require "rails_helper"

RSpec.describe QueryLog, type: :model do
  describe ".log" do
    it "logs query data" do
      expect { QueryLog.log(query: "QUERY", response: "RESPONSE", response_source: "SOURCE")
      }.to change { QueryLog.count }.by 1
    end
  end
end
