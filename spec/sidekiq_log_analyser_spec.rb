require "spec_helper"

describe SidekiqLogAnalyser do
  it "has a version number" do
    expect(SidekiqLogAnalyser::VERSION).not_to be nil
  end
end
