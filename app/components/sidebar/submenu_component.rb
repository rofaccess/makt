# frozen_string_literal: true

class Sidebar::SubmenuComponent < ViewComponent::Base
  def initialize(icon: nil, text:, url: "#")
    @icon = icon
    @text = text
    @url = url
  end

  private

  def before_render
    # request is accesible only before render
    @active = request.path == @url
  end
end
