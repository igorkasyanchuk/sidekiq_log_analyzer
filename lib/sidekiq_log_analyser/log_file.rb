module SidekiqLogAnalyser
  class LogFile
    attr_reader :lines

    def initialize(filename)
      @lines = IO.readlines(filename)
    end
  end
end
