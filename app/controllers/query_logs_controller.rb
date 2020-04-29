class QueryLogsController < ApplicationController
  helper_method :query_logs, :populations

  def index; end

  private

  def populations
    @populations = Population.includes(:requests)
  end

  def query_logs
    @query_logs = QueryLog.all
  end
end
