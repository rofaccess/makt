# frozen_string_literal: true

class Menu::MenuBarComponent < ViewComponent::Base
  renders_one :home, Menu::MenuItemComponent
  renders_many :shortcuts, Menu::MenuItemComponent
  renders_one :menu, Menu::MenuItemComponent
end
