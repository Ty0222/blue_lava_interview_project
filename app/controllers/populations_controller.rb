class PopulationsController < ApplicationController
  def index
  end

  def show
    @year = params[:year].to_i
    @population = Population.get(@year)
    query_log = log_query_and_response
    log_request_for_known_populations(query_log)
  rescue
    log_query_and_response
  end

  private

  def log_query_and_response
    exception = $!
    return QueryLog.log(query: @year, response: exception) if exception
    QueryLog.log(query: @year, response: @population, response_source: population_source)
  
  end

  def log_request_for_known_populations(request)
    if Population::KNOWN_YEARS.include?(@year)
      population_record = Population.find_by(year: Date.new(@year))
      population_record.requests << request
    end
  end

  def population_source
    return "exact" if Population::KNOWN_YEARS.include?(@year)
    "calculated"
  end
end
