module SidekiqLogAnalyser
  class Collection
    attr_reader :collection
    attr_reader :start_collection, :end_collection

    def initialize(lines)
      populate(lines)
    end

    def populate(lines)
      @collection = []
      lines.each do |line|
        row = Row.new(line)
        if row.valid?
          @collection << row.metadata
        end
      end
      @start_collection ||= collection(:start).group_by{|metadata| metadata[:worker]}
      @end_collection   ||= collection(:end).group_by{|metadata| metadata[:worker]}
    end

    private

    def collection(type)
      @collection.select{|metadata| metadata[:type] == type}
    end

  end
end
