require 'test_helper'

class CoveragePeriodsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => CoveragePeriod.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    CoveragePeriod.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    CoveragePeriod.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to coverage_period_url(assigns(:coverage_period))
  end
  
  def test_edit
    get :edit, :id => CoveragePeriod.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    CoveragePeriod.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CoveragePeriod.first
    assert_template 'edit'
  end
  
  def test_update_valid
    CoveragePeriod.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CoveragePeriod.first
    assert_redirected_to coverage_period_url(assigns(:coverage_period))
  end
  
  def test_destroy
    coverage_period = CoveragePeriod.first
    delete :destroy, :id => coverage_period
    assert_redirected_to coverage_periods_url
    assert !CoveragePeriod.exists?(coverage_period.id)
  end
end
