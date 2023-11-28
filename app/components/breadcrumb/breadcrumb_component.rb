# frozen_string_literal: true

class Breadcrumb::BreadcrumbComponent < ViewComponent::Base
  renders_many :items, Breadcrumb::BreadcrumbItemComponent

  private

  def block_class
    "c-breadcrumb"
  end

  def block_modifier_classes
    block_class
  end
end
