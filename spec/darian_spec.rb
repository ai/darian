# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe Darian do

  it "should return own version" do
    Darian::VERSION.should be_a(String)
  end

  it "should convert by argument class" do
    Darian.from_earth(Time.now).should be_a(Darian::Time)
    Darian.from_earth(DateTime.now).should be_a(Darian::Time)
    Darian.from_earth(Date.today).should be_a(Darian::Date)
  end

end
