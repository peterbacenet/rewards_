class PartnersController < ApplicationController

    def points_balance
        #for each partner, calculate and return transaction balances that are UNREDEEMED
        result = []
        Partner.all.each do |p|
            points = p.transactions.where(redeemed: false).sum(:points)
            result << { p.name => points}
        end
        render json: result, status: 200
    end

    def balance
        #for a single partner, get UNREDEEMED balance

        selected_partner = Partner.find(params[:id])
        points = selected_partner.transactions.where(redeemed: false).sum(:points)
        result = []
        result << {selected_partner.name => points }
        render json: result, status: 200
    end
end
