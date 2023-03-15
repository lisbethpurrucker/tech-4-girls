# frozen_string_literal: true

puts 'Destroying old seeds... 🗑'

UserQuiz.destroy_all
UserLesson.destroy_all
Answer.destroy_all
Question.destroy_all
Quiz.destroy_all
UserWorld.destroy_all
User.destroy_all
Lesson.destroy_all
World.destroy_all

puts 'Planting new seeds... 🌱🌱🌱'

worlds_data = [
  { name: 'CSS' },
  { name: 'JavaScript' },
  { name: 'HTML' }
]
worlds = World.create!(worlds_data)
puts "Worlds created:"
puts worlds
puts '🌎 🌍 🌏 🌎 🌍 🌏'

# For each of our 3 Worlds we create 3 Lessons
worlds.each do |world|
  3.times do |i|
    Lesson.create!(
      title: "#{world.name} - Lesson #{i}",
      duration: rand(15..60), # It's just to display duration to the user, so in min is ok?
      world_id: world.id
    )
    puts "👩‍🏫 Lesson created: #{Lesson.last}"
  end
end

# We create 3 Users
users_data = [
  { first_name: 'Lisbeth', last_name: 'Purrucker', email: 'lisbeth@lisbeth.com', password: '123456', user_name: 'lis' },
  { first_name: 'Iwona', last_name: 'Behnke', email: 'iwona@iwona.com', password: '123456', user_name: 'iwo' },
  { first_name: 'Emma', last_name: 'Rünzel', email: 'emma@emma.com', password: '123456', user_name: 'emm' }
]
users = User.create!(users_data)
puts 'Users created:'
puts users
puts '👧🏻 👧🏼 👧🏾 👧🏿'

# For each User we create a UserWorld for each World. For now all of them are active.
users.each do |user|
  worlds.each do |world|
    UserWorld.create!(user_id: user.id, world_id: world.id, active: true)
    puts "UsersWorlds created: #{UserWorld.last}"
  end
end
puts '🌎 🙋🏻 🌍 🙋🏼 🌏 🙋🏽 🌎 🙋🏾 🌍 🙋🏿'

# We create 1 Quiz for each Lesson
lessons = Lesson.all
lessons.each do |lesson|
  Quiz.create!(duration: rand(15..60), lesson_id: lesson.id)
  puts "Quiz created: #{Quiz.last}"
end
puts '👩🏻‍🏫 👩🏼‍🏫 👩🏽‍🏫 👩🏾‍🏫 👩🏿‍🏫'

# For each Quiz we create 3 questions.
quizzes = Quiz.all
quizzes.each do |quiz|
  3.times do |i|
    Question.create!(
      title: "Lesson #{quiz.lesson.id} - Question about #{quiz.lesson.world.name} nr #{i}",
      quiz_id: quiz.id,
      # multianswer: true
      multianswer: [true, false].sample
    )
    puts "Question created: #{Question.last}"
  end
end
puts '🙋🏻‍♀️ 🙋🏼‍♀️ 🙋🏽‍♀️ 🙋🏾‍♀️ 🙋🏿‍♀️'

# If question is multianswer it will have 2-5 Answers, some of them correct, some not.
# If question is not multianswer it will have only one correct Answer.
questions = Question.all
charset = Array('A'..'Z')
questions.each do |q|
  if q.multianswer
    answer_count = rand(2..5)
    correct_indexes = (0...answer_count).to_a.sample(rand(1..answer_count))
    answer_count.times do |i|
      Answer.create!(
        content: Array.new(7) { charset.sample }.join,
        correct: correct_indexes.include?(i),
        question_id: q.id
      )
      puts "Answer created: #{Answer.last}"
    end
  else
    Answer.create!(
      content: "Answer #{q.id}",
      correct: true,
      question_id: q.id
    )
    puts "Answer created: #{Answer.last}"
  end
end
puts '👏 👏 👏 👏'

# If the world is active for the user, 1-2 UserLessons for each active UserWorld will be created.
# For each UserLesson a UserQuiz is created.
users.each do |user|
  user.user_worlds.where(active: true).each do |user_world|
    lessons = user_world.world.lessons.sample(rand(1..2))
    lessons.each do |lesson|
      UserLesson.create!(
        user_id: user.id,
        lesson_id: lesson.id,
        status: rand(-1..2),
        progress: rand(0.0..100.0)
      )
      puts "UserLesson created: #{UserLesson.last}"
      quiz = Quiz.where(lesson_id: lesson.id).first
      UserQuiz.create!(
        user_id: user.id,
        quiz_id: quiz.id,
        status: rand(-1..2),
        progress: rand(0.0..10.0)
      )
      puts "UserQuiz created: #{UserQuiz.last}"
    end
  end
end

puts 'Seed file done 🌱 🗺  🙇‍♀️ 🛸'
