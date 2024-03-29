require 'spec_helper'

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

describe DirectorsController do

  # This should return the minimal set of attributes required to create a valid
  # Director. As you add validations to Director, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all directors as @directors" do
      director = Director.create! valid_attributes
      get :index
      assigns(:directors).should eq([director])
    end
  end

  describe "GET show" do
    it "assigns the requested director as @director" do
      director = Director.create! valid_attributes
      get :show, :id => director.id.to_s
      assigns(:director).should eq(director)
    end
  end

  describe "GET new" do
    it "assigns a new director as @director" do
      get :new
      assigns(:director).should be_a_new(Director)
    end
  end

  describe "GET edit" do
    it "assigns the requested director as @director" do
      director = Director.create! valid_attributes
      get :edit, :id => director.id.to_s
      assigns(:director).should eq(director)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Director" do
        expect {
          post :create, :director => valid_attributes
        }.to change(Director, :count).by(1)
      end

      it "assigns a newly created director as @director" do
        post :create, :director => valid_attributes
        assigns(:director).should be_a(Director)
        assigns(:director).should be_persisted
      end

      it "redirects to the created director" do
        post :create, :director => valid_attributes
        response.should redirect_to(Director.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved director as @director" do
        # Trigger the behavior that occurs when invalid params are submitted
        Director.any_instance.stub(:save).and_return(false)
        post :create, :director => {}
        assigns(:director).should be_a_new(Director)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Director.any_instance.stub(:save).and_return(false)
        post :create, :director => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested director" do
        director = Director.create! valid_attributes
        # Assuming there are no other directors in the database, this
        # specifies that the Director created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Director.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => director.id, :director => {'these' => 'params'}
      end

      it "assigns the requested director as @director" do
        director = Director.create! valid_attributes
        put :update, :id => director.id, :director => valid_attributes
        assigns(:director).should eq(director)
      end

      it "redirects to the director" do
        director = Director.create! valid_attributes
        put :update, :id => director.id, :director => valid_attributes
        response.should redirect_to(director)
      end
    end

    describe "with invalid params" do
      it "assigns the director as @director" do
        director = Director.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Director.any_instance.stub(:save).and_return(false)
        put :update, :id => director.id.to_s, :director => {}
        assigns(:director).should eq(director)
      end

      it "re-renders the 'edit' template" do
        director = Director.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Director.any_instance.stub(:save).and_return(false)
        put :update, :id => director.id.to_s, :director => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested director" do
      director = Director.create! valid_attributes
      expect {
        delete :destroy, :id => director.id.to_s
      }.to change(Director, :count).by(-1)
    end

    it "redirects to the directors list" do
      director = Director.create! valid_attributes
      delete :destroy, :id => director.id.to_s
      response.should redirect_to(directors_url)
    end
  end

end
