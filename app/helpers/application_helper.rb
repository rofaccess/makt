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

  def new_devise_session_text
    case controller_name
    when "registrations"
      t(".already_have_an_account")
    when "passwords"
      t(".remember_your_account")
    end
  end
end
