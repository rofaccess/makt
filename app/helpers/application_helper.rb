module ApplicationHelper
  def img_color
    # Alternatives: blue, green, lilac
    "lilac"
  end

  def favicon_tag
    "<link rel='icon' type='image/x-icon' href='../favicon_#{img_color}.ico'>".html_safe
  end

  def logo_tag
    "<a href='#'><img src='../logo_#{img_color}.png' alt='MaKT'></a>".html_safe
  end
end
