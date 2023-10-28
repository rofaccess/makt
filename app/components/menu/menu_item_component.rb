# frozen_string_literal: true

class Menu::MenuItemComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(icon: nil, text:)
    @icon = icon_tag(icon, "icon icon--gray")
    @text = text
  end
end
