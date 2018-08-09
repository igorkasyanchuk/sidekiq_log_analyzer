module SidekiqLogAnalyser
  class App
    def App.run(filename)
      log_file    = LogFile.new(filename)
      collection  = Collection.new(log_file.lines)
      statistics  = Statistics.new(collection)

      print "\nSidekiq log analyser report (30 days) ".colorize(:cyan)
      3.times do
        print '.'.colorize(:yellow)
        sleep(0.5)
      end
      puts
      puts

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