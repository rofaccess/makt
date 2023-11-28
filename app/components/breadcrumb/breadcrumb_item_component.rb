# frozen_string_literal: true

class Breadcrumb::BreadcrumbItemComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(icon: nil, text: nil, active: false)
    @icon = icon
    @text = text
    @active = active
  end

  private

  def block_class
    "c-breadcrumb__item"
  end

  def block_modifier_classes
    classes = +block_class # The + is for modify frozen variable or create not frozen variable?
    classes << " #{block_class}--active" if @active
    classes
  end
end
