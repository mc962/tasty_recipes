class RecipesController < ApplicationController
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            # TODO set friendly error messages
            flash.now[:error] = @recipe.errors.full_messages
            render json: {}, status: 422
        end
    end

    def new
        @recipe = Recipe.new
        render :new
    end
    
    def edit
        @recipe = Recipe.find(params[:id])
        render :edit
    end
    
    def show
        @recipe = Recipe.find(params[:id])
        render :show
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to :show
        else
            # TODO set friendly error messages
            flash.now[:error] = @recipe.errors.full_messages
            render :edit
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(
            :name, 
            :description, 
            :completion_time,
            recipe_steps_attributes: [
                :instruction, 
                :step_number,
                recipe_step_ingredients_attributes: [
                    :amount,
                    :amount_unit,
                    ingredient_attributes: [
                        :name, 
                        :description
                    ]
                ]
            ]
        )
    end
end
