# frozen_string_literal: true

class Menu::CollapsibleMenuComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(icon: nil, text:, id:)
    @icon = icon
    @text = text
    @id = id
  end
end
