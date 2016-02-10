class SessionsController < ApplicationController
    
    def new
        
        
    end
    
    def create
        user = User.find_by(email: params[:session] [:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You Have Fucking Logged In"
            redirect_to user_path(user)
        
        else
            
            flash.now[:danger] = "You Fucked Up Your Login Info"
            render 'new'
        end    
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You Logged The Fuck Out"
        redirect_to root_path
        
        
    end
    
end