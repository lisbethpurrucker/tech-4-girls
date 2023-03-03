class AddDefaultToUserLessonStatusAndProgress < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_lessons, :status, from: nil, to: 0
    change_column_default :user_lessons, :progress, from: nil, to: 0.0
  end
end
