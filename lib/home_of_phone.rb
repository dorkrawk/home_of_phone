require_relative "home_of_phone/base"
require_relative "home_of_phone/errors"
require_relative "home_of_phone/tools"
require_relative "home_of_phone/version"

module HomeOfPhone
  def self.new(preload_phonemes: true)
    HomeOfPhone::Base.new(preload_phonemes: preload_phonemes)
  end
end
