User.create!([
  {email: "bdanke@gmail.com", password: "asdfasdf", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2015-12-31 17:29:32", last_sign_in_at: "2015-12-31 17:27:52", current_sign_in_ip: "192.168.3.1", last_sign_in_ip: "192.168.3.1", confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, first_name: "Brandon", last_name: "Danker", username: "bdanke", role: 30, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil}
])
Category.create!([
  {user_id: 1, parent_id: nil, title: "Design", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 0, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, html_tab_id: "design", html_tab_color: "rgba(26, 157, 7, 0.78)", html_color: "#1A9D07"},
  {user_id: 1, parent_id: nil, title: "Engineering", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, html_tab_id: "engineering", html_tab_color: "rgba(255,144,7,0.78)", html_color: "#FF9000"},
  {user_id: 1, parent_id: nil, title: "Architecture", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, html_tab_id: "architecture", html_tab_color: "rgba(57, 9, 205, 0.78)", html_color: "#3909CD"},
  {user_id: 1, parent_id: nil, title: "Photography", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, html_tab_id: "photography", html_tab_color: "rgba(255, 0, 206, 0.78)", html_color: "#FF00CE"},
  {user_id: 1, parent_id: nil, title: "3D + Animation", details: "Whether you want to design a logo, create ebooks, or just learn how to use a Pen tool, our in-depth design tutorials can help. Get to know Illustrator and InDesign, explore typography, and learn the nuances of designing for print.", position: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, html_tab_id: "3danimation", html_tab_color: "rgba(205, 46, 15, 0.78)", html_color: "#CD2E0F"}
])
