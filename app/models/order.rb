class Order < ApplicationRecord

  #belings_to :ware
 belongs_to :user


  def selectorder
   @selorder=Order.all
  end

end
