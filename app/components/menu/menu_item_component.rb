# frozen_string_literal: true

class Menu::MenuItemComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(icon: nil, text:, url: "#", turbo: false, active: false, link: true)
    @icon = icon
    @text = text
    @url = url
    @turbo = turbo
    @active = active
    @link = link
  end

  private

  def before_render
    # request method is accesible only before render
    @active = (@active || request.path == @url)
  end

  def menu_item_class
    classes = +"menu-item" # The + is for modify frozen variable or create not frozen variable?
    classes << " menu-item--active" if @active
    classes
  end
end
