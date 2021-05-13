# frozen_string_literal: true

require "rails_helper"

RSpec.describe Review, type: :model do
  let(:review) { build :review }

  it { expect(review).to belong_to(:user).inverse_of(:reviews) }
  it { expect(review).to belong_to(:movie).inverse_of(:reviews) }
end
