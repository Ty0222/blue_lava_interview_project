class PopulationsController < ApplicationController
  def index
  end

  def show
    @year = params[:year]
    @population = Population.get(@year)
    QueryLog.log(query: @year, response: @population)
  rescue => e
    QueryLog.log(query: @year, response: e)
  end
end
