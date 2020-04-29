RSpec.describe PopulationQueryLog, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:query_log) }
    it { is_expected.to belong_to(:population) }
    it {is_expected.to validate_presence_of(:query_log_id) }
    it {is_expected.to validate_presence_of(:population_id) }
  end
end