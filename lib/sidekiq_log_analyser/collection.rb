module SidekiqLogAnalyser
  class Collection
    attr_reader :collection
    attr_reader :start_collection, :end_collection

    def initialize(lines)
      @from_date = 1.month.ago
      populate(lines)
    end

    def populate(lines)
      @collection = []
      lines.each do |line|
        row = Row.new(line)
        if row.valid?
          metadata = row.metadata
          @collection << metadata if in_range?(metadata[:datetime])
        end
      end
      @start_collection ||= collection(:start).group_by{|metadata| metadata[:worker]}
      @end_collection   ||= collection(:end).group_by{|metadata| metadata[:worker]}
      @collection         = []
    end

    private

    def in_range?(datetime)
      return false if datetime.blank?

      @from_date < datetime
    end

    def collection(type)
      @collection.select{|metadata| metadata[:type] == type}
    end

  end
end
