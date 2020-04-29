class QueryLogsController < ApplicationController
  helper_method :query_logs

  def index; end

  def query_logs
    @query_logs = QueryLog.all
  end
end
