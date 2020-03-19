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
    author: 'Adem',
    image_url: 'https://images.unsplash.com/photo-1505150099521-fde7970bcc3a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'
  },{
    category: 'Love',
    text: 'I love you begins by I, but it ends up by you.',
    author: 'Charles de Leusse',
    image_url: 'https://images.unsplash.com/photo-1494774157365-9e04c6720e47?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'
  },{
    category: 'Love',
    text: 'There is a madness in loving you, a lack of reason that makes it feel so flawless.',
    author: 'Adem',
    image_url: 'https://miro.medium.com/max/10304/0*U_sGE_-MILWnnlS1'
  },{
    category: 'Love',
    text: 'You are the last thought in my mind before I drift off to sleep and the first thought when I wake up each mornin',
    author: 'Uknown',
    image_url: 'https://images.pexels.com/photos/1417255/pexels-photo-1417255.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },{
    category: 'Love',
    text: 'I will love you until the stars go out, and the tides no longer turn.',
    author: 'Adem',
    image_url: 'https://i.pinimg.com/originals/4d/6b/e1/4d6be123732fc948a5c3d5911ea5203b.jpg'
  }
]);