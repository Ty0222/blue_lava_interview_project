require "rails_helper"

RSpec.describe "query_logs/_query_logs.html.erb", type: :view do
  it "displays logged query request and response data" do
    QueryLog.log(query: "QUERY", response: "RESPONSE")

    render partial: "query_logs/query_logs.html.erb", locals: { query_logs: QueryLog.all }

    expect(rendered).to have_content("Query Logs")
    expect(rendered).to have_content("Query")
    expect(rendered).to have_content("Response")
    expect(rendered).to have_content("QUERY")
    expect(rendered).to have_content("RESPONSE")
  end
end
