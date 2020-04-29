class Population < ApplicationRecord
  KNOWN_YEARS = [1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990]

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
