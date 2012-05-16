# encoding: utf-8
=begin
Main file to load all neccessary classes for Darian Mars calendar.

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

dir = File.join(File.dirname(__FILE__), 'darian')
require File.join(dir, 'version')
require File.join(dir, 'date_methods')
require File.join(dir, 'time')
require File.join(dir, 'date')

# Darian Mars calendar.
#
#   mars_time = Darian.from_earth(earth_time)
module Darian
  class << self

    # Convert `arg` to martian time or date, depend on `arg` class.
    def from_earth(arg)
      if arg.is_a? ::Time
        Darian::Time.from_earth(arg)
      elsif arg.is_a? ::DateTime
        Darian::Time.from_earth(::Time.parse(arg.to_s))
      elsif arg.is_a? ::Date
        Darian::Date.from_earth(arg)
      else
        raise ArgumentError, "Can't convert #{arg.class} to martian time or date"
      end
    end

  end
end
