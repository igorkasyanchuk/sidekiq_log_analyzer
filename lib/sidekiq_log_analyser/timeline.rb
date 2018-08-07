module SidekiqLogAnalyser
  class Timeline
    def Timeline.timeline(collection)
      result = {}
      collection.group_by{|metadata| metadata[:datetime].strftime("%d-%m-%Y %H:%M")}.each do |datetime, data|
        result[datetime] = data.count
      end
      result
    end
  end
end
