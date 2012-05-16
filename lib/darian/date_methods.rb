module Darian
  module DateMethods
    attr_reader :year
    attr_reader :month
    attr_reader :sol

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
  end
end
