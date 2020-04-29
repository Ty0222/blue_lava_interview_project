class PopulationsController < ApplicationController
  def index
  end

  def show
    @year = params[:year]
    @population = Population.get(@year)
    QueryLog.log(query: @year, response: @population, response_source: population_source)
  rescue => e
    QueryLog.log(query: @year, response: e)
  end

  def population_source
    return "exact" if Population::KNOWN_YEARS.include?(@year.to_i)
    "calculated"
  end
end
