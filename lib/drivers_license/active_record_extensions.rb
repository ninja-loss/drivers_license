module DriversLicense

  module ActiveRecordExtensions

    def self.included( base )
      base.extend ActsMethods
    end

    module ActsMethods

      def drivers_license( *args )
        unless included_modules.include? InstanceMethods
          self.class_eval { extend ClassMethods }
          include InstanceMethods
        end

        options = args.extract_options!
        initialize_compositions( args, options )
      end
      alias_method :drivers_licenses, :drivers_license

    end

    module ClassMethods

      def initialize_compositions( attrs, options )
        if options[:single_field]
          attrs.each do |attr|
            composed_of attr,
                        :class_name => 'DriversLicense::License',
                        :mapping => [["#{attr}_state_and_number", 'state_and_number'],
                                     ["#{attr}_expires_on", "expires_on"]] #,
                        #:converter => :convert,
                        #:allow_nil => true
          end
        else
          attrs.each do |attr|
            composed_of attr,
                        :class_name => "DriversLicense::License",
                        :mapping => [["#{attr}_state", "state"],
                                     ["#{attr}_number", "number"],
                                     ["#{attr}_expires_on", "expires_on"]] #,
                        #:converter => :convert,
                        #:allow_nil => true
          end
        end
      end

    end

    module InstanceMethods

    end

  end

end
