module RecipesHelper
    def form_visibility_class(show_flag)
        if show_flag
            'invisible'
        else
            ''
        end
    end
end
