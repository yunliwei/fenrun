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
     if u.phonenumber.to_i>=1000 #判断是否达到返利条件
      a=  u.phonenumber.to_i%1000
     @b=u.phonenumber.to_i%1000

# debugger
     end
   end

  end


  def self.Marketingamount
    #计算平台当天总营销额
    @order=Order.where("create_at= ?",Time.now)
    @sum=0
    @order.each do|t|
      @sum=@sum+@order.sum.to_i
      #计算用户点数
      @dianshu=0
      @user=User.all
      @user.each do |u|
        if(已帆积分<需帆积分)
         @dianshu=@dianshu+ (u.已收货的金额/基数)

        end
      end
      #求当天每个点数需帆的积分
      @todaysmount=@sum/@dianshu

      @user.each do |f|
        if u.phonenumber.to_i>=1000 #判断是否达到返利条件
        #  a=  u.phonenumber.to_i%1000
          @b=u.phonenumber.to_i%1000


        end

    end


  end
end



  end
