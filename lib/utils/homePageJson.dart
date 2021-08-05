
const List banners = [
  "https://image.freepik.com/free-vector/modern-laptop-with-online-video-player-screen-online-webinar-video-tutorial-online-education-illustration_285336-932.jpg",
  "https://image.freepik.com/free-vector/online-education-courses-resources-web-banner-template-online-learning-courses-distant-education-e-learning-tutorials-illustration_175838-901.jpg",
  "https://image.freepik.com/free-vector/free-webinar-play-online-button-illustration-laptop-notebook-computer-screen-vector-illustration-live-webinar-label-laptop-screen_175838-900.jpg",
];

const List categories = [
  "All",
  "Popular",
  "Newest"
];

const List categoryAll = [
  {
    "imageUrl": "https://images.unsplash.com/photo-1618401471353-b98afee0b2eb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2l0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Git",
    "lesson": "5/18",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
    "name": "Digital Marketing",
    "lesson": "37/64",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1533750349088-cd871a92f312?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fGRpZ2l0YWwlMjBtYXJrZXRpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Marketing Strategy",
    "lesson": "13/39",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1617358142775-4be217d9cc19?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGFydCUyMGRlc2lnbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Visual Identity",
    "lesson": "20/25",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1586717799252-bd134ad00e26?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
    "name": "User Interface",
    "lesson": "40/56",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1614107069293-7d5bd9aba22e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwzNzU5ODQxfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    "name": "Art",
    "lesson": "13/39",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1584654600747-3b18033abee8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTB8fGFydHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Advace Art",
    "lesson": "24/50",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1614963326505-843868e1d83a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZWRpdGluZyUyMHZpZGVvfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Adobe Premiere",
    "lesson": "16/29",
  },
];

const List categoryPopular = [
  {
    "imageUrl": "https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
    "name": "Digital Marketing",
    "lesson": "37/64",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1614107069293-7d5bd9aba22e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwzNzU5ODQxfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    "name": "Art",
    "lesson": "13/39",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1614963326505-843868e1d83a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZWRpdGluZyUyMHZpZGVvfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Adobe Premiere",
    "lesson": "16/29",
  },
];

const List categoryNewest = [
  {
    "imageUrl": "https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
    "name": "Digital Marketing",
    "lesson": "37/64",
  },
  {
    "imageUrl": "https://images.unsplash.com/photo-1584654600747-3b18033abee8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTB8fGFydHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Advace Art",
    "lesson": "24/50",
  },
];