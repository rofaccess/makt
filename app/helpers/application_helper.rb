module ApplicationHelper
  def logo_color
    # Alternatives: blue, green, lilac
    "blue"
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

  def icon_tag(icon_name, classes = nil)
    icon_path = "svg/#{icon_name}.svg"
    inline_svg_tag(icon_path, class: classes)
  rescue InlineSvg::AssetFile::FileNotFound
    default_icon_tag(classes)
  end

  def default_icon_tag(classes)
    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='#{classes}' viewBox='0 0 16 16'>
      <circle cx='8' cy='8' r='8'/>
    </svg>".html_safe
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

  def link(url = nil, class: nil, data: nil)
    content_tag :a, class: binding.local_variable_get(:class), href: url, data: data do
      yield if block_given?
    end
  end
end
