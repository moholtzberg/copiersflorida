# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  attachment_config = {
    s3_credentials: {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      bucket: ENV['S3_BUCKET_NAME'],
    },
    storage: :s3,
    s3_headers: { 
      "Cache-Control" => "max-age=31557600" 
    },
    s3_protocol:    "https",
    bucket:         ENV['S3_BUCKET_NAME'],
    styles: {
      mini:     "48x48>",
      small:    "120x120>",
      product:  "240x240>",
      large:    "600x600>"
    },
    path:          ":rails_root/public/spree/products/:id/:style/:basename.:extension",
    default_url:   "/spree/products/:id/:style/:basename.:extension",
    default_style: "product"
  }
  
  attachment_config.each do |key, value|
    Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
  end

  puts "=============================================================="
  puts "=============================================================="
  puts "==            >>>>>>>>>>>>>>>> #{ENV['AWS_ACCESS_KEY_ID']}"
  puts "==            >>>>>>>>>>>>>>>> #{ENV['AWS_SECRET_ACCESS_KEY']}"
  puts "==            >>>>>>>>>>>>>>>> #{ENV['S3_BUCKET_NAME']}"
  puts "=============================================================="
  puts "=============================================================="
  
  config.company = true
  config.checkout_zone = "North America"
  config.default_country_id = 232
  config.shipping_instructions = true
  config.max_level_in_taxons_menu = 3
  
  # config.override_actionmailer_config = true
  # config.mails_from = "no-reply@copiersflorida.com"
  
end

Spree.user_class = "Spree::User"
