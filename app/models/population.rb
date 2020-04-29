class Population < ApplicationRecord

  def self.min_year
    Population.all.map(&:year).min.year
  end

  def self.get(year)
    return 0 if year.to_i < min_year

    target_date = Date.new(year.to_i)
    min_date = Date.new(min_year)
    population = Population.where(year: min_date..target_date)
                           .order(year: :asc)
                           .last
                           .population

    population
  end

end
