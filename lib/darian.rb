# encoding: utf-8

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

    # Return current Mars time. Shortcut for `Darian.from_earth(Time.now)`.
    def now
      Darian::Time.from_earth(::Time.now)
    end

    # Return current Mars date. Shortcut for `Darian.from_earth(Date.today)`.
    def today
      Darian::Date.from_earth(::Date.today)
    end

  end
end
