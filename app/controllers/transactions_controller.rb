class TransactionsController < ApplicationController

    def create
    new_tran = Transaction.new(trans_params)
    if new_tran.save
        # new_tran.partner.update(balance: (new_tran.partner.balance + new_tran.points))
        render json: new_tran, status: :created
    else
        render json new_tran.errors, status: 422
    end
end


    def spend
    #establish method variables, points we want to spend versus available points
    spend_points = (params[:points])
    result = []
    available_points = (Transaction.all.where(redeemed:false).sum(:points))

        if (spend_points > available_points) 
            #if we try to take out more than is available to redeem, reject spend call, so that balances never dip below zero
            render json: "Not Enough Points!", status: 400
        else
            #if we have enough to cover, continue
            #order transactions via timestamp
        Transaction.all.order([:timestamp])
            Transaction.all.each do |trans|
                #iterate through each transaction, first verifying if it is redeemed, and if spend_points does not equal zero
                    if (trans.redeemed == false && spend_points > trans.points && spend_points != 0)
                        # update spend points
                            spend_points = spend_points - trans.points
                        #update redemption boolean for trans
                            trans.update(:redeemed => true)
                        # push to final result in proper formatting
                            name = trans.partner.name
                            points = -trans.points
                            
                            result << {:payer => name , :points => points}

                    elsif (trans.redeemed == false && trans.points > spend_points && spend_points != 0)
                        #final loop, when we will partially redeem from the last payer to cover spend_points
                        #get new transaction point value, this will be a new transaction left unredeemed from the same payer
                            remaining_bal = trans.points - spend_points
                        #push final transaction to result
                            result << {:payer => trans.partner.name, :points => -spend_points}
                        #update final transaction
                            trans.update(:redeemed => true)
                        #log new leftover transaction with the points from remaining balance
                            Transaction.create!(user_id:trans.user_id, partner_id:trans.partner_id,  redeemed: false, points:remaining_bal, timestamp:trans.timestamp)
                        #update spend_points to zero
                            spend_points=0
                            #returns transactions logged and created from the loop, demonstrating how many points were deducted and from who
                            render json: result, status: 200
                    end
        end
    end     
end 

private

    def trans_params
        params.permit(:user_id, :partner_id, :redeemed, :timestamp, :points)
    end

end
