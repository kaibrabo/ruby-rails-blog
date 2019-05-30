require 'rails_helper'

RSpec.describe Comment, type: :model do
	let(:post) {
		Post.create!(
			title: "New Post title",
			body: "New Post body"
		)
	}
	let(:comment) {
		Comment.create!(
			body: "Comment Body",
			post: post
		)
	}

	describe "attributes" do
		it "has a body attribuute" do
			expect(comment).to have_attributes(body: "Comment Body")
		end
	end
end
