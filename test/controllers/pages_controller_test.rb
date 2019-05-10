require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get about' do
    get about_path
    assert :success, "coudn't find about path"
  end

  test 'should get contact' do
    get contact_path
    assert :success, "coudn't find contact path"
  end

  test 'should get testimonies' do
    get testimonies_path
    assert :success, "coudn't find testimonies path"
  end
end
