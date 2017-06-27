require 'rails_helper'

describe Lesson do
  it { should validate_presence_of :name}

  context '#next' do
  it 'returns the lesson with the next-highest number than the current lesson' do
    current_lesson = Lesson.create({:name => 'lesson1', :number => 1})
    next_lesson = Lesson.create({:name => 'lesson2', :number => 2})
    expect(current_lesson.next).to eq next_lesson
    end
  end
  context '#delete' do
    it 'deletes selected lesson' do
      lesson = Lesson.create(:name=> "test", :content => "blah", :number => 434)
      lesson2 = Lesson.create(:name=> "test4", :content => "blaadfh", :number => 435)
      lesson.delete
      expect(Lesson.all).to eq [lesson2]
    end
  end
end
