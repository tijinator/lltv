
User.create!([
  {provider: "email", uid: "test@test.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2015-12-31 17:29:32", last_sign_in_at: "2015-12-31 17:27:52", current_sign_in_ip: "192.168.3.1", last_sign_in_ip: "192.168.3.1", confirmation_token: "njUVNtTzAZa6jAdpgekA", confirmed_at: nil, confirmation_sent_at: "2016-01-03 22:34:07", unconfirmed_email: nil, first_name: "Russel", last_name: "Kurt", email: "test@test.com", username: "", role: 30, tokens: {}}
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
  {chapter_id: 1, video_url: "/uploads/video/video_url/Vi1.mp4", title: 'Intro', details: 'Video Course awesome', transcript: '', faqs: '', position: 1},
  {chapter_id: 2, video_url: "/uploads/video/video_url/mov_bbb.mp4", title: 'Intro', details: 'Video Course awesome', transcript: '', faqs: '', position: 2}
])


