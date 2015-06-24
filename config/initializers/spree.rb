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
    path:          ':url',
    default_url:   ':url',
    default_style: "product"
  }
  
  attachment_config.each do |key, value|
    Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
  end

  puts "=============================================================="
  puts "=============================================================="
  puts "==  AWS ACCESS KEY ID       >>>>>>>>>>>> #{SECRET["AWS"]["ACCESS_KEY_ID"]}"
  puts "==  AWS SECRET ACCESS KEY   >>>>>>>>>>>> #{SECRET["AWS"]["SECRET_ACCESS_KEY"]}"
  puts "==  AWS S3 BUCKET NAME      >>>>>>>>>>>> #{SECRET["AWS"]["S3"]["BUCKET_NAME"]}"
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
# puts "#{Spree::Image.attachment_definitions.inspect"
Spree.user_class = "Spree::User"
Spree::Image.attachment_definitions[:attachment][:url] = '/spree/:class/:id/:style/:basename.:extension'
Spree::Image.attachment_definitions[:attachment][:path] = '/spree/:class/:id/:style/:basename.:extension'

# Paperclip::Attachment.default_options[:url] = "/spree/:class/:id/:style/:basename.:extension"
# Paperclip::Attachment.default_options[:path] = "/spree/:class/:id/:style/:basename.:extension"