class IngredientsController < ApplicationController
    def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
            redirect_to :show
        else
            # TODO set friendly error messages
            flash.now[:error] = @ingredient.errors.full_messages
            render :new
        end
    end

    def new
        @recipes = Recipe.all # TODO replace with Elasticsearch/more efficient search
        @ingredient = Ingredient.new
        render :new
    end
    
    def edit
        @ingredient = Ingredient.find(params[:id])
        render :edit
    end
    
    def show
        @ingredient = Ingredient.find(params[:id])
        render :show
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        if @ingredient.update(ingredient_params)
            redirect_to :show
        else
            # TODO set friendly error messages
            flash.now[:error] = @ingredient.errors.full_messages
            render :edit
        end
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(
                :name, 
                :description,
                :profile_image
            )
    end
end
