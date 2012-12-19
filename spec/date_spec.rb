# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe Darian::Date do

  before do
    earth = Date.parse('2012-05-16')
    @mars = Darian::Date.from_earth(earth)
  end

  it "should convert Earth time to Mars" do
    @mars.year.should  == 214
    @mars.month.should == 9
    @mars.sol.should   == 17

    @mars.since_epoch.should == 143318
    @mars.week_sol.should    == 3

    @mars.season.should          == 1
    @mars.month_of_season.should == 2
  end

  it "should set month and week sol name" do
    @mars.month_name.should    == 'Aries'
    @mars.week_sol_name.should == 'Sol Martis'
  end

  it "should alias day to sol" do
    @mars.day.should           == @mars.sol
    @mars.week_day.should      == @mars.week_sol
    @mars.week_day_name.should == @mars.week_sol_name
  end

  it "should print mars time" do
    @mars.to_s.should == '214-09-17'
  end

  it "should parse Earth date" do
    Darian::Date.parse_earth('2012-05-16').should == @mars
  end

  it "should compare dates" do
    past   = Darian::Date.parse_earth('2012-05-15')
    same   = Darian::Date.parse_earth('2012-05-16')
    future = Darian::Date.parse_earth('2012-05-17')

    @mars.should >  past
    @mars.should <  future
    @mars.should == same

    @mars.should_not < past
    @mars.should_not > future
  end

end
