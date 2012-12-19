# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe Darian::Time do

  before do
    earth = Time.parse('2012-05-16 10:00:00 UTC')
    @mars = Darian::Time.from_earth(earth)
  end

  it "should convert Earth time to Mars" do
    @mars.year.should  == 214
    @mars.month.should == 9
    @mars.sol.should   == 17
    @mars.hour.should  == 15
    @mars.min.should   == 7
    @mars.sec.should   == 17

    @mars.since_epoch.should == 143318.630064585
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
    @mars.to_s.should == '214-09-17 15:07:17'
  end

  it "should convert to date" do
    date = @mars.to_date
    date.should be_a(Darian::Date)
    date.to_s.should == '214-09-17'
  end

  it "should parse Earth time" do
    str = '2012-05-16 10:00:00 UTC'
    Darian::Time.parse_earth(str).should == @mars
  end

  it "should compare times" do
    past   = Darian::Time.parse_earth('2012-05-16 09:59:59 UTC')
    same   = Darian::Time.parse_earth('2012-05-16 10:00:00 UTC')
    future = Darian::Time.parse_earth('2012-05-16 10:00:01 UTC')

    @mars.should >  past
    @mars.should <  future
    @mars.should == same

    @mars.should_not < past
    @mars.should_not > future
  end

end
