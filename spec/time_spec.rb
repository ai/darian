# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe Darian::Time do

  before do
    earth = Time.parse('2012-05-16 10:00:00 UTC')
    @mars = Darian::Time.from_earth(earth)
  end

  it "should convert Earth time to Mars" do
    expect(@mars.year).to  eq 214
    expect(@mars.month).to eq   9
    expect(@mars.sol).to   eq  17
    expect(@mars.hour).to  eq  15
    expect(@mars.min).to   eq   7
    expect(@mars.sec).to   eq  17

    expect(@mars.since_epoch).to eq 143318.630064585
    expect(@mars.week_sol).to eq    3

    expect(@mars.season).to          eq 1
    expect(@mars.month_of_season).to eq 2
  end

  it "should set month and week sol name" do
    expect(@mars.month_name).to    eq 'Aries'
    expect(@mars.week_sol_name).to eq 'Sol Martis'
  end

  it "should alias day to sol" do
    expect(@mars.day).to           eq @mars.sol
    expect(@mars.week_day).to      eq @mars.week_sol
    expect(@mars.week_day_name).to eq @mars.week_sol_name
  end

  it "should print mars time" do
    expect(@mars.to_s).to eq '214-09-17 15:07:17'
  end

  it "should convert to date" do
    date = @mars.to_date
    expect(date).to be_a(Darian::Date)
    expect(date.to_s).to eq  '214-09-17'
  end

  it "should parse Earth time" do
    str = '2012-05-16 10:00:00 UTC'
    expect(Darian::Time.parse_earth(str)).to eq @mars
  end

  it "should compare times" do
    past   = Darian::Time.parse_earth('2012-05-16 09:59:59 UTC')
    same   = Darian::Time.parse_earth('2012-05-16 10:00:00 UTC')
    future = Darian::Time.parse_earth('2012-05-16 10:00:01 UTC')

    expect(@mars).to be > past
    expect(@mars).to be < future
    expect(@mars).to eq same

    expect(@mars).not_to be < past
    expect(@mars).not_to be > future
  end

end
