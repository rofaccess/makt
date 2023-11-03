# frozen_string_literal: true

class Menu::MenuBarComponent < ViewComponent::Base
  renders_one :home, Menu::MenuItemComponent
  renders_many :shortcuts, Menu::MenuItemComponent
  renders_one :main_menu, Menu::MainMenuComponent

  private

  def block_class
    "menu-bar"
  end

  def block_modifier_classes
    block_class
  end
end
