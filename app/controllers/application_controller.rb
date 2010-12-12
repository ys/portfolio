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
        unless current_user.email == 'yannick.schutz@gmail.com'        
          false
        end
        true
      end
      false
    end
  
end
