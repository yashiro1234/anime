require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe AnimeStaffRelatesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # AnimeStaffRelate. As you add validations to AnimeStaffRelate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnimeStaffRelatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all anime_staff_relates as @anime_staff_relates" do
      anime_staff_relate = AnimeStaffRelate.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:anime_staff_relates)).to eq([anime_staff_relate])
    end
  end

  describe "GET #show" do
    it "assigns the requested anime_staff_relate as @anime_staff_relate" do
      anime_staff_relate = AnimeStaffRelate.create! valid_attributes
      get :show, {:id => anime_staff_relate.to_param}, valid_session
      expect(assigns(:anime_staff_relate)).to eq(anime_staff_relate)
    end
  end

  describe "GET #new" do
    it "assigns a new anime_staff_relate as @anime_staff_relate" do
      get :new, {}, valid_session
      expect(assigns(:anime_staff_relate)).to be_a_new(AnimeStaffRelate)
    end
  end

  describe "GET #edit" do
    it "assigns the requested anime_staff_relate as @anime_staff_relate" do
      anime_staff_relate = AnimeStaffRelate.create! valid_attributes
      get :edit, {:id => anime_staff_relate.to_param}, valid_session
      expect(assigns(:anime_staff_relate)).to eq(anime_staff_relate)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AnimeStaffRelate" do
        expect {
          post :create, {:anime_staff_relate => valid_attributes}, valid_session
        }.to change(AnimeStaffRelate, :count).by(1)
      end

      it "assigns a newly created anime_staff_relate as @anime_staff_relate" do
        post :create, {:anime_staff_relate => valid_attributes}, valid_session
        expect(assigns(:anime_staff_relate)).to be_a(AnimeStaffRelate)
        expect(assigns(:anime_staff_relate)).to be_persisted
      end

      it "redirects to the created anime_staff_relate" do
        post :create, {:anime_staff_relate => valid_attributes}, valid_session
        expect(response).to redirect_to(AnimeStaffRelate.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved anime_staff_relate as @anime_staff_relate" do
        post :create, {:anime_staff_relate => invalid_attributes}, valid_session
        expect(assigns(:anime_staff_relate)).to be_a_new(AnimeStaffRelate)
      end

      it "re-renders the 'new' template" do
        post :create, {:anime_staff_relate => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested anime_staff_relate" do
        anime_staff_relate = AnimeStaffRelate.create! valid_attributes
        put :update, {:id => anime_staff_relate.to_param, :anime_staff_relate => new_attributes}, valid_session
        anime_staff_relate.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested anime_staff_relate as @anime_staff_relate" do
        anime_staff_relate = AnimeStaffRelate.create! valid_attributes
        put :update, {:id => anime_staff_relate.to_param, :anime_staff_relate => valid_attributes}, valid_session
        expect(assigns(:anime_staff_relate)).to eq(anime_staff_relate)
      end

      it "redirects to the anime_staff_relate" do
        anime_staff_relate = AnimeStaffRelate.create! valid_attributes
        put :update, {:id => anime_staff_relate.to_param, :anime_staff_relate => valid_attributes}, valid_session
        expect(response).to redirect_to(anime_staff_relate)
      end
    end

    context "with invalid params" do
      it "assigns the anime_staff_relate as @anime_staff_relate" do
        anime_staff_relate = AnimeStaffRelate.create! valid_attributes
        put :update, {:id => anime_staff_relate.to_param, :anime_staff_relate => invalid_attributes}, valid_session
        expect(assigns(:anime_staff_relate)).to eq(anime_staff_relate)
      end

      it "re-renders the 'edit' template" do
        anime_staff_relate = AnimeStaffRelate.create! valid_attributes
        put :update, {:id => anime_staff_relate.to_param, :anime_staff_relate => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested anime_staff_relate" do
      anime_staff_relate = AnimeStaffRelate.create! valid_attributes
      expect {
        delete :destroy, {:id => anime_staff_relate.to_param}, valid_session
      }.to change(AnimeStaffRelate, :count).by(-1)
    end

    it "redirects to the anime_staff_relates list" do
      anime_staff_relate = AnimeStaffRelate.create! valid_attributes
      delete :destroy, {:id => anime_staff_relate.to_param}, valid_session
      expect(response).to redirect_to(anime_staff_relates_url)
    end
  end

end
