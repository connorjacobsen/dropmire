module Dropmire
  class Error < StandardError

    attr_reader :message, :text

    def initialize(message=nil, text=nil)
      super(message)

      @text = text
      @message = "#{message} - #{text}"
    end

    def to_s
      "Error: #{@message}"
    end
  end
end