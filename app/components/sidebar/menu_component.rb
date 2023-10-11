# frozen_string_literal: true

class Sidebar::MenuComponent < ViewComponent::Base
  renders_many :submenus, Sidebar::SubmenuComponent

  def initialize(icon: nil, text:, url: "#", turbo: false, active: false)
    @icon = icon
    @text = text
    @url = url
    @turbo = turbo
    @active = active
  end

  private

  def menu_class
    classes = +"sidebar-item"
    classes << " active" if @active
    classes << " has-sub" if submenus.any?
    classes
  end

  def submenu_class
    classes = +"submenu"
    classes << " active" if @active
    classes
  end
end
