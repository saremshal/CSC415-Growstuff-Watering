FactoryBot.define do
  factory :checklist do
    memberID { 1 }
    plantID { 1 }
    plantName { "MyString" }
    checklistFlag { false }
    nextWatered { "2020-04-26" }
    lastWatered { "2020-04-26" }
  end
end
