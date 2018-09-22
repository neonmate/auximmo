class ServiceState < ActiveRecord::Base

  validates :immobile_identifier, uniqueness: true

  assignable_values_for :state, default: 'new' do
    ['new', 'accepted', 'declined']
  end

  def self.connect_persistent(immobiles)
    immobile_identifiers = immobiles.map(&:immobile_identifier)
    persistent_immobile_identifiers = ServiceState.pluck(:immobile_identifier)
    new_immobile_identifiers = immobile_identifiers - persistent_immobile_identifiers
    new_immobile_identifiers.each do |immobile_identifier|
      ServiceState.create!(immobile_identifier: immobile_identifier, state: 'new')
    end
    update_immobiles(immobiles)
  end

  def self.update_immobiles(immobiles)
    immobile_identifiers = immobiles.map(&:immobile_identifier)
    service_states = ServiceState.where(immobile_identifier: immobile_identifiers)
    immobiles.each do |immobile|
      matching_service_state = service_states.detect do |service_state|
        service_state.immobile_identifier == immobile.immobile_identifier
      end
      immobile.created_at = matching_service_state.created_at
      immobile.state = matching_service_state.state
      immobile.comment = matching_service_state.comment
    end
    immobiles
  end

end