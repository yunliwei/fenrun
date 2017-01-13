class User < ApplicationRecord

  has_attached_file :headpicture, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :headpicture


  has_many :examines
  has_many :favorites
  has_many :shoppingcars
  has_many :integraldetaileds
  has_many :receiptadds
  has_many :orders
  has_many :carnumbers
  has_many :withdraws


  def self.createuser

    user = User.create(username:'whenever',password_digest:'123',email:'123@qq.com')
  end
#计算需返的积分
  def self.jisuanjifen
    @user=User.all
    @user.each do |u|
      if u.arrear.to_i>=1000 #判断是否达到返利条件
        weishu=  u.arrear.to_i%1000 #求出尾数

        jifen=(u.arrear.to_i-weishu)*0.5#当天该返的积分
        u.rebate=u.rebate+jifen#积分累加
        u.arrear=weishu#保存尾数
        u.save
# debugger
      end
    end

  end


  def self.Marketingamount
    #计算平台当天总营销额
    @order=Order.where("create_at= ?",Time.now)
    @user=User.all
    @sum=0
    @dianshu=0
    #计算平台当天营销额
    @order.each do|t|
      @sum=@sum+t.sum.to_i
    end

    #计算用户点数
      @user.each do |u|
        if u.backintegration<u.rebate#如果已返积分小于需返积分
          @dianshu=@dianshu+ (u.alreadamount/1000)#得到用户点数

        end
      end
      #求当天每个点数需返的积分
      @todaysmount=@sum/@dianshu
#每个用返多少积分
      @user.each do |f|
        if f.backintegration.to_f<f.rebate.to_f #判断是否达到返利条件
            canbackjifen=@dianshu*@todaysmount #该用户可以返还的积分
            chazhi=f.rebate.to_f-f.backintegration.to_f  #需返还积分与已返还差值
          if canbackjifen>chazhi
            f.backintegration=f.backintegration+chazhi
            @integ=Integraldetailed.create(user_id:f.id,integralnumber:chazhi,status:0)
          else
            f.backintegration=f.backintegration+canbackjifen
            @integ=Integraldetailed.create(user_id:f.id,integralnumber:canbackjifen,status:0)
          end
       f.save

        end

      end



  end



end
