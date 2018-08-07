module SidekiqLogAnalyser
  class SimpleStat
    attr_reader :stats

    def initialize(lines)
      @stats = []
      lines.each do |line|
        row = Row.new(line)
        if row.valid?
          @stats << row.metadata
        end
      end
    end

    def report
      {
        total: total,
        avg: avg,
        timeline: timeline
      }
    end

    private

    def collection(type)
      @stats.select{|metadata| metadata[:type] == type}
    end

    def end_collection
      @end_collection ||= collection(:end).group_by{|metadata| metadata[:worker]}
    end

    def total
      result = {}
      raw    = end_collection
      raw.each do |worker, data|
        result[worker] = data.count
      end
      result
    end

    def avg
      result = {}
      raw    = end_collection
      raw.each do |worker, data|
        result[worker] = data.sum{|metadata| metadata[:duration]}.to_f / data.length
      end
      result
    end

    def timeline
      result = {}
      raw    = end_collection
      raw.each do |worker, data|
        result[worker] = Timeline.timeline(data)
      end
      result
    end
  end
end
