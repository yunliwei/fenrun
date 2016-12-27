class MobilesController < ApplicationController

def reg

  user=User.find_by(username:params[:acount])
  if(user==nil)
    user = User.create(username:params[:acount],password_digest:params[:password],email:params[:email])
    render json:('[{"status":"1"}]')
  else
    render json:('[{"status":"0"}]')
  end

end

  def login
    user=User.find_by(username:params[:acount],password_digest:params[:password])
    # aa=user.username
     # debugger
    if(user!=nil)

      # session[:name]="123"
      #       session[:password]="321"
      id=user.id.to_s
      aa='[{"status":"1","id":"'+id+'"}]'
     #debugger
      render json:('[{"status":"1","id":"'+id+'"}]')
      #debugger

    else
      render json:('[{"status":"0"}]')

    end
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
    if(searchware !="")
    @search = Ware.where("ware like '%"+searchware+"%'")
    #debugger
    render json:(@search)

    else if(waretype!="")
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


  def businelist
  @busines = Busine.all
    render json:(@busines)
  end

   def selecttype

      searchname = params[:sea].to_s
      searchtype= params[:type].to_s

      if ( searchname !="")
        @busines = Busine.where("name like '%"+searchname+"%'")
        render json:(@busines)
        else if(searchtype !="")
        a=Classification.where(:classname=>searchtype)
        @busine = Classification.find(a.first.id)
        @bus=@busine.busines

        render json:(@bus)

             end

      end

   end

  def detail
    goods = params[:code]
    @goods = Ware.where(:id =>goods)
    # debugger
    render json:(@goods)
  end

  def collect
    collect = params[:code]
    user = params[:userid]
    @collect = Favorite.create(ware_id:params[:code],user_id:params[:userid],link:params[:link])
    #debugger
    # @favorites=User.find(params[:userid]).favorites
    # @favorites.create(link:params[:link])
    render json:(@collect)
    # cccc=Favorite.find(collect)
    # @ware.favorite.push(cccc)
    # debugger
  end

def buy
  wareid = params[:wareid]
  userid = params[:userid]

  @address = Receiptadd.where(:user_id =>userid,:isselect =>1)

  @waress = Ware.where(:id =>wareid)
   bc= @waress[0].price.to_s

@all='[{"shouhuoname":"'+@address[0].shouhuoname.to_s+'","address":"'+@address[0].address.to_s+'","phonenumber":"'+@address[0].phonenumber.to_s+'","ware":"'+@waress[0].ware.to_s+'","price":"'+@waress[0].price.to_s+'","freight":"'+@waress[0].freight.to_s+'"}]'

  render json:(@all)
end

  def createorder
   # userid = params[:userid]
    #debugger
    @order = Order.create(ware_id:params[:wareid],user_id:params[:userid],number:params[:number],sum:params[:sum],userintegral:params[:user],state:params[:states],fare:params[:fare],ramarks:params[:ramark])
    #debugger
    render json:(@order)
debugger
  end

  def createshopcar

  end

end
