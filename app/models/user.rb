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





#计算需返的积分
  def self.jisuanjifen
    @user=User.all
    @user.each do |u|
      if u.arrear.to_i>=1000 #判断是否达到返利条件
        weishu=  u.arrear.to_i%1000 #求出尾数

        jifen=(u.arrear.to_i-weishu)*0.5#当天该返的积分
        u.rebate=u.rebate.to_f+jifen#积分累加
        u.arrear=weishu#保存尾数
        u.save
# debugger
      end
    end

  end


  def self.Marketingamount
    #计算平台当天总营销额
    # Order.where(:created_at =>(Time.now-1.day).beginning_of_day..Time.now.midnight.end_of_day)

    @order=Order.where(:created_at =>(Time.now-1.day).beginning_of_day..Time.now.midnight.end_of_day)
    @user=User.all
    @sum=0
    @dianshu=0
    #debugger
    #计算平台当天营销额
    @order.each do|t|
      @sum=@sum+t.sum.to_i
    end

    #计算平台点数
    @user.each do |u|
      if u.backintegration.to_f<u.rebate.to_f#如果已返积分小于需返积分
        @dianshu=@dianshu+ (u.alreadamount.to_i/1000)#得到平台点数

      end
    end
    # debugger
    #求当天每个点数需返的积分
    @todaysmount=(@sum*0.04)/@dianshu
    debugger
    #每个用返多少积分
    @user.each do |f|
      # debugger
      if f.backintegration.to_f<f.rebate.to_f #判断是否达到返利条件

        @userdianshu=f.alreadamount.to_i/1000#计算有用户点数
        canbackjifen=@userdianshu*@todaysmount #该用户可以返还的积分
        chazhi=f.rebate.to_f-f.backintegration.to_f  #需返还积分与已返还差值
        if canbackjifen>chazhi
          f.backintegration=f.backintegration.to_f+chazhi
          @integ=Integraldetailed.create(user_id:f.id,integralnumber:chazhi,status:0)
        else
          f.backintegration=f.backintegration.to_f+canbackjifen
          @integ=Integraldetailed.create(user_id:f.id,integralnumber:canbackjifen,status:0)
        end
        f.save

      end

    end



  end



end
