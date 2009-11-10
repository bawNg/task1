require 'test_helper'

class CoveragesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Coverage.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Coverage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Coverage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to coverage_url(assigns(:coverage))
  end
  
  def test_edit
    get :edit, :id => Coverage.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Coverage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Coverage.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Coverage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Coverage.first
    assert_redirected_to coverage_url(assigns(:coverage))
  end
  
  def test_destroy
    coverage = Coverage.first
    delete :destroy, :id => coverage
    assert_redirected_to coverages_url
    assert !Coverage.exists?(coverage.id)
  end
end
