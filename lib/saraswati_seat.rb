# encoding: UTF-8
require "saraswati_seat/version"
require "saraswati_seat/seminar"

require 'ostruct'

module SaraswatiSeat
  def self.get_seminar uri, base=OpenStruct.new
    Seminar.new(base).get(uri: uri, as: 'application/json')
  end
end
