module ApplicationHelper
  def img_color
    # Alternatives: blue, green, lilac
    "lilac"
  end

  def logo_name
    "logo_#{img_color}.png"
  end

  def favicon_name
    "favicon_#{img_color}.ico"
  end

  def favicon_tag
    "<link rel='icon' type='image/x-icon' href='#{image_path(favicon_name)}'>".html_safe
  end

  def logo_tag
    "<a href='#'><img src='#{image_path(logo_name)}' alt='MaKT'></a>".html_safe
  end
end
