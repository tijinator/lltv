
User.create!([
  {provider: "email", uid: "rr@rr.com", password: "rrrrrrrr", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2015-12-31 17:29:32", last_sign_in_at: "2015-12-31 17:27:52", current_sign_in_ip: "192.168.3.1", last_sign_in_ip: "192.168.3.1", confirmation_token: "njUVNtTzAZa6jAdpgekA", confirmed_at: nil, confirmation_sent_at: "2016-01-03 22:34:07", unconfirmed_email: nil, first_name: "Russel", last_name: "Kurt", email: "rr@rr.com", username: "", role: 30, tokens: {}}
  # {provider: "email", uid: "test@test.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2015-12-31 17:29:32", last_sign_in_at: "2015-12-31 17:27:52", current_sign_in_ip: "192.168.3.1", last_sign_in_ip: "192.168.3.1", confirmation_token: "njUVNtTzAZa6jAdpgekA", confirmed_at: nil, confirmation_sent_at: "2016-01-03 22:34:07", unconfirmed_email: nil, first_name: "Russel", last_name: "Kurt", email: "test@test.com", username: "", role: 30, tokens: {}, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil}
])

Category.create!([
  # {user_id: 1, parent_id: nil, title: "Design", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 0, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, html_tab_id: "design", html_tab_color: "rgba(26, 157, 7, 0.78)", html_color: "#1A9D07", homepage_position: 0, small_image_url: "/images/LLTV_design_category_img.jpg", banner_url: "/images/LLTV_design_category_banner.jpg"},
  {user_id: 1, parent_id: nil, title: "Design", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 0, html_tab_id: "design", html_tab_color: "rgba(26, 157, 7, 0.78)", html_color: "#1A9D07", homepage_position: 0, small_image_url: "/images/LLTV_design_category_img.jpg", banner_url: "/images/LLTV_design_category_banner.jpg"},
  {user_id: 1, parent_id: nil, title: "Engineering", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 1, html_tab_id: "engineering", html_tab_color: "rgba(255,144,7,0.78)", html_color: "#FF9000", homepage_position: 1, small_image_url: nil, banner_url: nil},
  {user_id: 1, parent_id: nil, title: "Architecture", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, html_tab_id: "architecture", html_tab_color: "rgba(57, 9, 205, 0.78)", html_color: "#3909CD", homepage_position: 2, small_image_url: nil, banner_url: nil},
  {user_id: 1, parent_id: nil, title: "Business", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_business_category_img.jpg", banner_url: nil},
  {user_id: 1, parent_id: nil, title: "Audio + Music", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_music_category_img.jpg", banner_url: nil},
  {user_id: 1, parent_id: nil, title: "Coding", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_coding_category_img.jpg", banner_url: nil},
  {user_id: 1, parent_id: nil, title: "Marketing", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_marketing_category_img.jpg", banner_url: nil},
  {user_id: 1, parent_id: nil, title: "Video", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_video_category_img.jpg", banner_url: nil},
  {user_id: 1, parent_id: nil, title: "Photography", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, html_tab_id: "photography", html_tab_color: "rgba(255, 0, 206, 0.78)", html_color: "#FF00CE", homepage_position: 3, small_image_url: "/images/LLTV_photography_category_img.jpg", banner_url: nil},
  {user_id: 1, parent_id: nil, title: "3D + Animation", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, html_tab_id: "3danimation", html_tab_color: "rgba(205, 46, 15, 0.78)", html_color: "#CD2E0F", homepage_position: 4, small_image_url: "/images/LLTV_animation_category_img.jpg", banner_url: nil}
])

Course.create!([
  { user_id: 1,
    author_id: 1,
    level: "beginner",
    title: "learn adobe illustrator",
    details: "In this incredible tutorial, you will learn the fundamentals and basic design principles with the tools used in Adobe Illustrator CC. There are three levels for beginner, intermediate and advanced. Keep up with the trends of design with this video clip.",
    duration: nil,
    position: nil,
    published: false,
    released_on: nil,
    banner_url: "/images/LLTV_ai_banner.jpg",
    featured: true },

  { user_id: 1,
    author_id: 1,
    level: "Advanced",
    title: "Adobe Two illustrator",
    details: "In this incredible tutorial, you will learn the fundamentals and basic design principles with the tools used in Adobe Illustrator CC. There are three levels for beginner, intermediate and advanced. Keep up with the trends of design with this video clip.",
    duration: nil,
    position: nil,
    published: false,
    released_on: nil,
    banner_url: "/images/LLTV_ai_banner.jpg",
    featured: true }
])

ItemCategory.create!([
  {category_id: 1, categorizable_id: 1, categorizable_type: "Course"},
  {category_id: 1, categorizable_id: 2, categorizable_type: "Course"},
  {category_id: 1, categorizable_id: 3, categorizable_type: "Course"}
])


Chapter.create!([
    { user_id: 1, course_id: 1, title: 'INTRO Illustrator', details: 'Cool Course about illustrator', duration: 185, position: 1},
    { user_id: 1, course_id: 1, title: 'Advanced illust', details: 'Cool Course about illustrator', duration: 185, position: 2}
])

Video.create!([
  {chapter_id: 1, video_url: "/uploads/video/video_url/Vi1.mp4", title: 'Intro Video', details: 'Video Course awesome', transcript: '', faqs: '', position: 1},
  {chapter_id: 2, video_url: "/uploads/video/video_url/mov_bbb.mp4", title: 'Second Video', details: 'Video Course awesome', transcript: '', faqs: '', position: 2}
])

# # Order.create!({user_id: 1, amount: 0, address: '111 Fake st.', address_two: '', city: 'Brooklyn', state: 'NY', zip_code: '11112' })
# # Order.create!({user_id: 1, amount: 100, address: '111 Fake st.', address_two: '', city: 'Brooklyn', state: 'NY', zip_code: '11112' })




################### NEW ##########################
#
#
#
# User.create!([
#   {provider: "email", uid: "rr@rr.com", password: "rrrrrrrr", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2015-12-31 17:29:32", last_sign_in_at: "2015-12-31 17:27:52", current_sign_in_ip: "192.168.3.1", last_sign_in_ip: "192.168.3.1", confirmation_token: "njUVNtTzAZa6jAdpgekA", confirmed_at: nil, confirmation_sent_at: "2016-01-03 22:34:07", unconfirmed_email: nil, first_name: "Russel", last_name: "Kurt", email: "rr@rr.com", username: "", role: 30, tokens: {}}
#   # {provider: "email", uid: "test@test.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2015-12-31 17:29:32", last_sign_in_at: "2015-12-31 17:27:52", current_sign_in_ip: "192.168.3.1", last_sign_in_ip: "192.168.3.1", confirmation_token: "njUVNtTzAZa6jAdpgekA", confirmed_at: nil, confirmation_sent_at: "2016-01-03 22:34:07", unconfirmed_email: nil, first_name: "Russel", last_name: "Kurt", email: "test@test.com", username: "", role: 30, tokens: {}, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil}
# ])
#
# Category.create!([
#   # {user_id: 1, parent_id: nil, title: "Design", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 0, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, html_tab_id: "design", html_tab_color: "rgba(26, 157, 7, 0.78)", html_color: "#1A9D07", homepage_position: 0, small_image_url: "/images/LLTV_design_category_img.jpg", banner_url: "/images/LLTV_design_category_banner.jpg"},
#   {user_id: 1, parent_id: nil, title: "Design", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 0, html_tab_id: "design", html_tab_color: "rgba(26, 157, 7, 0.78)", html_color: "#1A9D07", homepage_position: 0, small_image_url: "/images/LLTV_design_category_img.jpg", banner_url: "/images/LLTV_design_category_banner.jpg"},
#   {user_id: 1, parent_id: nil, title: "Engineering", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 1, html_tab_id: "engineering", html_tab_color: "rgba(255,144,7,0.78)", html_color: "#FF9000", homepage_position: 1, small_image_url: nil, banner_url: nil},
#   {user_id: 1, parent_id: nil, title: "Architecture", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, html_tab_id: "architecture", html_tab_color: "rgba(57, 9, 205, 0.78)", html_color: "#3909CD", homepage_position: 2, small_image_url: nil, banner_url: nil},
#   {user_id: 1, parent_id: nil, title: "Business", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_business_category_img.jpg", banner_url: nil},
#   {user_id: 1, parent_id: nil, title: "Audio + Music", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_music_category_img.jpg", banner_url: nil},
#   {user_id: 1, parent_id: nil, title: "Coding", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_coding_category_img.jpg", banner_url: nil},
#   {user_id: 1, parent_id: nil, title: "Marketing", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_marketing_category_img.jpg", banner_url: nil},
#   {user_id: 1, parent_id: nil, title: "Video", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: nil, html_tab_id: nil, html_tab_color: nil, html_color: nil, homepage_position: nil, small_image_url: "/images/LLTV_video_category_img.jpg", banner_url: nil},
#   {user_id: 1, parent_id: nil, title: "Photography", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, html_tab_id: "photography", html_tab_color: "rgba(255, 0, 206, 0.78)", html_color: "#FF00CE", homepage_position: 3, small_image_url: "/images/LLTV_photography_category_img.jpg", banner_url: nil},
#   {user_id: 1, parent_id: nil, title: "3D + Animation", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, html_tab_id: "3danimation", html_tab_color: "rgba(205, 46, 15, 0.78)", html_color: "#CD2E0F", homepage_position: 4, small_image_url: "/images/LLTV_animation_category_img.jpg", banner_url: nil}
# ])
#
# Course.create!([
#   { user_id: 1,
#     author_id: 1,
#     level: "beginner",
#     title: "IEEE- Introduction to Leadership: A Primer for the Practitioner",
#     details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#     duration: 3190,
#     position: nil,
#     published: false,
#     released_on: nil,
#     banner_url: "",
#     featured: true },
#
#   { user_id: 1,
#     author_id: 1,
#     level: "beginner",
#     title: "IEEE- 4G Broadband LTE",
#     details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#     duration: 1538,
#     published: false,
#     released_on: nil,
#     banner_url: "",
#     featured: true },
#
#     { user_id: 1,
#       author_id: 1,
#       level: "beginner",
#       title: "IEEE- Cloud Computing I",
#       details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#       duration: 2456,
#       position: nil,
#       published: false,
#       released_on: nil,
#       banner_url: "",
#       featured: true },
#
#     { user_id: 1,
#       author_id: 1,
#       level: "Beginner",
#       title: "IEEE- Cloud Computing II",
#       details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#       duration: 2948,
#       position: nil,
#       published: false,
#       released_on: nil,
#       banner_url: "",
#       featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "beginner",
#         title: "IEEE- Cloud Computing III",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 3273,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "Beginner",
#         title: "IEEE- Smart Grid Standards",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 2236,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "beginner",
#         title: "IEEE- Smart Devices for the Smart Grid: The Use of Monitoring Equipment to Generate Data For Analysis",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 1265,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "Beginner",
#         title: "IEEE- Cyber Security for the Smart Grid: A Smart Grid 'Boot Camp' for Engineering Professionals",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 1105,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "beginner",
#         title: "IEEE- Next Generation Batteries",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 1647,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "Beginner",
#         title: "IEEE- Fundamentals of Patent Protection: Protecting Intellectual Property for Engineers",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 3098,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "beginner",
#         title: "IEEE- How to Read a Standard: An Introduction for Engineers",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 934,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "Beginner",
#         title: "IEEE- Ethics in Standards Development",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 76,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "beginner",
#         title: "IEEE- Introduction to Conformity Assessment",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 0,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true },
#
#       { user_id: 1,
#         author_id: 1,
#         level: "Beginner",
#         title: "IEEE- Introduction to IEEE 1588: Understanding Precision Time Protocol",
#         details: "Typewriter biodiesel pop-up bicycle rights. +1 pinterest forage, gentrify meditation gochujang seitan green juice occupy. Crucifix banh mi taxidermy bespoke aesthetic cred.",
#         duration: 99,
#         position: nil,
#         published: false,
#         released_on: nil,
#         banner_url: "",
#         featured: true }
#
# ])
#
# ItemCategory.create!([
#   {category_id: 1, categorizable_id: 1, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 2, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 3, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 4, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 5, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 6, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 7, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 8, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 9, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 10, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 11, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 12, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 13, categorizable_type: "Course"},
#   {category_id: 1, categorizable_id: 14, categorizable_type: "Course"}
# ])
#
#
# Chapter.create!([
#
#     { user_id: 1, course_id: 1, title: 'Introduction to Leadership Course Outline', details: 'What is effective leadership? And how can you develop the good leadership principles? This IEEE eLearning course will cover leadership theory and show you how to improve your personal leadership skills.', duration: 84, position: 1},
#     { user_id: 1, course_id: 1, title: 'About Your Subject Matter Expert', details: 'Learn more about Barry L. Shoop, Professor and Deputy Head of the Department of Electrical Engineering and Computer Science at the United States Military Academy at West Point.', duration: 169, position: 2},
#     { user_id: 1, course_id: 1, title: 'Course Introduction', details: 'Effective leaders are made, not born. Find out why we should start applying leadership principles earlier in our career rather than later and what separates a leader from a manager.', duration: 159, position: 3},
#     { user_id: 1, course_id: 1, title: 'Leadership Development Model', details: "Effective leaders are lifelong learners. In this module, you'll learn about formal leadership models and the learning cycle you'll take through your career.", duration: 140, position: 4},
#     { user_id: 1, course_id: 1, title: 'Leadership Theories', details: "In this module, we will cover six theories from the nineteenth century to the present that frame the topic of leadership: 'Great Man', trait, charismatic, situational, behavioral, and participative", duration: 132, position: 5},
#     { user_id: 1, course_id: 1, title: "Bass' Theory of Leadership", details: "Bass & Stodgill's 'Handbook of Leadership,' first published in 1974, is one of the most comprehensive books on leadership to date. The book covers three basic ways that people become leaders, which are discussed in this module. ", duration: 80, position: 6},
#     { user_id: 1, course_id: 1, title: 'Engineering Leadership (P.A. Delisle)', details: 'According to a paper by Peter Delisle, presented at the 1998 IEEE Professional Activities Conference, engineers will have greater impact and influence on organizations by developing interpersonal skills related to leadership. You will hear about the three elements of interpersonal effectiveness.', duration: 157, position: 7},
#     { user_id: 1, course_id: 1, title: 'Principles of Leadership I (Be-Know-Do)', details: "In this module, you'll learn three fundamentals of leadership framework: what the leader must be, a leader's skills and what they know, and the importance of acting on what they know. ", duration: 144, position: 8},
#     { user_id: 1, course_id: 1, title: 'Principles of Leadership II', details: "The 1973 U.S. Army Handbook identifies 11 principles of leadership that further internalize the Be-Know-Do framework. From understanding the full capabilities of your organization to looking out for your team's well-being, this module covers the actions that essential leaders must take. ", duration: 135, position: 9},
#     { user_id: 1, course_id: 1, title: 'Leader Traits', details: "Leadership is not about personality; it's about behavior. Learn how traits like integrity, dedication, and curiosity an inspire a shared vision and enable others to act. ", duration: 99, position: 10},
#     { user_id: 1, course_id: 1, title: 'Being an Effective Leader', details: "James Kouzes and Barry Posner's identify their five most important leadership traits in their book, 'The Leadership Challenge.' When you reflect on effective leaders in your business, what made them stand out from other managers? Who turned a disaster into an opportunity? ", duration: 144, position: 11},
#     { user_id: 1, course_id: 1, title: 'Leaders vs. Managers', details: "In many organizations, the words 'leader' and 'manager' may be used interchangablly; but there are stark differences between managers and effective leaders. You'll learn the distinctions between the two and whether you are leading your team or simply managing.", duration: 98, position: 12},
#     { user_id: 1, course_id: 1, title: 'Diversity in Team Composition', details: 'As a leader, you may be asked to build a team. Find out why building a team that reflects the diversity of your stakeholders or your constituents is vital to the success of your business.', duration: 110, position: 13},
#     { user_id: 1, course_id: 1, title: 'Understanding Individual and Group Dynamics', details: 'Understanding the dynamics of your group is key to effectively leading your group. This module will delve into the Myers-Briggs Type Indicator, an instrument that can provide better insight into the members of your group.', duration: 312, position: 14},
#     { user_id: 1, course_id: 1, title: 'Characteristics of Effective Meetings', details: "Have you attended a meeting that rambled between topics and ended with no apparent results? This module will cover the characteristics of effective meetings that will save your team's time and produce better results.", duration: 120, position: 15},
#     { user_id: 1, course_id: 1, title: 'Preparing for Meetings', details: "A majority of meeting attendees look for a well-defined purpose and agenda. Learn the key elements in preparing the 'bell-shaped agenda', which structures a meeting around the group's energy and attention. ", duration: 145, position: 16},
#     { user_id: 1, course_id: 1, title: 'Logistics of Meetings', details: '', duration: 171, position: 17},
#     { user_id: 1, course_id: 1, title: 'Leading Meetings', details: '', duration: 202, position: 18},
#     { user_id: 1, course_id: 1, title: 'Personal Reflections on Leadership', details: '', duration: 107, position: 19},
#     { user_id: 1, course_id: 1, title: 'References', details: '', duration: 34, position: 20},
#
#     { user_id: 1, course_id: 2, title: "4G Broadband LTE: It's Evolution and Challenges", details: 'An intro to the course and our subject matter expert', duration: 64, position: 1},
#     { user_id: 1, course_id: 2, title: 'Evolution of LTE', details: '', duration: 124, position: 2},
#     { user_id: 1, course_id: 2, title: 'LTE Standardization Process', details: '', duration: 208, position: 3},
#     { user_id: 1, course_id: 2, title: 'LTE Protocol & Specifications', details: '', duration: 174, position: 4},
#     { user_id: 1, course_id: 2, title: 'Key Features of LTE', details: '', duration: 184, position: 5},
#     { user_id: 1, course_id: 2, title: 'LTE Release 8 Device Categories and Release 9 Enhancements', details: '', duration: 69, position: 6},
#     { user_id: 1, course_id: 2, title: 'LTE-A (Advanced) & Release 12 Specifications', details: '', duration: 149, position: 7},
#     { user_id: 1, course_id: 2, title: 'LTE Challenges: Spectrum Fragmentation, Voice, and Others', details: '', duration: 149, position: 8},
#     { user_id: 1, course_id: 2, title: 'Conclusion', details: '', duration: 66, position: 9},
#
#     { user_id: 1, course_id: 3, title: 'An Introduction to Cloud Computing Concepts', details: 'An introduction to Dr. Laplante', duration: 79, position: 1},
#     { user_id: 1, course_id: 3, title: 'Course Overview', details: '', duration: 116, position: 2},
#     { user_id: 1, course_id: 3, title: 'The N.I.S.T. Model & Evolution of Cloud Computing', details: '', duration: 201, position: 3},
#     { user_id: 1, course_id: 3, title: '5 Essential Characteristics', details: '', duration: 135, position: 4},
#     { user_id: 1, course_id: 3, title: 'Service & Deployment Models', details: '', duration: 239, position: 5},
#     { user_id: 1, course_id: 3, title: 'Cloud Infrastructure/Consumer View', details: '', duration: 151, position: 6},
#     { user_id: 1, course_id: 3, title: 'Relinquishing Capability', details: '', duration: 87, position: 7},
#     { user_id: 1, course_id: 3, title: 'Security', details: '', duration: 85, position: 8},
#     { user_id: 1, course_id: 3, title: 'Private Cloud Scenarios', details: '', duration: 103, position: 9},
#     { user_id: 1, course_id: 3, title: 'Community Cloud Scenarios', details: '', duration: 159, position: 10},
#     { user_id: 1, course_id: 3, title: 'Public Cloud Scenarios', details: '', duration: 42, position: 11},
#     { user_id: 1, course_id: 3, title: 'Hybrid Clouds', details: '', duration: 157, position: 12},
#     { user_id: 1, course_id: 3, title: 'General Assumptions', details: '', duration: 98, position: 13},
#     { user_id: 1, course_id: 3, title: 'Terms of Service', details: '', duration: 139, position: 14},
#     { user_id: 1, course_id: 3, title: 'Promises', details: '', duration: 116, position: 15},
#     { user_id: 1, course_id: 3, title: 'Limitations', details: '', duration: 118, position: 16},
#     { user_id: 1, course_id: 3, title: 'Obligations', details: '', duration: 59, position: 17},
#     { user_id: 1, course_id: 3, title: 'Recommendations', details: '', duration: 102, position: 18},
#     { user_id: 1, course_id: 3, title: 'Cloud Computing Implications', details: '', duration: 80, position: 19},
#     { user_id: 1, course_id: 3, title: 'Summary', details: '', duration: 103, position: 20},
#     { user_id: 1, course_id: 3, title: 'Glossary & References', details: '', duration: 48, position: 21},
#
#     { user_id: 1, course_id: 4, title: 'Intermediate Cloud Computing Concepts', details: 'Intro to SME', duration: 87, position: 1},
#     { user_id: 1, course_id: 4, title: 'Course Overview', details: '', duration: 61, position: 2},
#     { user_id: 1, course_id: 4, title: 'Service & Deployment Model Review', details: '', duration: 230, position: 3},
#     { user_id: 1, course_id: 4, title: 'Scope and Control', details: '', duration: 110, position: 4},
#     { user_id: 1, course_id: 4, title: 'SAAS Abstract Interaction Dynamics', details: '', duration: 118, position: 5},
#     { user_id: 1, course_id: 4, title: 'SAAS Software Stack Control', details: '', duration: 147, position: 6},
#     { user_id: 1, course_id: 4, title: 'SAAS Benefits', details: '', duration: 106, position: 7},
#     { user_id: 1, course_id: 4, title: 'SAAS Issues and Concerns', details: '', duration: 138, position: 8},
#     { user_id: 1, course_id: 4, title: 'SAAS Application Suitability', details: '', duration: 113, position: 9},
#     { user_id: 1, course_id: 4, title: 'SAAS Recommendations', details: '', duration: 159, position: 10},
#     { user_id: 1, course_id: 4, title: 'PAAS Abstract Interaction Dynamics', details: '', duration: 103, position: 11},
#     { user_id: 1, course_id: 4, title: 'PAAS Software Stack Control', details: '', duration: 88, position: 12},
#     { user_id: 1, course_id: 4, title: 'PAAS Benefits', details: '', duration: 70, position: 13},
#     { user_id: 1, course_id: 4, title: 'PAAS Issues and Concerns', details: '', duration: 187, position: 14},
#     { user_id: 1, course_id: 4, title: 'PAAS Application Suitability & Recommendations', details: '', duration: 116, position: 15},
#     { user_id: 1, course_id: 4, title: 'IAAS Abstract Interaction Dynamics', details: '', duration: 85, position: 16},
#     { user_id: 1, course_id: 4, title: 'IAAS Software Stack Control', details: '', duration: 103, position: 17},
#     { user_id: 1, course_id: 4, title: 'IAAS Operational View', details: '', duration: 85, position: 18},
#     { user_id: 1, course_id: 4, title: 'IAAS Operations: Cloud Manager, Cluster Managers, and Computer Managers', details: '', duration: 246, position: 19},
#     { user_id: 1, course_id: 4, title: 'IAAS Benefits', details: '', duration: 123, position: 20},
#     { user_id: 1, course_id: 4, title: 'IAAS Issues and Concerns', details: '', duration: 127, position: 21},
#     { user_id: 1, course_id: 4, title: 'IAAS Recommendations', details: '', duration: 88, position: 22},
#     { user_id: 1, course_id: 4, title: 'Summary', details: '', duration: 79, position: 23},
#     { user_id: 1, course_id: 4, title: 'Glossary and References', details: '', duration: 48, position: 24},
#
#     { user_id: 1, course_id: 5, title: 'Advanced Cloud Computing  Concepts Intro', details: '', duration: 78, position: 1},
#     { user_id: 1, course_id: 5, title: 'Course Overview', details: '', duration: 109, position: 2},
#     { user_id: 1, course_id: 5, title: 'Cloud Service Models', details: '', duration: 89, position: 3},
#     { user_id: 1, course_id: 5, title: 'SWOT For Cloud Migration', details: '', duration: 170, position: 4},
#     { user_id: 1, course_id: 5, title: 'Value Propositions', details: '', duration: 242, position: 5},
#     { user_id: 1, course_id: 5, title: 'Cloud Computing Risks', details: '', duration: 134, position: 6},
#     { user_id: 1, course_id: 5, title: 'Risk: Computing Performance', details: '', duration: 166, position: 7},
#     { user_id: 1, course_id: 5, title: 'Risk: Cloud Reliability', details: '', duration: 96, position: 8},
#     { user_id: 1, course_id: 5, title: 'Risk: Network Dependence', details: '', duration: 140, position: 9},
#     { user_id: 1, course_id: 5, title: 'Risk: Cloud Provider Outages', details: '', duration: 51, position: 10},
#     { user_id: 1, course_id: 5, title: 'Risk: Safety Critical Processing', details: '', duration: 72, position: 11},
#     { user_id: 1, course_id: 5, title: 'Risk: Compliance', details: '', duration: 166, position: 12},
#     { user_id: 1, course_id: 5, title: 'Risk: Information Security', details: '', duration: 212, position: 13},
#     { user_id: 1, course_id: 5, title: 'Open Source Software Value & Risk', details: '', duration: 94, position: 14},
#     { user_id: 1, course_id: 5, title: 'Costs: Up Front, Operational, Annual Divestment & Total Cost', details: '', duration: 267, position: 15},
#     { user_id: 1, course_id: 5, title: 'Selecting an IAAS Provider', details: '', duration: 126, position: 16},
#     { user_id: 1, course_id: 5, title: 'IEEE Standards: P2301 & P2302', details: '', duration: 123, position: 17},
#     { user_id: 1, course_id: 5, title: 'Intercloud Interoperability', details: '', duration: 71, position: 18},
#     { user_id: 1, course_id: 5, title: 'Management Recommendations', details: '', duration: 228, position: 19},
#     { user_id: 1, course_id: 5, title: 'Data Governance Recommendations', details: '', duration: 109, position: 20},
#     { user_id: 1, course_id: 5, title: 'Security and Reliability Recommendations', details: '', duration: 140, position: 21},
#     { user_id: 1, course_id: 5, title: 'Virtual Machine Recommendations', details: '', duration: 53, position: 22},
#     { user_id: 1, course_id: 5, title: 'Software and Application Recommendations', details: '', duration: 125, position: 23},
#     { user_id: 1, course_id: 5, title: 'Success Factors', details: '', duration: 47, position: 24},
#     { user_id: 1, course_id: 5, title: 'Summary', details: '', duration: 106, position: 25},
#     { user_id: 1, course_id: 5, title: 'Glossary and References', details: '', duration: 48, position: 26},
#
#     { user_id: 1, course_id: 6, title: 'Intro to Smart Grid Standards', details: 'An introduction to the Smart Grid Standards tutorial series and to the series author, Erich W. Gunther.', duration: 183, position: 1},
#     { user_id: 1, course_id: 6, title: 'Why Use Standards? ', details: 'This tutorial covers the standards and some of the additional technologies that make the smart grid work. ', duration: 237, position: 2},
#     { user_id: 1, course_id: 6, title: 'Smart Grid Standards Framework', details: '', duration: 224, position: 3},
#     { user_id: 1, course_id: 6, title: 'Smart Grid Standards Acceleration Challenges', details: '', duration: 170, position: 4},
#     { user_id: 1, course_id: 6, title: 'What Does the Smart Grid Need?', details: '', duration: 86, position: 5},
#     { user_id: 1, course_id: 6, title: 'Smart Grid Network Communications', details: '', duration: 250, position: 6},
#     { user_id: 1, course_id: 6, title: 'Market/Regulatory/External', details: '', duration: 98, position: 7},
#     { user_id: 1, course_id: 6, title: 'Utility Corporate/Control Center', details: '', duration: 72, position: 8},
#     { user_id: 1, course_id: 6, title: 'Utility Transmission/Wide Area Networks', details: '', duration: 94, position: 9},
#     { user_id: 1, course_id: 6, title: 'Utility Distribution/Field Area Networks', details: '', duration: 125, position: 10},
#     { user_id: 1, course_id: 6, title: 'Consumer Premise Area Networks', details: '', duration: 137, position: 11},
#     { user_id: 1, course_id: 6, title: 'NIST Roadmap LHF Standards', details: '', duration: 76, position: 12},
#     { user_id: 1, course_id: 6, title: 'Major Challenges', details: '', duration: 89, position: 13},
#     { user_id: 1, course_id: 6, title: 'Conclusion', details: '', duration: 178, position: 14},
#     { user_id: 1, course_id: 6, title: 'Glossary and References', details: '', duration: 120, position: 15},
#
#     { user_id: 1, course_id: 7, title: 'Smart Devices for the Smart Grid Introduction', details: '', duration: 180, position: 1},
#     { user_id: 1, course_id: 7, title: 'Transmission', details: '', duration: 75, position: 2},
#     { user_id: 1, course_id: 7, title: 'Dynamic Line Rating Methods/New Technologies', details: '', duration: 60, position: 3},
#     { user_id: 1, course_id: 7, title: 'The Substation', details: '', duration: 57, position: 4},
#     { user_id: 1, course_id: 7, title: 'Transformer Condition Assessment: Advanced Sensors', details: '', duration: 99, position: 5},
#     { user_id: 1, course_id: 7, title: 'Other Advanced Sensor Applications', details: '', duration: 48, position: 6},
#     { user_id: 1, course_id: 7, title: 'Advanced Event Signature Analysis', details: '', duration: 36, position: 7},
#     { user_id: 1, course_id: 7, title: 'Online Infrared Systems', details: '', duration: 64, position: 8},
#     { user_id: 1, course_id: 7, title: 'Field Data Access Architecture', details: '', duration: 63, position: 9},
#     { user_id: 1, course_id: 7, title: 'Challenges', details: '', duration: 84, position: 10},
#     { user_id: 1, course_id: 7, title: 'The Customer Domain', details: 'labeled as module 12 on Vimeo', duration: 62, position: 11},
#     { user_id: 1, course_id: 7, title: 'Hot Topic Utility Applications', details: 'labeled as 13', duration: 62, position: 12},
#     { user_id: 1, course_id: 7, title: 'Hot Topic Customer Applications', details: 'labeled as 14', duration: 62, position: 13},
#     { user_id: 1, course_id: 7, title: 'Smarter Devices', details: 'labeled as 15', duration: 43, position: 14},
#     { user_id: 1, course_id: 7, title: 'Appendix: Consumption Understanding', details: 'labeled as 16 ', duration: 48, position: 15},
#     { user_id: 1, course_id: 7, title: 'Appendix: Architecting Energy Services', details: 'labeled as 17', duration: 48, position: 16},
#     { user_id: 1, course_id: 7, title: 'Appendix: Energy Service Experience & Copyright', details: 'labeled as 18', duration: 48, position: 17},
#     { user_id: 1, course_id: 7, title: 'Glossary & References', details: 'labeled as 19', duration: 120, position: 18},
#
#     { user_id: 1, course_id: 8, title: 'Cyber Security Intro to Kevin Brown', details: '', duration: 175, position: 1},
#     { user_id: 1, course_id: 8, title: 'Security Principles', details: '', duration: 81, position: 2},
#     { user_id: 1, course_id: 8, title: 'Approach I', details: '', duration: 166, position: 3},
#     { user_id: 1, course_id: 8, title: 'Approach II', details: '', duration: 122, position: 4},
#     { user_id: 1, course_id: 8, title: 'Info & Control Enter the Field', details: '', duration: 71, position: 5},
#     { user_id: 1, course_id: 8, title: 'Understanding the Trade-Offs', details: '', duration: 77, position: 6},
#     { user_id: 1, course_id: 8, title: "What's Going On: NIST, SG Security, UCALUG, OPENSG, ASAP-SG, AND CSCTG", details: '', duration: 160, position: 7},
#     { user_id: 1, course_id: 8, title: 'Issues Addressed: NIST, SG Security, and ASAP-SG', details: '', duration: 86, position: 8},
#     { user_id: 1, course_id: 8, title: 'Get Involved', details: '', duration: 43, position: 9},
#     { user_id: 1, course_id: 8, title: 'Glossary and References', details: '', duration: 120, position: 10},
#
#     { user_id: 1, course_id: 9, title: 'Lithium-Ion', details: '', duration: 274, position: 1},
#     { user_id: 1, course_id: 9, title: 'Thin-Film Batteries', details: '', duration: 826, position: 2},
#     { user_id: 1, course_id: 9, title: 'Lithium/Polymer', details: '', duration: 545, position: 3},
#
#     { user_id: 1, course_id: 10, title: 'Intro to Fundamentals of Patent Protection and Matthew Ma', details: '', duration: 102, position: 1},
#     { user_id: 1, course_id: 10, title: 'Course Overview', details: '', duration: 50, position: 2},
#     { user_id: 1, course_id: 10, title: 'Basic Concepts', details: '', duration: 167, position: 3},
#     { user_id: 1, course_id: 10, title: 'Types & Categorization of Patents', details: '', duration: 117, position: 4},
#     { user_id: 1, course_id: 10, title: 'Patent Dates', details: '', duration: 134, position: 5},
#     { user_id: 1, course_id: 10, title: 'The Patent Cover Page and Early Priority Date', details: '', duration: 95, position: 6},
#     { user_id: 1, course_id: 10, title: 'Inventorship vs. Patent Ownership', details: '', duration: 171, position: 7},
#     { user_id: 1, course_id: 10, title: 'Accelerated Examination', details: '', duration: 133, position: 8},
#     { user_id: 1, course_id: 10, title: 'How to Obtain a Strong Patent', details: '', duration: 68, position: 9},
#     { user_id: 1, course_id: 10, title: 'Determining Patentability', details: '', duration: 244, position: 10},
#     { user_id: 1, course_id: 10, title: 'Business Considerations', details: '', duration: 211, position: 11},
#     { user_id: 1, course_id: 10, title: 'Protecting Intellectual Property', details: '', duration: 239, position: 12},
#     { user_id: 1, course_id: 10, title: 'Keeping Records', details: '', duration: 195, position: 13},
#     { user_id: 1, course_id: 10, title: 'Disclosure & Statutory Bar Date', details: '', duration: 186, position: 14},
#     { user_id: 1, course_id: 10, title: 'Patents vs. Publications', details: '', duration: 145, position: 15},
#     { user_id: 1, course_id: 10, title: 'Criteria in Patent Examination/Paper Publication', details: '', duration: 172, position: 16},
#     { user_id: 1, course_id: 10, title: 'The Patent System', details: '', duration: 142, position: 17},
#     { user_id: 1, course_id: 10, title: 'Duty of Disclosure and Common Mistakes', details: '', duration: 144, position: 18},
#     { user_id: 1, course_id: 10, title: "The Inventor's Stake", details: '', duration: 89, position: 19},
#     { user_id: 1, course_id: 10, title: 'Patent Search', details: '', duration: 235, position: 20},
#     { user_id: 1, course_id: 10, title: 'Glossary & References', details: '', duration: 51, position: 21},
#
#     { user_id: 1, course_id: 11, title: 'An Intro to How to Read a Standard with Howard Wolfman', details: '', duration: 65, position: 1},
#     { user_id: 1, course_id: 11, title: 'What are Engineering Standards?', details: '', duration: 159, position: 2},
#     { user_id: 1, course_id: 11, title: 'Understanding Standards ID Numbers & the Language of Standards', details: '', duration: 176, position: 3},
#     { user_id: 1, course_id: 11, title: 'Engineering Standards Sections Part I: Cover, Boilerplate, Scope & Purpose, Normative References, and Definitions', details: '', duration: 216, position: 4},
#     { user_id: 1, course_id: 11, title: 'Engineering Standards Sections Part II: Body, Normative Annexes, Informative Annexes, Figures, and Tables', details: '', duration: 131, position: 5},
#     { user_id: 1, course_id: 11, title: 'Engineering Standards Sections Part III: Standard History, References, and Amendments', details: '', duration: 128, position: 6},
#     { user_id: 1, course_id: 11, title: 'Conclusion', details: '', duration: 56, position: 7},
#
#     { user_id: 1, course_id: 12, title: 'An Intro to Ethics in Standards Development with Howard Wolfman', details: '', duration: 76, position: 1},
#
#     { user_id: 1, course_id: 14, title: 'An Introduction to IEEE 1588 with John C. Eidson & Doug Arnold', details: '', duration: 99, position: 1}
#
# ])


###################### end new seed #################

# Video.create!([
#   {chapter_id: 1, video_url: "/uploads/video/video_url/Vi1.mp4", title: 'Intro Video', details: 'Video Course awesome', transcript: '', faqs: '', position: 1},
#   {chapter_id: 2, video_url: "/uploads/video/video_url/mov_bbb.mp4", title: 'Second Video', details: 'Video Course awesome', transcript: '', faqs: '', position: 2}
# ])

# Order.create!({user_id: 1, amount: 0, address: '111 Fake st.', address_two: '', city: 'Brooklyn', state: 'NY', zip_code: '11112' })
# Order.create!({user_id: 1, amount: 100, address: '111 Fake st.', address_two: '', city: 'Brooklyn', state: 'NY', zip_code: '11112' })
