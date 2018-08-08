module SidekiqLogAnalyser
  class App
    def App.run(filename)
      log_file    = LogFile.new(filename)
      collection  = Collection.new(log_file.lines)
      statistics  = SimpleStat.new(collection)

      PrettyPrint.print_summary_report(statistics.total)
      PrettyPrint.print_avg_report(statistics.avg)
      PrettyPrint.print_timeline_report(statistics.timeline)

      nil
    end
  end
end


def ttt
  SidekiqLogAnalyser::App.run("sample/small.log")
end