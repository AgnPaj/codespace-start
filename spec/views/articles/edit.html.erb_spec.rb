require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  let(:article) {
    Article.create!(
      title: "MyString",
      content: "MyText",
      user_id: 1
    )
  }

  before(:each) do
    assign(:article, article)
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(article), "post" do

      assert_select "input[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[content]"

      assert_select "input[name=?]", "article[user_id]"
    end
  end
end
