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
  end

  test "fails to create with invalid params" do
    sign_in users(:two)

    assert_no_difference -> { Developer.count } do
      post developers_path, params: {
        developer: developer_params.merge(hero: "")
      }
    end

    assert_response :unprocessable_entity
  end

  test "successfully update a developer" do
    sign_in users(:one)
    developer = developers(:one)

    patch developer_path(developer), params: { developer: developer_params }

    assert_redirected_to developer_path(developer)
  end

  test "fails to update with invalid params" do
    sign_in users(:one)
    developer = developers(:one)

    patch developer_path(developer), params: { developer: invalid_developer_params }

    assert_response :unprocessable_entity
  end

  test "can't update a developer profile of another user" do
    sign_in users(:two)
    developer = developers(:one)

    patch developer_path(developer), params: { developer: developer_params }

    assert_response :forbidden
  end

  test "requires authentication to create a developer" do
    assert_difference "Developer.count", 0 do
      post developers_path, params: { developer: developer_params }
    end

    assert_redirected_to new_user_session_path
  end

  test "shows 404 for non-existent developer" do
    sign_in users(:one)
    get developer_path(id: 42)
    assert_response :not_found
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

  def invalid_developer_params
    {
      hero: "",
      bio: "",
      available_on: nil,
      website: "https://example.com",
      github: "https://github.com/test",
      twitter: "https://twitter.com/test"
    }
  end
end
