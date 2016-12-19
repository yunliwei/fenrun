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

  def search
    ss = params[:sea].to_s
    #debugger

  #  @search = Ware.where(:ware =>["ware LIKE 'ss"] )
    @search = Ware.where(:ware=>ss)
   #debugger
   render json:(@search)
   

    end



end
