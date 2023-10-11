# frozen_string_literal: true

class Sidebar::MenuComponent < ViewComponent::Base
  renders_many :submenus, Sidebar::SubmenuComponent

  def initialize(icon: nil, text:, url: "#", active: false)
    @icon = icon
    @text = text
    @url = url
    @active = active
  end

  private

  def classes
    classes = +"sidebar-item"
    classes << " active" if @active
    classes << " has-sub" if submenus.any?
    classes
  end
end
