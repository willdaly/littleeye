FactoryGirl.define do

  factory :mission do

  end

  factory :win_mission, class: Mission do
    name 'win mission'
    clue 'saxophone'
    user_id 0
  end

  factory :plus_point_mission, class: Mission do
    name 'plus point mission'
    clue 'saxophone'
    user_id 0
  end

  factory :mission_impossible, class: Mission do
    name 'mission impossible'
    clue 'saxophone'
    user_id 0
  end

  factory :picture do

  end

  factory :correct_picture, class: Picture do
    url "http://scontent-b.cdninstagram.com/hphotos-xfp1/t51.2885-15/10483488_687545451365966_527812500_n.jpg"
    answer true
  end

  factory :right_picture, class: Picture do
    url "http://scontent-b.cdninstagram.com/hphotos-xfp1/t51.2885-15/10483488_687545451365966_527812500_n.jpg"
    answer true
  end

  factory :incorrect_picture_1, class: Picture do
    url "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10932253_769215479813188_1502298192_n.jpg"
    answer false
  end

  factory :incorrect_picture_2, class: Picture do
    url "http://scontent-b.cdninstagram.com/hphotos-xfa1/t51.2885-15/10914650_646047918838941_1709271818_n.jpg"
    answer false
  end

  factory :incorrect_picture_3, class: Picture do
    url "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10895241_1539065316378384_974535643_n.jpg"
    answer false
  end

  factory :incorrect_picture_4, class: Picture do
    url "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10919754_736177923157121_1066211888_n.jpg"
    answer false
  end

  factory :incorrect_picture_5, class: Picture do
    url "http://scontent-a.cdninstagram.com/hphotos-xfa1/t51.2885-15/10932269_1530400413905923_493009130_n.jpg"
    answer false
  end

  factory :user do
    email "test@test.com"
    password "password"
  end
end
