module SidekiqLogAnalyser
  class SimpleStat
    extend Forwardable

    attr_reader :collection

    def_delegator :collection, :start_collection
    def_delegator :collection, :end_collection

    def initialize(collection)
      @collection = collection
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
