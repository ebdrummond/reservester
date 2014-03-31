require 'spec_helper'

describe RestaurantsController do
  let(:invalid_params) {
    { restaurant:
      {
        name: nil,
        description: "yummy",
        street_1: "123 Street",
        city: "Chicago",
        state: "IL",
        zip: "60657",
        phone: "(312) 555-5555"
      }
    }
  }

  let(:valid_params) {
    params = invalid_params
    params[:restaurant][:name] = "restaurant"
    params
  }

  context "GET new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context "POST create" do
    context "with invalid params" do
      it "does not create a new restaurant" do
        expect{ post :create, invalid_params }.to change(Restaurant, :count).by(0)
      end

      it "renders the :new form with an alert flash message" do
        post :create, invalid_params
        expect(controller).to render_template(:new)
        expect(flash[:error]).to_not be_empty
      end
    end

    context "with valid params" do
      it "creates a new restaurant" do
        expect{ post :create, valid_params }.to change(Restaurant, :count).by(1)
      end

      it "redirects to the restaurant show page" do
        post :create, valid_params
        expect(response).to redirect_to(restaurant_path(Restaurant.last))
      end
    end
  end

  context "GET show" do
    let(:restaurant) { Restaurant.create(valid_params[:restaurant]) }

    it "renders the show template" do
      get :show, id: restaurant.id
      expect(controller).to render_template(:show)
    end
  end

  context "GET edit" do
    let(:restaurant) { Restaurant.create(valid_params[:restaurant]) }

    before { get :edit, id: restaurant.id }

    it "assigns @restaurant to the correct restaurant" do
      expect(assigns(:restaurant)).to eq(restaurant)
    end

    it "renders the :edit template" do
      expect(response).to render_template(:edit)
    end
  end

  context "PUT update" do
    let(:restaurant) { Restaurant.create(valid_params[:restaurant]) }

    context "with invalid params" do
      before { put :update, id: restaurant.id, restaurant: { name: nil } }

      it "does not update the restaurant" do
        expect(restaurant.name).to_not be_nil
      end

      it "renders the :edit template" do
        expect(response).to render_template(:edit)
      end
    end

    context "with valid params" do
      before { put :update, id: restaurant.id, restaurant: { name: "cafe" } }

      it "updates the restaurant" do
        restaurant.reload
        expect(restaurant.name).to eq("cafe")
      end

      it "redirects to the restaurant show page" do
        expect(response).to redirect_to(restaurant_path(restaurant))
      end
    end
  end

  context "DELETE destroy" do
    let!(:restaurant) { Restaurant.create(valid_params[:restaurant]) }

    it "destroys the restaurant" do
      expect{ delete :destroy, id: restaurant.id }.to change(Restaurant, :count).by(-1)
    end

    it "redirects to the restaurant index path" do
      delete :destroy, id: restaurant.id
      expect(response).to redirect_to(restaurants_path)
    end
  end
end
