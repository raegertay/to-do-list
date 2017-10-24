require 'rails_helper'

RSpec.describe Tasklist, type: :model do

  let(:subject) { create(:tasklist) }

  it { is_expected.to validate_presence_of(:name).with_message('Tasklist Name is mandatory') }
  it { is_expected.to validate_uniqueness_of(:name).with_message('Tasklist already exist') }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:tasks).dependent(:destroy) }

end
