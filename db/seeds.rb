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

p 'Creating skills...'
skill1 = Skill.create(title: 'Learning guitar', description: 'Learning to play basic chords on the guitar', skill_category: skill_category1)

p 'Creating practices...'
practice1 = Practice.create(title: 'My first guitar practice', goal: 20, time_type: 'weeks', start_date: Date.today, user: user1, skill: skill1)

p 'Creating challenges...'
challenge1 = Challenge.create(start_date: Date.today, end_date: Date.today.next_week, description: 'Big guitar challenge! Let\'s see who can get to 300 hours first!', end_goal: 300)

p 'Creating practice challenges...'
practice_challenge1 = PracticeChallenge.create(practice: practice1, challenge: challenge1)
