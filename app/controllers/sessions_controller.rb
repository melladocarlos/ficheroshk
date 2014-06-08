class SessionsController < ApplicationController  

def new
    if current_user
        if current_user.cargo_id == 2
          redirect_to ficha_path (current_user)
        else
        end      
    else
    end
end


def create
  ficha = Ficha.authenticate(params[:email], params[:password])
  if ficha
    session[:ficha_id] =  Ficha.find_by_id(ficha.id)
    redirect_to fichas_path, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:ficha_id] = nil  
  redirect_to root_url, :notice => "Logged out!"
end

  
end  