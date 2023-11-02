# frozen_string_literal: true

class Menu::CollapsibleMenuComponent < ViewComponent::Base

  def initialize(icon: nil, text:, id:, position: :default)
    @icon = icon
    @text = text
    @id = id
    @position = position # Can be default, left or right. Pending center maybe using javascript
  end
end
