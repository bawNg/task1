require 'test_helper'

class ContactshipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contactships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contactship" do
    assert_difference('Contactship.count') do
      post :create, :contactship => { }
    end

    assert_redirected_to contactship_path(assigns(:contactship))
  end

  test "should show contactship" do
    get :show, :id => contactships(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contactships(:one).to_param
    assert_response :success
  end

  test "should update contactship" do
    put :update, :id => contactships(:one).to_param, :contactship => { }
    assert_redirected_to contactship_path(assigns(:contactship))
  end

  test "should destroy contactship" do
    assert_difference('Contactship.count', -1) do
      delete :destroy, :id => contactships(:one).to_param
    end

    assert_redirected_to contactships_path
  end
end
