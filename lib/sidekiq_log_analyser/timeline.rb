module SidekiqLogAnalyser
  class Timeline
    def Timeline.timeline(collection)
      result = {}
      collection.group_by_hour{|e| e[:datetime]}.each do |datetime, data|
        result[datetime] = {
          count: data.count,
          avg: data.collect{|ee| ee[:duration]}.sum / data.count
        }
      end
      result
    end
  end
end
