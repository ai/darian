# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe Darian::Date do

  before do
    earth = Date.parse('2012-05-16')
    @mars = Darian::Date.from_earth(earth)
  end

  it "should convert Earth time to Mars" do
    expect(@mars.year).to  eq 214
    expect(@mars.month).to eq   9
    expect(@mars.sol).to   eq  17

    expect(@mars.since_epoch).to eq 143318
    expect(@mars.week_sol).to    eq 3

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
    expect(@mars.to_s).to eq '214-09-17'
  end

  it "should parse Earth date" do
    expect(Darian::Date.parse_earth('2012-05-16')).to eq @mars
  end

  it "should compare dates" do
    past   = Darian::Date.parse_earth('2012-05-15')
    same   = Darian::Date.parse_earth('2012-05-16')
    future = Darian::Date.parse_earth('2012-05-17')

    expect(@mars).to be > past
    expect(@mars).to be < future
    expect(@mars).to eq same

    expect(@mars).to_not be < past
    expect(@mars).to_not be > future
  end

end
