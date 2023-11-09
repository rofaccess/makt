# frozen_string_literal: true

class Menu::CollapsibleMenuComponent < ViewComponent::Base

  def initialize(icon: nil, text:, id:, position: nil)
    @icon = icon
    @text = text
    @id = id
    @position = position # Opts: left or right. Pending center maybe using javascript
  end

  private

  def block_class
    "c-collapsible-menu"
  end

  def block_modifier_classes
    classes = +block_class # The + is for modify frozen variable or create not frozen variable?
    classes << " #{block_class}--#{@position}" if @position
    classes
  end
end
