FactoryBot.define do
  factory :task do
    title { "task" }
    description { "tasl description" }
    state { "pending" } 
    deadline { 1.week.from_now }
    association :user, factory: :user
    created_at { Time.zone.now }
    updated_at { Time.zone.now}
  end
end
