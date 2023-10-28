InlineSvg.configure do |config|
  # Caching svg files
  config.asset_file = InlineSvg::CachedAssetFile.new(
    paths: [
      "#{Rails.root}/app/assets/images/svg"
    ],
    filters: /\.svg/
  )
end
