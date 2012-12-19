# encoding: utf-8
=begin
Darian Mars calendar time converter.

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
  # Darian Mars calendar time converter.
  #
  #   mars = Darian::Time.from_earth(Time.now)
  #   puts mars
  #   puts mars.month_name
  class Time
    MARS_TO_EARTH_DAYS = 1.027491251
    EPOCH_OFFSET       = 587744.77817
    ROUND_UP_SECOND    = 1/86400

    include DateMethods

    attr_reader :hour
    attr_reader :min
    attr_reader :sec

    # Return Mars time converted from Earth time.
    #
    #   Darian.from_earth(Time.now)
    def self.from_earth(time)
      # 719527 is days until 0 year for Unix Epoch
      days = (time.to_i / 86400.0) + 719527
      sols = (days - EPOCH_OFFSET) / MARS_TO_EARTH_DAYS
      self.new(sols)
    end

    # Parse Earth time and convert to Mars time.
    # Shortcut for `Darian::Time.from_earth(Time.parse(string))`.
    def self.parse_earth(string)
      self.from_earth(::Time.parse(string))
    end

    # Create Mars time by sols since 0 year.
    #
    # It is internal contructor. Use `Darian.from_earth`.
    def initialize(sols)
      sD  = (sols / 334296).floor
      doD = (sols - (sD * 334296)).floor

      sC   = 0
      doC  = doD
      sC   = ((doD - 1) / 66859).floor if doD != 0
      doC -= (sC * 66859) + 1 if sC != 0

      sX  = 0
      doX = doC
      if sC != 0 # century that does not begin with leap day
        sX   = ((doC + 1) / 6686).floor
        doX -= sX * 6686 - 1 if sX != 0
      else
        sX   = (doC / 6686).floor
        doX -= sX * 6686 if sX != 0
      end

      sII = 0
      doII = doX
      if sC != 0 and sX == 0 # decade that does not begin with leap day
        sII   = (doX / 1337).floor
        doII -= sII * 1337 if sII != 0
      else  # 1338, 1337, 1337, 1337 …
        sII   = ((doX - 1) / 1337).floor if doX != 0
        doII -= (sII * 1337 + 1) if sII != 0
      end

      sI  = 0
      doI = doII
      if sII == 0 and (sX != 0 or (sX == 0 and sC == 0))
        sI   = (doII / 669).floor
        doI -= 669 if sI != 0
      else # 668, 669
        sI   = ((doII + 1) / 669).floor
        doI -= 668 if sI != 0
      end

      @year = 500 * sD + 100 * sC + 10 * sX + 2 * sII + sI
      @season = if doI < 167
        0
      elsif doI < 334
        1
      elsif doI < 501
        2
      else
        3
      end
      @sol_of_season   = doI - 167 * @season
      @month_of_season = (@sol_of_season / 28).floor

      @month = @month_of_season + 6 * @season + 1

      @sol      = doI - ((@month - 1) * 28 - @season) + 1
      @week_sol = (@sol - 1) % 7 + 1

      hour = (sols - sols.floor) * 24
      min  = (hour - hour.floor) * 60

      @hour = hour.floor
      @min  = min.floor
      @sec  = ((min - min.floor) * 60).floor
    end

    # Printable string of martian time.
    def to_s
      sprintf '%d-%02d-%02d %02d:%02d:%02d',
              @year, @month, @sol, @hour, @min, @sec
    end

    # Return martian date.
    def to_date
      Darian::Date.new(self)
    end
  end
end
