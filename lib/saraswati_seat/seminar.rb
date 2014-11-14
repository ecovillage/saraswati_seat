# encoding: UTF-8
require 'roar/decorator'
require 'roar/representer/json'
require 'roar/representer/feature/client'

module SaraswatiSeat
  class Seminar < Roar::Decorator
    include Roar::Representer::JSON
    include Roar::Representer::Feature::Client
  
    property :doc_id, as: :_id
  
    nested :g_meta do
      property :type, :getter => lambda {|v| 'slseminar_seminar'}
    end
  
    nested :g_value do
      property :title
      property :attendees_maximum
      property :attendees_minimum
      property :attendee_preconditions
      property :please_bring
      property :description, as: :description_long
      property :start_date, as: :date_from, :getter => lambda {|d| start_date.strftime('%d.%m.%Y')}
      property :end_date, as: :date_to, :getter => lambda {|d| end_date.strftime('%d.%m.%Y')}
      property :start_time
      property :end_time
  
      property :cancellation_time, as: :not_enough_attendees_cancel_date
      property :cancellation_reason, as: :not_enough_attendees_cancel_comment
      property :room
      property :infrastructure, as: :infrastructure, :getter => lambda {|v| "#{[room_material, room_extras].compact.join(', ')}"}
      property :participants_housing, as: :comment_attendee_housing
  
      property :royalty_participant, as: :cost_adult_normal_royalties
      property :royalty_participant_reduced, as: :cost_adult_reduced_royalties
      property :material_cost, as: :cost_material
  
      property :payment_royalties, as: :cost_comment_internal
  
      property :origin_id, as: :neseri_origin_id
      property :regional_slot_booking_id
  
      property :tour_without_regional_slot, as: :tour_without_regional_slot, :getter => lambda {|v| true }
      property :regional_slot, as: :regional_slot, :getter => lambda {|v| true }

      # TODO missing
      # Organizer/Veranstalter
      # Leitung/Zust. GIS
      # Status
  
      property :material_cost, as: :cost_material
  
      property :cancel_conditions, :getter => lambda {|v| "Bei Rücktritt bis 28 Tage vor Seminarbeginn: keine Rücktrittsgebühr. Bei Rücktritt 28-14 Tage vor Seminarbeginn: 50 Eur Rücktrittsgebühr pro Person. Bei Rücktritt ab dem 14. Tag vor Seminarbeginn ist der volle Teilnahmebeitrag inkl. Unterkunftskosten zu zahlen. Bei Rücktritt ab 7 Tage vor Seminarbeginn oder Nichtteilnahme ohne Abmeldung ist der volle Teilnahmebeitrag inkl. Unterkunfts- und Verpflegungskosten zu zahlen. "}
  
      # This is a list, indeed, TODO render_empty: false might help
      property :instructor_hash, as: :referees, :getter => lambda {|v| instructor_hash.values }
      property :web_notice_array, as: :web_notice_array, :getter => lambda {|v| web_notice_array }
    end
  end
end

