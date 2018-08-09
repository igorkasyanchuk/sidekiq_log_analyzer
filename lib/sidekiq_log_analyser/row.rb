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

    def valid?
      start? || end?
    end

    def metadata
      @metadata ||= begin
        if start?
          {
            datetime: Time.parse(start_match[1]),
            worker: start_match[3].split(' ').last,
            job_id: start_match[4],
            type: :start
          }
        elsif end?
          {
            datetime:  Time.parse(end_match[1]),
            worker: end_match[3].split(' ').last,
            job_id: end_match[4],
            duration: end_match[5].to_f,
            type: :end
          }
        else
          {}
        end
      end
    end

  end
end
