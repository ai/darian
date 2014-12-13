# Darian Mars Calendar Converter [![Build Status](https://travis-ci.org/ai/darian.svg)](https://travis-ci.org/ai/darian)

This is Ruby library to convert Earth time to Mars time in Darian calendar.

The [Darian calendar] is a proposed system of time-keeping on the planet Mars.
It was created by aerospace engineer and political scientist Thomas Gangale
in 1985. This library use 2002 version of calendar with Telescopic Epoch
(1609 instead of 1975 year in original calendar propose).

Based on [JS converter] by Thomas Gangale.

<a href="https://evilmartians.com/?utm_source=darian">
<img src="https://evilmartians.com/badges/sponsored-by-evil-martians.svg" alt="Sponsored by Evil Martians" width="236" height="54">
</a>

[Darian calendar]: http://en.wikipedia.org/wiki/Darian_calendar
[JS converter]: http://pweb.jps.net/~tgangale/mars/converter/calendar_clock.htm

## Usage

```ruby
require 'darian'

earth_time = Time.now
mars_time  = Darian.from_earth(earth_time)

mars_time.to_s #=> "214-09-17 15:07:17"

mars_time.year  #=> 214
mars_time.month #=> 9
mars_time.sol   #=> 17
mars_time.day   #=> 17

mars_time.month_name    #=> "Aries"
mars_time.week_sol_name #=> "Sol Martis"

earth_date = Date.today
mars_date  = Darian.from_earth(earth_date)
```
