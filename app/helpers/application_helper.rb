module ApplicationHelper
  def logo_color
    # Alternatives: blue, green, lilac
    "lilac"
  end

  def logo_name
    "logo_#{logo_color}.png"
  end

  def favicon_logo_name
    "favicon_logo_#{logo_color}.ico"
  end

  def favicon_logo_tag
    "<link rel='icon' type='image/x-icon' href='#{image_path(favicon_logo_name)}'>".html_safe
  end

  def logo_tag
    "<a href='#{root_path}' data-turbo='false'><img src='#{image_path(logo_name)}' alt='MaKT'></a>".html_safe
  end

  def new_devise_session_text
    case controller_name
    when "registrations"
      t(".already_have_an_account")
    when "passwords"
      t(".remember_your_account")
    end
  end

  def active_path?(paths)
    request.path.in?(paths)
  end

  def stock_settings_paths
    [product_brands_path]
  end
end
