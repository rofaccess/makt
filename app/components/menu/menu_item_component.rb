# frozen_string_literal: true

class Menu::MenuItemComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(icon: nil, text:, url: nil, data: {}, style: {})
    @icon = icon
    @text = text
    @url = url
    @data = { turbo: false }.merge(data)
    @style = { active: false, size: nil, inline: false, box: false }.merge(style)
    @active = style[:active]
    @size = style[:size] # Opts: sm or lg
    @inline = style[:inline] # Show icon and text inline
    @box = style[:box] # Show box around menu item
  end

  private

  def before_render
    # request method is accesible only before render
    @active = (@active || request.path == @url)
    # Set active link using javascript
    @data[:action] = "click->menu#activateMenuItem"
    # Set data-turbo-stream attr in link because turbo is not enable for get requests by default
    @data["turbo-stream"] = ""
  end

  def block_class
    "o-menu-item"
  end

  def block_modifier_classes
    classes = +block_class # The + is for modify frozen variable or create not frozen variable?
    classes << " #{block_class}--active" if @active
    classes << " #{block_class}--#{@size}" if @size
    classes << " #{block_class}--inline" if @inline
    classes << " #{block_class}--box" if @box
    classes
  end
end
