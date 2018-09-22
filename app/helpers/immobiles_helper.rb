module ImmobilesHelper

  def city_region(immobile)
    city_region = maybe_blank(PostalCodeMapper.new(immobile.postal_code).city_region)
    simple_format(city_region)
  end

  def state_label(immobile)
    new_class, relevant_class, declined_class = if immobile.state == 'new'
              ['btn btn-info', 'btn btn-default', 'btn btn-default']
            elsif immobile.state == 'accepted'
              ['btn btn-default', 'btn btn-success', 'btn btn-default']
            elsif immobile.state == 'declined'
              ['btn btn-default', 'btn btn-default', 'btn btn-danger']
            else
              raise 'Invalid state: Not in new, acceppted and declined'
            end
    content_tag(:div, class: 'btn-group immobile-state-switcher') do
      button_tag('Neu', class: new_class, data: {
          immobile_identifier: immobile.immobile_identifier,
          immobile_state: 'new',
          active_class: 'btn btn-info'
      }) +
      button_tag('Relevant', class: relevant_class, data: {
          immobile_identifier: immobile.immobile_identifier,
          immobile_state: 'accepted',
          active_class: 'btn btn-success'
      })+
      button_tag('Abgelehnt', class: declined_class, data: {
          immobile_identifier: immobile.immobile_identifier,
          immobile_state: 'declined',
          active_class: 'btn btn-danger'
      })
    end
  end

  def maybe_blank(attribute, &block)
    if attribute.blank?
      '-'
    elsif block
      block.call(attribute)
    else
      attribute
    end
  end

end