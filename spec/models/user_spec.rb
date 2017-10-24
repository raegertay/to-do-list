require 'rails_helper'

RSpec.describe User, type: :model do

  let(:subject) { create(:user) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to have_many(:tasklists).dependent(:destroy) }

end
