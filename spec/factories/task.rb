FactoryBot.define do
  factory :task do
    name 'Report'
    due_date 5.days.from_now
    tasklist
  end
end
