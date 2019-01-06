class ItemsController < ApplicationController

    before_action :find_item,   only: [:show, :edit, :update, :destroy]
    # before_action :user_is_admin, only: [:show, :create, :update, :destroy]

    def index
        @items = Item.all
    end
    def show
        @items = Item.all
    end
    def new
        @item = Item.new
    end
    def create
        @item = Item.new(items_params)
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
            @items = Item.all
        end
end
