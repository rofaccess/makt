# frozen_string_literal: true

class Menu::MenuItemComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(icon: nil, text:)
    @icon = icon
    @text = text
  end
end
