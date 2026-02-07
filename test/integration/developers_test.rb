class DevelopersTest < ActionDispatch::IntegrationTest
  test "list developers" do
    sign_in users(:one)
    developer = developers(:one)

    get root_path
    assert_select "li article", 1
    assert_select "a[href=?]", developer_path(developer)
    assert_response :success
  end

  test "sucessfully create a new developer" do
    sign_in users(:two)

    assert_difference "Developer.count", 1 do
      post developers_path, params: { developer: developer_params }
    end

    assert_redirected_to developer_path(Developer.last)
  end

  test "successfully update a developer" do
    sign_in users(:one)
    developer = developers(:one)

    patch developer_path(developer), params: { developer: developer_params }

    assert_redirected_to developer_path(developer)
  end

  test "can't update a developer profile of another user" do
    sign_in users(:two)
    developer = developers(:one)

    patch developer_path(developer), params: { developer: developer_params }

    assert_response :unauthorized
  end

  private

  def developer_params
    {
      hero: "New hero",
      bio: "New bio",
      available_on: Date.tomorrow,
      website: "https://example.com",
      github: "https://github.com/test",
      twitter: "https://twitter.com/test"
    }
  end
end
