require 'rails_helper'

RSpec.describe "candidates/index", type: :view do
  before(:each) do
    assign(:candidate, Candidate.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new candidate form" do
    render

    assert_select "form[action=?][method=?]", candidates_path, "post" do

      assert_select "input#candidate_name[name=?]", "candidate[name]"

      assert_select "input#candidate_email[name=?]", "candidate[email]"
    end
  end
end
