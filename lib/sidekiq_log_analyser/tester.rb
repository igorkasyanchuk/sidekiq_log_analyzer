module SidekiqLogAnalyser
  class Tester
    def Tester.run
      log_file    = LogFile.new("sample/sidekiq.log")
      simple_stat = SimpleStat.new(log_file.lines)
      puts simple_stat.report
    end
  end
end
