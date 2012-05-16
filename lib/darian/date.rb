# encoding: utf-8
=begin
Darian Mars calendar date converter.

Copyright (C) 2012 Andrey “A.I.” Sitnik <andrey@sitnik.ru>,
sponsored by Evil Martians.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end

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
      time = ::Time.parse(date.to_s + " 00:00:00")
      Darian::Time.from_earth(time).to_date
    end

    # Create martian date by martian time.
    def initialize(time)
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
