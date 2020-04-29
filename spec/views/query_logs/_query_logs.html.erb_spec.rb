require "rails_helper"

RSpec.describe "query_logs/_query_logs.html.erb", type: :view do
  it "displays logged query request and response data" do
    QueryLog.log(query: "QUERY", response: "RESPONSE", response_source: "SOURCE")

    render partial: "query_logs/query_logs.html.erb", locals: { query_logs: QueryLog.all }

    expect(rendered).to have_content("Query Logs")
    expect(rendered).to have_css("th", text: "Query")
    expect(rendered).to have_css("th", text: "Response")
    expect(rendered).to have_css("th", text: "Response Source")
    expect(rendered).to have_css("td", text: "QUERY")
    expect(rendered).to have_css("td", text: "RESPONSE")
    expect(rendered).to have_css("td", text: "SOURCE")
  end
end
