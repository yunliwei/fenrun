class MobilesController < ApplicationController




  def reg

    aa=params[:name]
    # debugger
    user=User.find_by(username:params[:name])
    if(user==nil)
      user = User.create(username:params[:name],password_digest:params[:password],email:params[:email])
      success='[{"status":"1"}]'
      # render json:('[{"status":"1"}]')
      render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
    else
      failed='[{"status":"0"}]'
      # render json:('[{"status":"0"}]')
      render json: params[:callback]+'('+ failed+')' , content_type: "application/javascript"
    end

  end

  def login

    user=User.find_by(username:params[:name],password_digest:params[:password])


    if(user!=nil)

      # session[:name]="123"
      #       session[:password]="321"
      id=user.id.to_s
      success='[{"status":"1","id":"'+id+'","name":"'+user.username+'"}]'
      #debugger
      # render json:('[{"status":"1","id":"'+id+'"}]')
      render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
      #debugger

    else
      failed='[{"status":"0"}]'
      # render json:('[{"status":"0"}]')
      render json: params[:callback]+'('+ failed+')' , content_type: "application/javascript"

    end
  end

  def userinformation
     @information=User.where(:id=>params[:userid])
     render json: params[:callback]+'('+ @information.to_json+')' , content_type: "application/javascript"

  end

  def createaddress
    @receiptadd=Receiptadd.create(user_id:params[:userid],shouhuoname:params[:name],address:params[:address],phonenumber:params[:phonenumber],isselect:0)
    success='[{"status":"1"}]'
    render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
  end

  def isselectaddress
    user=User.find(params[:userid])
    address=user.receiptadds
    address.each do|f|
      f.isselect=0
      f.save
    end

    @receiptadd=Receiptadd.find(params[:addressid])

    @receiptadd.update(isselect:1)
    @receiptadd.save
    # render json: params[:callback]+'('+ @receiptadd.to_json+')' , content_type: "application/javascript"
  end

  def addresslist
    @user=User.find(params[:userid])
   @users= @user.receiptadds
    render json: params[:callback]+'('+ @users.to_json+')' , content_type: "application/javascript"

  end
   def deleteaddress
     @del=Receiptadd.find(params[:addressid])

     @del.destroy
     success='[{"status":"1"}]'
     render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
   end
   def updateaddress
     @update=Receiptadd.find(params[:addressid])
     @update.update(shouhuoname:params[:name],phonenumber:params[:phonenumber],address:params[:address])
     @update.save
     success='[{"status":"1"}]'
     render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
   end

  def shangjiaruzhu

    businesssettled = Businesssettled.find_by(name:params[:ruzhuname])
    if(businesssettled==nil)
      businesssettled = Businesssettled.create(name:params[:ruzhuname],phonenumber:params[:ruzhuphone])
      success='[{"status":"1"}]'
      render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
      # render json:('[{"status":"1"}]')
    else
      failed='[{"status":"0"}]'
      # render json:('[{"status":"0"}]')
      render json: params[:callback]+'('+ failed+')' , content_type: "application/javascript"
    end

  end

  def shangjiatype

    busines = Busine.find_by(name:params[:shangjianame])
    if(busines==nil)
      busines = Busine.create(name:params[:shangjianame])
      sta = '[{"status":"1"}]'
      fail = '[{"status":"0"}]'
      render json: params[:callback]+'('+ sta+')' , content_type: "application/javascript"
    else

      render json: params[:callback]+'('+ fail+')' , content_type: "application/javascript"
    end

  end

  def search
    searchware = params[:sea].to_s
    waretype = params[:type].to_s
    if(searchware !="")
      @search = Ware.where("ware like '%"+searchware+"%'")
      #debugger
      render json: params[:callback]+'('+ @search.to_json+')' , content_type: "application/javascript"

    else if(waretype!="")
           a=Classification.where(:classname=>waretype)
           @ware = Classification.find(a.first.id)
           @search=@ware.wares
           #  debugger
           render json: params[:callback]+'('+ @search.to_json+')' , content_type: "application/javascript"
         end
    end


  end


  def warelist

    @ware = Ware.all
    # render json:(@ware)
    render json: params[:callback]+'('+ @ware.to_json+')' , content_type: "application/javascript"
  end


  def businelist
    @busines = Busine.all
    # render json:(@busines)
    render json: params[:callback]+'('+ @busines.to_json+')' , content_type: "application/javascript"
  end

  def selecttype

    searchname = params[:sea].to_s
    searchtype= params[:type].to_s

    if ( searchname !="")
      @busines = Busine.where("name like '%"+searchname+"%'")
      render json: params[:callback]+'('+ @busines.to_json+')' , content_type: "application/javascript"
    else if(searchtype !="")
           a=Classification.where(:classname=>searchtype)
           @busine = Classification.find(a.first.id)
           @bus=@busine.busines

           render json: params[:callback]+'('+ @bus.to_json+')' , content_type: "application/javascript"
         end

    end

  end

  def detail
    # goods = params[:code]
    @goods = Ware.where(:id => params[:code])
    @picture=Warepicture.where(:ware_id=>params[:code])

    @all={"goodsdata"=>@goods,"warepicture"=>@picture}.to_json
    # debugger

    # render json:(@goods)
    render json: params[:callback]+'('+ @goods.to_json+')' , content_type: "application/javascript"
  end

  def collect
    collect = params[:code]
    user = params[:userid]

    @user = User.find( params[:userid])
    @collects=@user.favorites
    success='[{"status":"1"}]'
    fail='[{"status":"0"}]'
    # # debugger
    ff=Favorite.find_by(ware_id:params[:code])
    if (ff == nil)
      @collect = Favorite.create(ware_id:params[:code],user_id:params[:userid],link:params[:link])

        render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"

    else

        render json: params[:callback]+'('+ fail+')' , content_type: "application/javascript"
    end
    # if @collects.empty?
    #   @collect = Favorite.create(ware_id:params[:code],user_id:params[:userid],link:params[:link])
    #
    #
    #   # render json:('[{"status":"0"}]')
    #   render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
    #   # debugger
    # else
    #   @collects.each do |t|
    #     # debugger
    #     if t.ware_id.to_s!=collect
    #       debugger
    #       @collect = Favorite.create(ware_id:params[:code],user_id:params[:userid],link:params[:link])
    #       # render json:('[{"status":"0"}]')
    #       render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
    #     else
    #       # render json:('[{"status":"0"}]')
    #       render json: params[:callback]+'('+ fail+')' , content_type: "application/javascript"
    #     end
    #   end
    # end

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
    # render json:(@all)
    render json: params[:callback]+'('+ @all.to_json+')' , content_type: "application/javascript"
#   else
#     render json:('[{"status":"0"}]')
#     debugger
# end
  end

  def createorder
     userid = params[:userid]
    #debugger
    @order = Order.create(ware_id:params[:wareid],user_id:params[:userid],number:params[:number],sum:params[:sum],userintegral:params[:user],state:params[:state],fare:params[:fare],ramarks:params[:ramark],ordernumber:params[:ordernumber],receiptadd_id:params[:receiptadd_id])
    #debugger
    # render json:(@order)
    # render json: params[:callback]+'('+ @order.to_json+')' , content_type: "application/javascript"
    success='[{"status":"1"}]'
    fail='[{"status":"0"}]'
    render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
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
    # render json:(@shopcar)

    success='[{"status":"1"}]'
    # render json:('[{"status":"0"}]')
    render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"


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
    # render json:(@all)
    # debugger
    render json: params[:callback]+'('+ @all.to_json+')' , content_type: "application/javascript"
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

    #render   json: params[:callback]+ '([{"status":"0"}])',content_type: "application/javascript"
    render json: params[:callback]+'('+ @shopss.to_json+')' , content_type: "application/javascript"

    # render file: filename, content_type: "application/rss"

  end


  def busineselect
    busineid = params[:code]
    @business = Busine.where(:id =>busineid)
    #debugger
    # render json:(@business)
    render json: params[:callback]+'('+ @business.to_json+')' , content_type: "application/javascript"
  end
def businepicture
  @busene=Busine.find(params[:code])
  @businepictures=@busene.businespictures
  # debugger
  render json: params[:callback]+'('+ @businepictures.to_json+')' , content_type: "application/javascript"

end

  def warepicture
    @ware=Ware.find(params[:code])
    @warepicture=@ware.warepictures
    # debugger
    render json: params[:callback]+'('+ @warepicture.to_json+')' , content_type: "application/javascript"

  end
  def orderdetail
# ss= params[:status]
#     id = params[:userid]
#    rr= params[:status]
#     # debugger
#   if params[:status]==1
#    # debugger
#     @type = params[:status]
    @user=User.find(params[:userid])

    @order=''
    # if (params[:status]!="0")
      @order=@user.orders.where(state:1)
     #  debugger
    # else
    #   @order=@user.orders
      # debugger
    # end
#debugger

    #@wareid=@order.ware_id
    wareid=0
    if @order
      @order.each do |f|
        wareid=f.ware_id
      end
    end
    @wareid=wareid

    # @order.each do|i|
    #   @wareid=@wareid+i.ware_id.to_s+','
    # end
    # arr = Array.new(@wareid.split(','))


    @wares=Ware.where(id:@wareid)
    @or = {"order"=>@order,"ware"=>@wares}
    # render json:@or
    render json: params[:callback]+'('+ @or.to_json+')' , content_type: "application/javascript"
# debugger
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
    # render json:(@collectlist)
    render json: params[:callback]+'('+ @collectlist.to_json+')' , content_type: "application/javascript"
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


  def editpassword
    old = params[:old]
    new = params[:new]
    userid = params[:userid]


    @userid = User.where(:id=>userid)

   @userid.each do |f|
     if  f.password_digest==old
       f.password_digest=new
       f.save

       # render json:('[{"status":"1"}]')
       success='[{"status":"1"}]'
     else
       success='[{"status":"0"}]'
     end

     render json: params[:callback]+'('+ success+')' , content_type: "application/javascript"
   end
  end

  def selectjifen

    @jifen = User.where(:id=>params[:userid])
    # debugger
    # render json:(@jifen)

    @detail = Integraldetailed.where(:user_id => params[:userid])
    # debugger
    @all={"jifen"=>@jifen,"detailjifen"=>@detail}.to_json

    # debugger
    # render json: @all
    render json: params[:callback]+'('+ @all.to_json+')' , content_type: "application/javascript"
  end
  #商家录单
  def ludan
    @ludan=Ludan.create(ordernumber:params[:ordernumber],warename:params[:warename],payment:params[:payment],amount:params[:amount],servicecharges:params[:servicecharges],username:params[:username],name:params[:name],user_id:params[:userid])
    @ludan.save
    success='[{"status":"1"}]'
    render json: params[:callback]+'('+success+')' , content_type: "application/javascript"
  end
  def checkshangjia
    phonenumber=""
    success='[{"status":"1"}]'
    failed='[{"status":"0"}]'
    @user=User.where(:id=>params[:userid])
    @user.each do |u|
      phonenumber=u.username;
    end
   # debugger
    @shangjia=Busine.where(:phonenumber=>phonenumber)
    if @shangjia.count>0
      render json: params[:callback]+'('+success+')' , content_type: "application/javascript"
    else
      render json: params[:callback]+'('+failed+')' , content_type: "application/javascript"
    end
  end

  def shangjiachongzhi
    phonenumber=""
    success='[{"status":"1"}]'
    # failed='[{"status":"0"}]'
    @user=User.where(:id=>params[:userid])
    @user.each do |u|
      phonenumber=u.username;
    end
    # debugger
    @shangjia=Busine.where(:phonenumber=>phonenumber)
    @shangjia.each do |s|
      s.balance=s.balance.to_f+params[:balance].to_f
      s.save
    end
    # debugger
    render json: params[:callback]+'('+success+')' , content_type: "application/javascript"
  end


end