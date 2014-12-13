# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe Darian do

  it "should return own version" do
    expect(Darian::VERSION).to be_a(String)
  end

  it "should convert by argument class" do
    expect(Darian.from_earth(Time.now)).to     be_a(Darian::Time)
    expect(Darian.from_earth(DateTime.now)).to be_a(Darian::Time)
    expect(Darian.from_earth(Date.today)).to   be_a(Darian::Date)
    expect { Darian.from_earth(1) }.to raise_error(ArgumentError)
  end

  it "should return current time" do
    earth = Time.parse('2012-05-16 10:00:00 UTC')
    expect(Time).to receive(:now).and_return(earth)

    expect(Darian.now).to eq Darian::Time.from_earth(earth)
  end

  it "should return current date" do
    earth = Date.parse('2012-05-16')
    expect(Date).to receive(:today).and_return(earth)

    expect(Darian.today).to eq Darian::Date.from_earth(earth)
  end

end
