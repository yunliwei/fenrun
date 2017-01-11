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
 # debugger
 #    if user ==""
 #      render json:('[{"login":"1"}]')
 #      debugger
 #    else


    @user = User.find( params[:userid])
    @collects=@user.favorites

    # # debugger
    if @collects.empty?
      @collect = Favorite.create(ware_id:params[:code],user_id:params[:userid],link:params[:link])
      render json:('[{"status":"1"}]')
      # debugger
    else
    @collects.each do |t|
      debugger
      if t.ware_id.to_s!=collect
        debugger
        @collect = Favorite.create(ware_id:params[:code],user_id:params[:userid],link:params[:link])
        render json:('[{"status":"1"}]')
      else
        render json:('[{"status":"0"}]')

    end
    end
    end


    #debugger
    # ss = @collects[0].ware_id.to_s
    # if (@collects[0].ware_id.to_s != "" && @collects[0].ware_id.to_s == params[:code])
    #
    #   render json:('[{"status":"0"}]')
    #
    # else
    #   @collect = Favorite.create(ware_id:params[:code],user_id:params[:userid],link:params[:link])
    #   render json:('[{"status":"1"}]')
    # end

    #debugger


    #debugger
    # @favorites=User.find(params[:userid]).favorites
    # @favorites.create(link:params[:link])

    # cccc=Favorite.find(collect)
    # @ware.favorite.push(cccc)
    # debugger
  end

  def buy
    wareid = params[:wareid]
    userid = params[:userid]

    # if session[:userid]
    @address = Receiptadd.where(:user_id =>userid,:isselect =>1)


    @waress = Ware.where(:id =>wareid)

    bc= @waress[0].price.to_s

    @all='[{"shouhuoname":"'+@address[0].shouhuoname.to_s+'","address":"'+@address[0].address.to_s+'","phonenumber":"'+@address[0].phonenumber.to_s+'","ware":"'+@waress[0].ware.to_s+'","price":"'+@waress[0].price.to_s+'","freight":"'+@waress[0].freight.to_s+'"}]'
    #debugger
    render json:(@all)
#   else
#     render json:('[{"status":"0"}]')
#     debugger
# end
  end

  def createorder
    # userid = params[:userid]
    #debugger
    @order = Order.create(ware_id:params[:wareid],user_id:params[:userid],number:params[:number],sum:params[:sum],userintegral:params[:user],state:params[:states],fare:params[:fare],ramarks:params[:ramark])
    #debugger
    render json:(@order)

  end

  def createshopcar



#     @wares=Ware.find(params[:code])
#     # debugger
#     @waretype=Waretype.where(:ware_id=>@wares.id)
#     #debugger
# @warelabe=Warelabel.where(:waretype_id=>@waretype.ids)
#
#     #debugger
#     @all={"data"=>@warelabe,"waretype"=>@waretype}.to_json
#     # debugger
#      render json:(@all)
    # debugger


    #
    @shopcar = Shoppingcar.create(ware_id:params[:code],user_id:params[:userid],spec:params[:spec],number:"1")
    render json:(@shopcar)
  end

  def selectlabel
    @wares=Ware.find(params[:code])
    # debugger
    @waretype=Waretype.where(:ware_id=>@wares.id)
    #debugger
    @warelabe=Warelabel.where(:waretype_id=>@waretype.ids)

    #debugger
    @all={"data"=>@warelabe,"waretype"=>@waretype}.to_json
    # debugger
    render json:(@all)
    # debugger
  end



  def shopcar
    userid = params[:userid]
    @user = User.find( params[:userid])
    @shopcars=@user.shoppingcars

    @shop = ""

    @shopcars.each do |i|
      @shop =@shop+i.ware_id.to_s+','
    end

    arry = Array.new(@shop.split(','))
    @shopss = Ware.find(arry)

    render json:(@shopss)

  end


  def busineselect
    busineid = params[:code]
    @business = Busine.where(:id =>busineid)
    #debugger
    render json:(@business)

  end

  def orderdetail
# ss= params[:status]
#     id = params[:userid]
#    rr= params[:status]
#     # debugger
#   if params[:status]==1
#    # debugger
    @type = params[:status]
    @user=User.find(params[:userid])
    @order=''
    if (params[:status]!="0")
    @order=@user.orders.where(state:params[:status])
 # debugger
    else
      @order=@user.orders
       # debugger
    end
# debugger

    @wareid=''
    @order.each do|i|
      @wareid=@wareid+i.ware_id.to_s+','
    end
    arr = Array.new(@wareid.split(','))


    @wares=Ware.find(arr)
@or = {"order"=>@order,"ware"=>@wares}.to_json
    render json:@or
     debugger
 # else
 #   render json:('[{"status":"0"}]')
 #
  end
    # debugger




  def collectlist
    #debugger
    userid = params[:userid]

    @user = User.find( params[:userid])
    @collects=@user.favorites
    # debugger
    @collect = ""

    @collects.each do |i|
      @collect =@collect+i.ware_id.to_s+','
    end

    arry = Array.new(@collect.split(','))
    @collectlist = Ware.find(arry)
    render json:(@collectlist)
    #debugger

  end

  def destroycollect
    wareid = params[:ware]

    @user=User.find(params[:userid])
#debugger
    @destroy=@user.favorites.where(:ware_id=>params[:ware])
# @destroycollect = Favorite.where(:ware_id=>params[:ware])
# debugger
    @destroy[0].destroy

  end

  def searchcollect

    #
    # @wares=Ware.all
    #  @wareid=''
    #  @wares.each do |f|
    #    @wareid=@wareid+f.ware_id.to_s+','
    #  end
    #  warearry = Array.new(@wareid.split(','))

    searchname = "e"
    @user = User.find(params[:userid])
    @seacollect = @user.favorites
    @userid=''
    @seacollect.each do |f|
      @userid=@userid+f.ware_id.to_s+','
    end
    collarry = Array.new(@userid.split(','))
    @ware = Ware.find(collarry)

    #debugger
    # @waresearch = @ware.where("ware like '%"+searchname+"%'")
  end


  def destroyshopcar
    @user=User.find(params[:userid])

    @destroy=@user.shoppingcars.where(:ware_id=>params[:ware])
    #debugger
    @destroy[0].destroy


  end

  def selectjifen

    @jifen = User.where(:id=>params[:userid])
    # debugger
    # render json:(@jifen)

    @detail = Integraldetailed.where(:user_id => params[:userid])
    # debugger
    @all={"jifen"=>@jifen,"detailjifen"=>@detail}.to_json

    # debugger
    render json: @all
  end

end
