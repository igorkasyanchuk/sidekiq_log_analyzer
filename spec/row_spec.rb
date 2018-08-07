require "spec_helper"

describe SidekiqLogAnalyser::Row do

  let!(:line1) { "row2017-05-31T14:53:37.657Z 7947 TID-98ndc INFO: Booting Sidekiq 4.2.10 with redis options {:url=>nil}" }
  let!(:line2) { "2017-05-31T15:00:05.753Z 7947 TID-sfsls UpdateCountersWorker JID-16a22bc4cb44c2d69ad536a9 INFO: start" }
  let!(:line3) { "2017-05-31T15:00:06.590Z 7947 TID-sfsls UpdateCountersWorker JID-16a22bc4cb44c2d69ad536a9 INFO: done: 0.837 sec" }
  let!(:line4) { "" }
  let!(:line5) { nil }

  it "matches start and end" do
    row1 = SidekiqLogAnalyser::Row.new(line1)
    expect(row1.start?).to eq(false)
    expect(row1.end?).to eq(false)

    row2 = SidekiqLogAnalyser::Row.new(line2)
    expect(row2.start?).to eq(true)
    expect(row2.end?).to eq(false)

    row3 = SidekiqLogAnalyser::Row.new(line3)
    expect(row3.start?).to eq(false)
    expect(row3.end?).to eq(true)

    row4 = SidekiqLogAnalyser::Row.new(line4)
    expect(row4.start?).to eq(false)
    expect(row4.end?).to eq(false)

    row5 = SidekiqLogAnalyser::Row.new(line5)
    expect(row5.start?).to eq(false)
    expect(row5.end?).to eq(false)
  end
end
