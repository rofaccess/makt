# frozen_string_literal: true

class Menu::MenuItemComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(icon: nil, text:, url: "#", turbo: false, active: false, href: true, size: nil, inline: false)
    @icon = icon
    @text = text
    @url = url
    @turbo = turbo
    @active = active
    @href = href
    @size = size # Opts: sm or lg
    @inline = inline # Show icon and text inline
  end

  private

  def before_render
    # request method is accesible only before render
    @active = (@active || request.path == @url)
  end

  def block_class
    "o-menu-item"
  end

  def block_modifier_classes
    classes = +block_class # The + is for modify frozen variable or create not frozen variable?
    classes << " #{block_class}--active" if @active
    classes << " #{block_class}--#{@size}" if @size
    classes << " #{block_class}--inline" if @inline
    classes
  end
end
