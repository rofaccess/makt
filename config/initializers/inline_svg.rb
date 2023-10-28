InlineSvg.configure do |config|
  config.raise_on_file_not_found = true
  # Caching svg files
  config.asset_file = InlineSvg::CachedAssetFile.new(
    paths: [
      "#{Rails.root}/app/assets/images/svg"
    ],
    filters: /\.svg/
  )
end
