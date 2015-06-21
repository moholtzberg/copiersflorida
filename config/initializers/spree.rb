# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  attachment_config = {

    storage: :s3,
    s3_headers: { 
      "Cache-Control" => "max-age=31557600" 
    },
    s3_protocol:    "https",
    bucket:         SECRET["AWS"]["S3"]["BUCKET_NAME"],

    styles: {
      mini:     "48x48>",
      small:    "120x120>",
      product:  "240x240>",
      large:    "600x600>"
    },
    path:          "/spree/:class/:id/:style/:basename.:extension",
    default_url:   "/spree/:class/:id/:style/:basename.:extension",
    default_style: "product"
  }
  
  attachment_config.each do |key, value|
    Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
  end

  puts "=============================================================="
  puts "=============================================================="
  puts "==            >>>>>>>>>>>>>>>> #{SECRET["AWS"]["ACCESS_KEY_ID"]}"
  puts "==            >>>>>>>>>>>>>>>> #{SECRET["AWS"]["SECRET_ACCESS_KEY"]}"
  puts "==            >>>>>>>>>>>>>>>> #{SECRET["AWS"]["S3"]["BUCKET_NAME"]}"
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
