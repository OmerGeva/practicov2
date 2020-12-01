p 'Destroying past seeds...'
PracticeChallenge.destroy_all
Challenge.destroy_all
Practice.destroy_all
Skill.destroy_all
SkillCategory.destroy_all
User.destroy_all

p 'Creating users...'
user1 = User.create(username: "noahnash", password: "123456")


p 'Creating skill categories...'
skill_category1 = SkillCategory.create(title: 'Musical')
skill_category2 = SkillCategory.create(title: 'Athletic')
skill_category3 = SkillCategory.create(title: 'Self Improvement')
skill_category4 = SkillCategory.create(title: 'Culinary')
skill_category5 = SkillCategory.create(title: 'Fine Arts')
skill_category6 = SkillCategory.create(title: 'Cultural')

p 'Creating skills...'
skill1 = Skill.create(title: 'Learning guitar', description: 'Learning to play basic chords on the guitar', skill_category: skill_category1)
skill2 = Skill.create(title: 'Running', description: 'Running for long distances', skill_category: skill_category2)
skill3 = Skill.create(title: 'Journal Entry', description: 'Write about your experiences to be able to reflect and improve', skill_category: skill_category3)
skill4 = Skill.create(title: 'Cook dinner', description: 'Cook a different dinner than you have previously', skill_category: skill_category4)
skill5 = Skill.create(title: 'Learn to fingerpaint', description: 'Learn to draw with your fingers and paint', skill_category: skill_category5)
skill6 = Skill.create(title: 'Learn German', description: 'Be able to speak and read German', skill_category: skill_category6)

p 'Creating practices...'
practice1 = Practice.create(title: 'My first guitar practice', goal: 20, time_type: 'weeks', start_date: Date.today, user: user1, skill: skill1)

p 'Creating challenges...'
challenge1 = Challenge.create(start_date: Date.today, end_date: Date.today.next_week, description: 'Big guitar challenge! Let\'s see who can get to 300 hours first!', end_goal: 300)

p 'Creating practice challenges...'
practice_challenge1 = PracticeChallenge.create(practice: practice1, challenge: challenge1)
