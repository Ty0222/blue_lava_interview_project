require "rails_helper"

RSpec.describe QueryLog, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:population_query_logs) }
    it { is_expected.to have_many(:populations).through(:population_query_logs) }
  end

  describe ".log" do
    it "logs query data" do
      expect { QueryLog.log(query: "QUERY", response: "RESPONSE", response_source: "SOURCE")
      }.to change { QueryLog.count }.by 1
    end
  end
end
