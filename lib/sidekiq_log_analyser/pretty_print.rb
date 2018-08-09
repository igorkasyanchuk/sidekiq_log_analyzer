module SidekiqLogAnalyser
  class PrettyPrint
    SUMMARY_REPORT_TITLE = 'Summary'.colorize(:green)
    AVG_REPORT_TITLE     = 'Avg Performance / Time'.colorize(:green)

    def PrettyPrint.print_summary_report(report)
      table = Terminal::Table.new title: SUMMARY_REPORT_TITLE, headings: ['Worker', 'Count'] do |t|
        report.each do |k, v|
          t.add_row [k, v]
        end
      end
      puts(table)
      puts
      puts
    end

    def PrettyPrint.print_avg_report(report)
      table = Terminal::Table.new title: AVG_REPORT_TITLE, headings: ['Worker', 'Avg (sec)'] do |t|
        report.each do |k, v|
          t.add_row [k, v.round(2)]
        end
      end
      puts(table)
      puts
      puts
    end

    def PrettyPrint.print_timeline_report(report)
      report.each do |worker, data|
        table = Terminal::Table.new title: worker.colorize(:green), headings: ['Worker', 'Count', 'Avg (sec)'] do |t|
          data.each do |datetime, info|
            t.add_row [datetime.strftime('%d-%m-%Y %H:%M'), info[:count], info[:avg].round(2)]
          end
        end
        puts(table)
        puts
        puts
      end
    end

  end
end
