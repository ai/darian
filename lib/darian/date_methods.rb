# encoding: utf-8
=begin
Common date methods for Time and Date classes.

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
  # Common date methods for Time and Date classes.
  module DateMethods
    include Comparable

    attr_reader :year
    attr_reader :month
    attr_reader :sol

    attr_reader :since_epoch
    attr_reader :week_sol
    attr_reader :season
    attr_reader :sol_of_season
    attr_reader :month_of_season

    alias :day      :sol
    alias :week_day :week_sol

    def month_name
      case @month
        when  1 then 'Sagittarius'
        when  2 then 'Dhanus'
        when  3 then 'Capricornus'
        when  4 then 'Makara'
        when  5 then 'Aquarius'
        when  6 then 'Kumbha'
        when  7 then 'Pisces'
        when  8 then 'Mina'
        when  9 then 'Aries'
        when 10 then 'Mesha'
        when 11 then 'Taurus'
        when 12 then 'Rishabha'
        when 13 then 'Gemini'
        when 14 then 'Mithuna'
        when 15 then 'Cancer'
        when 16 then 'Karka'
        when 17 then 'Leo'
        when 18 then 'Simha'
        when 19 then 'Virgo'
        when 20 then 'Kanya'
        when 21 then 'Libra'
        when 22 then 'Tula'
        when 23 then 'Scorpius'
        when 24 then 'Vrishika'
      end
    end

    def week_sol_name
      case @week_sol
        when 1 then 'Sol Solis'
      	when 2 then 'Sol Lunae'
      	when 3 then 'Sol Martis'
      	when 4 then 'Sol Mercurii'
      	when 5 then 'Sol Jovis'
      	when 6 then 'Sol Veneris'
      	when 7 then 'Sol Saturni'
      end
    end
    alias :week_day_name :week_sol_name

    def <=>(another)
      since_epoch <=> another.since_epoch
    end
  end
end
