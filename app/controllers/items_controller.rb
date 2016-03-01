class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      require 'amazon/ecs'
      Amazon::Ecs.options = {
        :associate_tag => Rails.application.secrets.associate_tag,                                                                                                                                                  
        :AWS_access_key_id => Rails.application.secrets.aws_access_key_id,                                                                                                                                  
        :AWS_secret_key => Rails.application.secrets.aws_secret_key                                                                                                                    
        }
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :search_index => 'All' , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      @amazon_items = response.items

    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
