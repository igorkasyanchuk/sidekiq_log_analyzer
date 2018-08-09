module SidekiqLogAnalyser
  class Statistics
    attr_reader :collection

    def initialize(collection)
      @collection = collection
    end

    def total
      with_collection { |worker, data| data.count }
    end

    def avg
      with_collection do |worker, data|
        data.sum{|metadata| metadata[:duration]}.to_f / data.length
      end
    end

    def timeline
      with_collection { |worker, data| Timeline.timeline(data) }
    end

    private

    def with_collection
      result = {}
      raw    = end_collection
      raw.each do |worker, data|
        result[worker] = yield(worker, data)
      end
      result
    end

    def start_collection; collection.start_collection; end
    def end_collection; collection.end_collection; end

  end
end
