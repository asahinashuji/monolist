class RankingsController < ApplicationController
  def have
    @ranking_have_item = Ownership.where(type: 'Have').group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    
    # view では
    # @ranking_have_item.each do |item_id, count_value|
    #   item = Item.find(item_id)
    # end
    
    render 'have'
  end
  
  def want
    @ranking_want_item = Ownership.where(type: 'Want').group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    render 'want'
  end
end
