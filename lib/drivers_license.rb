require "drivers_license/version"

module DriversLicense

  autoload :ActiveRecordExtensions, "drivers_license/active_record_extensions"
  autoload :License,                "drivers_license/license"

end

ActiveRecord::Base.send( :include, DriversLicense::ActiveRecordExtensions ) if defined?( ActiveRecord::Base )
