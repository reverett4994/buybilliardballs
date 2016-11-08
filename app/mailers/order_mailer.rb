class OrderMailer < ApplicationMailer
    default from: 'Orders@BuyBalliardBalls.com'

    def order(first_name,last_name,email,order_number,order_id)
      @first_name=first_name
      @last_name=last_name
      @email=email
      @order_number=order_number
      @order_id=order_id
      mail(to:@email,subject:'Order Review')
    end
    def contact(subject,content,email)
      @subject=subject
      @content=content
      @email=email
      mail(to:"pattonsrevolver@gmail.com",subject:@subject)
    end

end
