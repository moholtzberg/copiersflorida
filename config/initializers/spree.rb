# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  attachment_config = {

    # storage: :file_system,
    # s3_headers: { 
    #   "Cache-Control" => "max-age=31557600" 
    # },
    # s3_protocol:    "https",
    # bucket:         SECRET["AWS"]["S3"]["BUCKET_NAME"],

    styles: {
      mini:     "48x48>",
      small:    "120x120>",
      product:  "240x240>",
      large:    "600x600>"
    },
    path:          ':app/public/:class/:id/:style/:basename.:extension',
    default_url:   ':app/public/:class/:id/:style/:basename.:extension',
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
  
  if Rails.env.production?
      config.shipstation_username = "#{SECRET["SHIPSTATION"]["USER"]}"
      config.shipstation_password = "#{SECRET["SHIPSTATION"]["PASS"]}"
    else
      # config.shipstation_username = "#{SECRET["SHIPSTATION"]["USER"]}"
      # config.shipstation_password = "#{SECRET["SHIPSTATION"]["PASS"]}"
    end

    config.shipstation_weight_units = "Ounces" # Grams, Ounces or Pounds

    # choose which number to send shipstation, use :shipment or :order, default is :shipment
    config.shipstation_number = :shipment

    # if you prefer to send notifications via shipstation
    config.send_shipped_email = false
  
end

Spree.user_class = "Spree::User"
Spree::Api::Config[:requires_authentication] = false
Spree::Image.attachment_definitions[:attachment][:url] = '/:class/:id/:style/:basename.:extension'
Spree::Image.attachment_definitions[:attachment][:path] = '/:class/:id/:style/:basename.:extension'

Spree::Product.where(:id => [1..10]).each do |prod| 
  prod.images.each do |image| 
    unless image.nil?
      ["mini", "small", "product", "large", "original"].each do |style|
        base_dir = "public/spree/products"
        puts "Base Dir-----------#{base_dir}"
        if File.exists?("#{base_dir}/#{prod.id}")
          dir = "#{base_dir}/#{prod.id}"
          puts "------------------#{base_dir}/#{prod.id} Exists"
        else
          Dir.mkdir("#{base_dir}/#{prod.id}")
          puts "------------------#{base_dir}/#{prod.id} Created"
          dir = "#{base_dir}/#{prod.id}"
        end
        # dir = File.exists?("#{base_dir}/#{prod.id}") ? "#{base_dir}/#{prod.id}" : Dir.mkdir("#{base_dir}/#{prod.id}")
        if File.exists?("#{dir}/#{style}")
          style_dir = "#{dir}/#{style}"
          puts "------------------#{dir}/#{style} Exists"
        else
          Dir.mkdir("#{dir}/#{style}")
          puts "------------------#{dir}/#{style} Created"
          style_dir = "#{dir}/#{style}"
        end
        #style_dir = File.exists?("#{dir}/#{style}") ? "#{dir}/#{style}" : Dir.mkdir("#{dir}/#{style}")
        file_name = open("#{style_dir}/#{image.attachment_file_name}", "wb")
        puts "---------------------#{file_name}"
        url = "https://s3.amazonaws.com/copiersflorida/spree/spree/images/#{prod.id}/#{style}/#{image.attachment_file_name}"
        puts "---------------------#{url}"
       begin 
         read_file = open(url).read
         file_name.write(read_file).close
         puts "\n\r ****************#{prod.id} images copied"
       rescue
          
          puts " ++++++++++++++++++++ Houston we have problem #{prod.id}"
        else
          puts "+++++++++++++++++++++ failed to open #{url}"
        end
      end
    else
      puts "\n\r #{prod.id} has not images \n\r"
    end 
  end 
end