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
    searchware = params[:sea].to_s
    waretype = params[:type].to_s

     # debugger
    # ss=nil
    # dd="女装"
  #  @search = Ware.where(:ware =>["ware LIKE 'ss"] )

    if(ss !="")
    @search = Ware.where(:ware=>searchware)
    render json:(@search)

    else if(dd!="")
      a=Classification.where(:classname=>waretype)
      @ware = Classification.find(a.first.id)
      @search=@ware.wares
    #  debugger
      render json:(@search)
         end
    end


  end




  def warelist
    @ware = Ware.all
    render json:(@ware)
  end


    def selecttype

      searchname = params[:sea].to_s
      searchtype= params[:type].to_s
      debugger
      if ( searchname !="")
        @busines = Busine.where(:name=>searchname)
        render json:(@busines)
        debugger
        else if(searchtype !="")
        a=Classification.where(:classname=>searchtype)

        @busines = Classification.find(a.first.id)
        @bus=@busines.names
        render json:(@bus)


             end

      end

    end




end
