require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:subject) { create(:task) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:due_date) }
  it { is_expected.to belong_to(:tasklist) }

end
