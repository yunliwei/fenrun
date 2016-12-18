class MobilesController < ApplicationController

def reg

  user=User.find_by(name:params[:acount])
  if(user==nil)
    user = User.create(name:params[:acount],password_digest:params[:password])
    render json:('[{"status":"1"}]')
  else
    render json:('[{"status":"0"}]')
  end

end

  def login
    user=User.find_by(name:params[:acount],password_digest:params[:password])
    orders=User.find_by(name:'22').orders

    qu=role.find_by(user_id:'1').powers


  end

def sahngjiaruzhu

  businesssettled = Businesssettled.find_by(name:params[:name])
  if(businesssettled==nil)
    businesssettled = Businesssettled.create(name:params[:name],phonenumber:params[:phonenumber],summary:params[:summary],remarks:params[:remarks])
    render json:('[{"status":"1"}]')
  else
    render json:('[{"status":"0"}]')
  end

end





end
