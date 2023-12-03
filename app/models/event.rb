class Event < ApplicationRecord
  belongs_to :booker, class_name: 'User'
  belongs_to :adl, class_name: 'User'
  belongs_to :tdl, class_name: 'User'
  belongs_to :organizer
  has_and_belongs_to_many :rooms

  has_many :attachments, -> { where type: 'file' }, as: :attachable, dependent: :destroy

  enum event_type: %i[concert corporate_event closed_event big_event public_event]
  enum invoice_status: %i[open no_invoice ready_for_invoice invoiced paid]
  enum get_in: %i[beer_garden beer_garden_side ost_side gate_one gate_two]
  enum fire_place: %i[no yes optional]
  enum catering: %i[no_catering internal external]
  enum cloakroom: %i[poststation aquarium ueberlauf_ssal ueberlauf_kazi event_kitchen galerie_saal galerie_kazi]
end
