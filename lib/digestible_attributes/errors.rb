module DigestibleAttributes
  module Errors
    class DigestFieldError < StandardError
      def initialize(fields)
        @fields = fields

        super("invalid digest field(s): #{fields}")
      end

      attr_reader :fields
    end

    class DigestColumnError < StandardError
      def initialize(column)
        @column = column

        super("invalid digest column: '#{column}'")
      end

      attr_reader :column
    end

    class DigestAlgorithmError < StandardError
      def initialize(algorithm)
        @algorithm = algorithm

        super("invalid digest algorithm: '#{algorithm}'")
      end

      attr_reader :algorithm
    end
  end
end
