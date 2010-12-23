class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    def is_user!
      if authenticate_user!
        unless current_user.email == 'yannick.schutz@gmail.com'
          flash[:warning] = "You're not the right user!"
          redirect_to root_url
        end
      end
    end
    def is_user?
      if user_signed_in?
        if current_user.email == 'yannick.schutz@gmail.com'
          true
        end
      else
        false
      end
    end

    def postToTwitter status
      Twitter.configure do |config|
        config.consumer_key = TWEET_CONFIG['consumer_key']
        config.consumer_secret = TWEET_CONFIG['consumer_secret']
        config.oauth_token = TWEET_CONFIG['oauth_token']
        config.oauth_token_secret = TWEET_CONFIG['oauth_token_secret']
      end
      Twitter.update(status)
    end

end
