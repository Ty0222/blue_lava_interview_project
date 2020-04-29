require "rails_helper"

RSpec.describe "query_logs/_population_requests.html.erb", type: :view do
  it "displays user population requests data" do
    population = Population.first
    query_log = QueryLog.log(query: "QUERY", response: "RESPONSE", response_source: "SOURCE")
    population.requests << query_log

    render partial: "query_logs/population_requests.html.erb", locals: { populations: Population.includes(:requests) }

    expect(rendered).to have_content("Known Population Requests")
    expect(rendered).to have_css("th", text: "Population Year")
    expect(rendered).to have_css("th", text: "Number of Requests")
    expect(rendered).to have_css("td", text: "1900")
    expect(rendered).to have_css("td", text: "1")
  end
end
