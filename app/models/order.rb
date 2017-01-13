class Order < ApplicationRecord

  #belings_to :ware
 belongs_to :user

#自动确认收货
  def self.update_status

   @selorder=Order.where(["user_id = ? and state = ? and updated_at <?",1,2,Time.now-10.day])
   debugger
    @selorder.each do |t|
     t.state=4
     t.save
    end
  end
  #累加用户确认收货的总金额
  def self.sumshoushuo
   @user=User.all
   # debugger
   @pricesum=0
    @user.each do |s|

     @order=s.orders.where(["state=?",1])
     # debugger
     @order.each do |o|
      @pricesum=@pricesum+o.sum.to_i
      s.alreadamount=@pricesum
      s.arrear=@pricesum
      s.save
     end
     @pricesum=0
    end

  end

end
