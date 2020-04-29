class QueryLogsController < ApplicationController
  helper_method :query_logs

  def index; end

  private

  def query_logs
    @query_logs = QueryLog.all
  end
end
