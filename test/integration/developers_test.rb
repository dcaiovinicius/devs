class DevelopersTest < ActionDispatch::IntegrationTest
  test "list developers" do
    developer = developers(:one)

    get root_path

    assert_response :success

    assert_select "li article", 1

    assert_select "a[href=?]", developer_path(developer)

    assert_select "h3", text: developer.hero.truncate(140)
    assert_select "p", text: developer.bio.truncate(340)
  end
end
