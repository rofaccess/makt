# frozen_string_literal: true

class Menu::MainMenuComponent < ViewComponent::Base
  include ApplicationHelper

  private

  def block_class
    "main-menu"
  end

  def block_modifier_classes
    block_class
  end
end
