class Population < ApplicationRecord
  KNOWN_YEARS = [1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990]

  def self.min_year
    Population.all.map(&:year).min.year
  end

  def self.get(year)
    return 0 if year.to_i < min_year
    return Population.order(year: :asc).last.population if year.to_i > KNOWN_YEARS.last
    return Population.find_by(year: Date.new(year.to_i)).population if KNOWN_YEARS.include?(year.to_i)
    population_for_unknown_year(year)
  end

  private

  def self.population_for_unknown_year(year)
    population_of_previously_known_year = Population.find_by(year: Date.new(known_year_before_date(year))).population
    population_increase_since_previously_known_year =
      population_between_known_years_around_date(year) * date_as_percentage_between_known_years(year)

    (population_of_previously_known_year + population_increase_since_previously_known_year).round
  end

  def self.date_as_percentage_between_known_years(year)
    # This returns the percentage of the way our target year is between its closest surrounding known years.
    # For example, if our year is 1955, this method would return 0.50 as it is halfway between its surrounding
    # known years of 1950 and 1960.
    (year - known_year_before_date(year)).to_f / 10
  end

  def self.population_between_known_years_around_date(year)
    before_date, after_date = known_years_around_date(year)
    Population.where(year: [Date.new(before_date), Date.new(after_date)])
              .order(population: :desc)
              .pluck(:population)
              .reduce(:-)
  end

  def self.known_year_before_date(year)
    known_years_around_date(year).first
  end

  def self.known_year_after_date(year)
    known_years_around_date(year).last
  end

  def self.known_years_around_date(year)
    known_year_before_date = nil
    known_year_after_date = nil

    KNOWN_YEARS.each do |known_year|
      known_year_before_date = known_year if known_year < year.to_i
      known_year_after_date = known_year if known_year > year.to_i
      break if known_year_after_date
    end

    [known_year_before_date, known_year_after_date]
  end

end
