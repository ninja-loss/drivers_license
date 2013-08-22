module DriversLicense

  class License

    attr_reader :state, :number, :expires_on

    def initialize( *args )
      if args.size == 2
        state_and_number = args.first
      else
        state_and_number = [args[0],
                            args[1]].reject( &:blank? ).
                                              join( '' )
      end

      expires_on = args.last

      unless state_and_number.blank?
        @state  = state_and_number[0..1]
        @number = state_and_number[2..state_and_number.size-1]
      end

      @expires_on = expires_on

      self.freeze
    end

    def expired?
      !expires_on.blank? && Time.zone.now >= expires_on
    end

    def description
      [state, number].reject( &:blank? ).
                      join( ' ' )
    end

    def for_query
      [state, number].reject( &:blank? ).
                      join( '' )
    end

    def to_s( pattern='' )
      if pattern.empty?
        description
      elsif pattern == :query
        for_query
      end
    end

  end

end
