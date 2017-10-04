
u1 = Person.create(name:'user1test', email:'user1test@test.com', phone:'00000000', age: 20, gender: 'm', password:'abcd1234', password_confirmation:'abcd1234')
u2 = Person.create(name:'user2test', email:'user2test@test.com', phone:'00000000', age: 20, gender: 'm', password:'abcd1234', password_confirmation:'abcd1234')
c = Person.create(name:'coachtest', email:'coachtest@test.com', phone:'00000000', age: 20, gender: 'm', password:'abcd1234', password_confirmation:'abcd1234')
a = Person.create(name:'admintest', email:'admintest@test.com', phone:'00000000', age: 20, gender: 'm', password:'abcd1234', password_confirmation:'abcd1234')

u1.create_user(level: 0, points: 0)
u2.create_user(level: 0, points: 0)
c.create_coach()
a.create_admin(adm_password: '00000000')

