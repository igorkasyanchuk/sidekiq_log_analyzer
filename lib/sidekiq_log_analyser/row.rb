module SidekiqLogAnalyser
  class Row
    attr_reader :row, :start_match, :end_match

    def initialize(row)
      @row         = "#{row}"
      @start_match = @row.match(/(.*Z) (.*) (T.*) (J.*) INFO: start/)
      @end_match   = @row.match(/(.*Z) (.*) (T.*) (J.*) INFO: done: (.*) sec/)
    end

    def start?
      start_match != nil && start_match.length > 0
    end

    def end?
      end_match != nil && end_match.length > 0
    end

  end  
end
