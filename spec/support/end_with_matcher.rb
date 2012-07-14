module EndWithMatcher
  class EndWith
    def initialize(expected)
      @expected = expected
    end

    def matches?(target)
      @target = target
      @target =~ /#{@expected}$/
    end

    def failure_message
      "expected <#{to_string(@target)}> to " +
      "end with <#{to_string(@expected)}>"
    end

    def negative_failure_message
      "expected <#{to_string(@target)}> not to " +
      "end with <#{to_string(@expected)}>"
    end

    # Returns string representation of an object.
    def to_string(value)
      # indicate a nil
      if value.nil?
        'nil'
      end

      # join arrays
      if value.class == Array
        return value.join(", ")
      end

      # otherwise return to_s() instead of inspect()
      return value.to_s
    end
  end

  # Actual matcher that is exposed.
  def end_with(expected)
    EndWith.new(expected)
  end
end
