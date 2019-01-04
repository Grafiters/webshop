class ItemsController < ApplicationController

    before_action :find_item,   only: [:show, :edit, :update, :destroy]

    def index
        
    end
    def show
        
    end
    def new
        @item = Item.new
    end
    def create
        @item = Items.new(items_params)
        if @item.save
            flash[:add_items_success] = ['items has been created']
            redirect_to '/'
        else
            flash[:add_items_errors] = ['items not create, please fill the correctly form']
            redirect_to '/add-items'
        end
    end
    
    private
        def items_params
            params.require(:item).permit(:title, :description, :price, :image)
        end
        def find_item
            @item = Item.find(params[:id])
        end
                
end
