# encoding: utf-8

module Darian
  # Darian Mars calendar date converter.
  #
  #   mars = Darian::Date.from_earth(Date.today)
  #   puts mars
  #   puts mars.month_name
  class Date
    include DateMethods

    # Return Mars date converted from Earth date.
    #
    #   Darian.from_earth(Date.today)
    def self.from_earth(date)
      time = ::Time.parse(date.to_s + " 00:00:00 UTC")
      Darian::Time.from_earth(time).to_date
    end

    # Parse Earth date and convert to Mars date.
    # Shortcut for `Darian::Date.from_earth(Date.parse(string))`.
    def self.parse_earth(string)
      self.from_earth(::Date.parse(string))
    end

    # Create martian date by martian time.
    def initialize(time)
      @since_epoch = time.since_epoch.floor

      @year     = time.year
      @month    = time.month
      @sol      = time.sol
      @week_sol = time.week_sol

      @season          = time.season
      @sol_of_season   = time.sol_of_season
      @month_of_season = time.month_of_season
    end

    # Printable string of martian date.
    def to_s
      sprintf '%d-%02d-%02d', @year, @month, @sol
    end
  end
end
