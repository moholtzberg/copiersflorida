source 'https://rubygems.org'
source 'https://rails-assets.org'

gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
gem "pg", group: :production
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby, group: :production

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development
gem 'paperclip'
gem 'aws-sdk', '< 2.0'

gem 'byebug',  group: :development

 # Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0',  group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'
gem 'rails_12factor', group: :production

group :development do 
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  # gem 'capistrano-ssh-doctor', '~> 1.0', group: :development
  gem 'capistrano-rvm'
  # gem 'capistrano-assets'
  # gem 'rvm1-capistrano3', require: false
end

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'whenever', :require => false
gem 'sendgrid-ruby'

spree_version = '3-0-stable'
master = 'master'

gem 'spree',                  github: 'spree/spree', branch: spree_version
gem 'spree_gateway',          github: 'spree/spree_gateway', branch: spree_version
gem 'spree_auth_devise',      github: 'spree/spree_auth_devise', branch: spree_version

gem 'spree_print_invoice',    github: 'spree-contrib/spree_print_invoice',    branch: spree_version
gem 'spree_sitemap',          github: 'spree-contrib/spree_sitemap',          branch: spree_version
gem 'spree_active_shipping',  github: 'spree-contrib/spree_active_shipping',  branch: spree_version
gem 'spree_editor',           github: 'spree-contrib/spree_editor',           branch: spree_version
gem 'spree_comments',         github: 'spree-contrib/spree_comments',         branch: spree_version
# gem 'spree_email_to_friend',  github: 'spree-contrib/spree_email_to_friend', branch: spree_version
# gem 'spree_mail_settings',  github: 'spree-contrib/spree_mail_settings', branch: spree_version

gem 'spree_paypal_express',   github: 'spree-contrib/better_spree_paypal_express', branch: master
gem "spree_related_products", github: 'spree-contrib/spree_related_products', branch: spree_version


# gem 'spree_advanced_admin_ui', github: 'moholtzberg/spree_advanced_admin_ui', branch: master
gem 'spree_msrp', github: 'moholtzberg/spree_msrp', branch: '3-0-stable'
gem 'spree_product_documents', github: 'moholtzberg/spree_product_documents', branch: master
# gem 'spree_env_ribbon', github: 'moholtzberg/spree_env_ribbon', branch: 'master'

# gem 'spree_reviews', github: 'pebra/spree_reviews', branch: spree_version
# gem "spree_address_book", github: 'romul/spree_address_book', branch: spree_version
# gem 'spree_user_groups', github: 'romul/spree_user_groups', branch: spree_version
gem 'spree_google_base', github: 'jumph4x/spree-google-base', branch: '3-0-rc'
# gem 'spree_google_base', github: 'bpuklich/spree-google-base', branch: '2-4-stable'

# gem 'spree_vouchers', github: 'spree-contrib/spree_vouchers', branch: '2-4-beta'
# gem 'spree_add_to_cart_ajax', github: 'nathandao/spree_add_to_cart_ajax', branch: '2-4-stable'

# gem 'spree_subscriptions', github: 'DynamoMTL/spree_subscriptions', branch: 'lola'
# gem 'spree-bank-transfer', github: 'julien-bergner/spree_bank_transfer', branch: '2-4-stable'
# gem 'spree_one_page_checkout', github: 'moholtzberg/spree_one_page_checkout'
# gem 'spree_account_recurring', github: 'gpongelli/spree-account-recurring', branch: '2-4-stable'
# 
# gem 'spree_reffiliate', github: 'DynamoMTL/spree_reffiliate', branch: '2-4-stable'
gem 'spree_multi_domain', path: '../spree-multi-domain'
# gem 'spree_store_credits', github: 'spree-contrib/spree_store_credit_payment_method', branch: "2-3-stable"
# gem 'spree_price_books', github: 'spree-contrib/spree_price_books', branch: '2-4-stable'
# gem 'spree_social', github: 'spree-contrib/spree_social', branch: 'master'
# gem 'spree_product_assembly', github: 'spree-contrib/spree-product-assembly', branch: 'master'

# gem 'spree_ajax_add_to_cart', github: 'moholtzberg/spree_ajax_add_to_cart', branch: spree_version

# gem 'spree_credit_lines', path: '../spree_credit_lines'
gem 'spree_terms', path: '../spree_terms'
gem 'spree_advanced_admin_ui', path: '../spree_advanced_admin_ui'
gem 'spree_static_content',   github: 'spree-contrib/spree_static_content', branch: spree_version
gem 'spree_error_pages', github: 'moholtzberg/spree_error_pages', branch: master
gem 'spree_messages', github: 'moholtzberg/spree_messages', branch: master
# gem 'spree_copiersflorida_theme', path: '../spree_copiersflorida_theme'
# gem 'spree_filter_by_taxon', path: '../spree_filter_by_taxon'
gem 'spree_copiersflorida_theme', github: 'moholtzberg/spree_copiersflorida_theme', branch: master