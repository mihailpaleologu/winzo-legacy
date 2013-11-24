if Rails.env == "production" 
  S3_DEFAULT_HOST = "winzo.s3.amazonaws.com"
  S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket => ENV['S3_BUCKET_NAME']} 
else 
  S3_DEFAULT_HOST = "winzo-dev.s3.amazonaws.com"
  S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end

Paperclip.interpolates(:s3_eu_url) { |attachment, style|
  "#{attachment.s3_protocol}://#{S3_DEFAULT_HOST}/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/}, "")}"
}


configuration = {

  :app_host => "beta.winzo.ro", #override this in your application.yml

  :community_name => "winzo",

  :theme => "winzo",

  :community_tagline => "Buy & sell with friends",
  :community_description =>  "A social shopping network connecting buyers and sellers.",
  :support_email =>  "contact@winzo.ro",
#  :meta_description => 'A description of your community for use in META tags.',
#  :meta_keywords => 'keywords for use in META tags',

  # Comment this out if you want to infer the locale
  # off of the http headers
  :community_locale => "en",

  :allow_anonymous_commenting => false,
  :allow_anonymous_forum_posting => false,
  :require_captcha_on_signup => false,

  #:recaptcha_pub_key => YOUR_PUB_KEY,
  #:recaptcha_priv_key => YOUR_PRIV_KEY,
  # uncomment these keys if you turn captcha on for commenting, forums or signup

  #:akismet_key => YOUR_KEY,
  # uncomment this if you want to use akismet for comment filtering. Go to http://en.wordpress.com/api-keys/

  #uncomment below to use omniauth providers for login and signup
  :auth_providers => {
  #   :twitter => {:key => 'key', :secret => 'secret'},
    :facebook => {:key => '252974314858701', :secret => '235f8df0f5cea8ee7a777aed98004619'}
  },

  # for SEO reasons sometimes you should control the robots on how they have to handle your content
  # listing of stuff which points to single posts or entries should normally not been indexed,
  # but the robot should follow the internal link to show the post
  :robots_meta_list_content => 'noindex,follow',
  # the post itself should be indexed;
  # when links are included and they point to external sites, the robot should not follow
  :robots_meta_show_content => 'index,nofollow',

  # min and max age for users to use the site
  :min_age => 13,
  :max_age => 99,

  :regexes => {
    :login => /\A[\sA-Za-z0-9_-]+\z/,
    :email => /\A([^@\s]+)@((?:[-a-z0-9A-Z]+\.)+[a-zA-Z]{2,})\z/
  },

  :photo => {
    :missing_thumb => '/assets/icon_missing_thumb.gif',
    :missing_medium => "/assets/icon_missing_medium.gif",
    :paperclip_options => {
      :storage => 's3',
      :s3_credentials => S3_CREDENTIALS,
      :url  => ":s3_eu_url",
      #:default_url => "",
      #:path => "#{Rails.root}/public/system/:attachment/:id/:style/:filename",
      #:url => "/system/:attachment/:id/:style/:filename",
      :styles => {
        :thumb => {
          :geometry => "100x100#",
          :processors => [:cropper]
        },
        :medium => "290x320#",
        :large => "465>"
      }
    },
    :validation_options => {
      :max_size => 3,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png']
    }
  },

  :feature => {
    :use_thumbs => true,
    :dimensions => [150, 635],
    :paperclip_options => {
      :storage => 's3',
      :s3_credentials => S3_CREDENTIALS,
      :url  => ":s3_eu_url",
      #:default_url => "",
      #:path => "#{Rails.root}/public/system/:attachment/:id/:style/:filename",
      #:url => "/system/:attachment/:id/:style/:filename",
      :styles => {
        :original => '465>',
        :thumb => "45x45#",
        :large => "635x150#"
      }
    },
    :validation_options => {
      :max_size => 3,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png']
    }
  },

  :clipping => {
    :paperclip_options => {
      :storage => 's3',
      :s3_credentials => S3_CREDENTIALS,
      :url  => ":s3_eu_url",
      #:default_url => "",
      #:path => "#{Rails.root}/public/system/:attachment/:id/:style/:filename",
      #:url => "/system/:attachment/:id/:style/:filename",
      :styles => {
        :thumb => "100x100#",
        :medium => "290x320#",
        :large => "465>"
      }
    },
    :validation_options => {
      :max_size => 3,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png']
    }
  },

  :reserved_logins => [
    'about',
    'account',
    'activities',
    'admin',
    'advertise',
    'ads',
    'application',
    'assets',
    'authorizations',
    'base',
    'categories',
    'choices',
    'clippings',
    'clipping_images',
    'comments',
    'countries',
    'css_help',
    'events',
    'favorites',
    'faq',
    'featured',
    'forums',
    'friendships',
    'friendship_statuses',
    'home',
    'homepage_features',
    'images',
    'invitations',
    'javascripts',
    'login',
    'logout',
    'manage_photos',
    'messages',
    'metro_areas',
    'moderatorships',
    'monitorships',
    'new_clipping',
    'pages',
    'photos',
    'polls',
    'popular',
    'popular_rss',
    'posts',
    'recent',
    'roles',
    'rsvps',
    'sb_posts',
    'search',
    'sessions',
    'signup',
    'sitemap',
    'site_index',
    'sb_posts',
    'sitemap',
    'states',
    'statistics',
    'stylesheets',
    'tags',
    'theme',
    'topics',
    'users',
    'votes'
  ]

}

configatron.configure_from_hash(configuration)
