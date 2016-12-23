class MobilesController < ApplicationController

def reg

  user=User.find_by(name:params[:acount])
  if(user==nil)
    user = User.create(name:params[:acount],password_digest:params[:password],email:params[:email])
    render json:('[{"status":"1"}]')
  else
    render json:('[{"status":"0"}]')
  end

end

  def login
    user=User.find_by(name:params[:acount],password_digest:params[:password])
    # debugger
    if(user!=nil)
     # debugger
      render json:('[{"status":"1"}]')
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
# debugger


    @collect = Favorite.create(ware_id:params[:code],user_id:params[:user_id],link:params[:link])
    # ss = Favorite.find(ware_i)
    # @collect.save
    render json:(@collect)
    # cccc=Favorite.find(collect)
    # @ware.favorite.push(cccc)
    # debugger
  end




end
