# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Quote.create([
  {
    category: 'Love',
    text: 'I am happiest when I’m right next to you.',
    author: 'Adem'
  },
  {
    category: 'Love',
    text: 'I love you” begins by I, but it ends up by you.',
    author: 'Charles de Leusse'
  },
  {
    category: 'Love',
    text: 'There is a madness in loving you, a lack of reason that makes it feel so flawless.',
    author: 'Adem'
  },
  {
    category: 'Love',
    text: 'You are the last thought in my mind before I drift off to sleep and the first thought when I wake up each mornin',
    author: 'Uknown'
  },
  {
    category: 'Love',
    text: 'I will love you until the stars go out, and the tides no longer turn.',
    author: 'Adem'
  }
]);