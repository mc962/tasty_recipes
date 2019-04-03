require 'rails_helper'

describe IngredientsController, type: :controller do
    describe 'GET #new' do
        it 'renders the page' do
            get :new
            assert_response :success
        end
    end

    # describe 'GET #edit' do
    #     it 'renders the page' do
    #         get :edit
    #         assert_response :success
    #     end
    # end
end