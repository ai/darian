# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe Darian do
  before do
    @mars = Darian.from_earth(Time.parse('2012-05-16 10:44:22 UTC'))
  end

  it "should convert Earch time to Mars" do
    @mars.year.should  == 214
    @mars.month.should == 9
    @mars.sol.should   == 17
    @mars.hour.should  == 15
    @mars.min.should   == 50
    @mars.sec.should   == 28

    @mars.week_sol.should == 3

    @mars.season.should          == 1
    @mars.month_of_season.should == 2
  end

  it "should set month name" do
    @mars.month_name.should == 'Aries'
  end

  it "should set week sol name" do
    @mars.week_sol_name.should == 'Sol Martis'
  end

  it "should alias day to sol" do
    @mars.day.should == @mars.sol
    @mars.week_day.should == @mars.week_sol
    @mars.week_day_name.should == @mars.week_sol_name
  end

end
