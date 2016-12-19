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


def shangjiaruzhu

  businesssettled = Businesssettled.find_by(name:params[:ruzhuname])
  if(businesssettled==nil)
    businesssettled = Businesssettled.create(name:params[:ruzhuname],phonenumber:params[:ruzhuphone])
    render json:('[{"status":"1"}]')
  else
  render json:('[{"status":"0"}]')
  end

end






def shangjiatype

  busines = Busine.find_by(name:params[:shangjianame])
  if(busines==nil)
    busines = Busine.create(name:params[:shangjianame])
    render json:('[{"status":"1"}]')
  else
    render json:('[{"status":"0"}]')
  end

end





  def search
    ss = params[:sea]
   # debugger
    search= Ware.find_by(ware:params[:ss])
    alert(search)
    render  json: shangpinlist

    end


end
