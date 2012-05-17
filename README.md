# Darian Mars Calendar Converter

This is Ruby library to convert Earth time to Mars time in Darian calendar.

The [Darian calendar] is a proposed system of time-keeping on the planet Mars.
It was created by aerospace engineer and political scientist Thomas Gangale
in 1985. This library use 2002 version of calendar with Telescopic Epoch
(1609 instead of 1975 year in original calendar propose).

Based on [JS converter] by Thomas Gangale.

Sponsored by [Evil Martians].

[Darian calendar]: http://en.wikipedia.org/wiki/Darian_calendar
[JS converter]: http://pweb.jps.net/~tgangale/mars/converter/calendar_clock.htm
[Evil Martians]: http://evilmartians.com/

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

## License

Library is licensed under the GNU Lesser General Public License version 3.
See the LICENSE file or http://www.gnu.org/licenses/lgpl.html.

## Author

Andrey “A.I.” Sitnik <andrey@sitnik.ru>
