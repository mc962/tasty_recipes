require 'rails_helper'

describe LandingController, type: :controller do
    describe 'GET #home' do
        it 'renders the page' do
            get :home
            assert_response :success
        end
    end
end