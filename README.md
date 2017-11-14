

# 4차산업혁명 선도인재 양성 프로젝트 과정

---
## 1. Week 1 Day 6 & 7: Simple_board_comments

***

### User & Post

+ 1:1
+ 1:N = User & Post / Post & Reply / Class & Student 
  - 1 User가 여저 Post를 가질 수 있다.
  - Post들은 특정 한 User에 속해야 한다.
  - 게시물과 댓글
  - 학급과 학생
  - user had posts
  - post must be included in user
  - post_id값 가진 칼럼
+ M:N = Major & Student



##### User

|      | user | email | password |
| ---- | :--: | :---: | :------: |
|      |  1   |  123  |   123    |
|      |      |       |          |
|      |      |       |          |

 

### Post

|      | User | Title | Content |
| ---- | :--: | :---: | :-----: |
|      |  1   |  123  |   123   |
|      |      |       |         |
|      |      |       |         |



- rails db

sqlite> .tables #테이블 출력

sqlite> .schmea 테이블명



+ rails c

```ruby
Post.find(글번호)
user = User.find(1)
User.find(1).posts.last.content
```



+ create_reply

1. form 입력을 받는다
2. 내가 가진 데이터베이스에 저장 = params[:content]
3. 보여준다 = show

1. csrf attack

1) application_controller.rb -> protect_from_forgery with: :exception 주석처리



2. get -> post로 변경

+ user -> login.erb에 

```html
<form action="/user/create" method="post">
```

+ user -> new.erb에

```html
<input type="hidden" name="authenticitiy_token" value="<%= form_authenticity_token%>">
```



flash[:notice]

@message = 변수는 그 def 문 안에서



+ rails g controller user index new create
+ rails g model user email password
+ rake db:migrate



##### Action view form helper

= http://guides.rorlab.org/form_helpers.html

```html
<%= form_tag do %>
  Form contents
<% end %>
```



##### SEO = 검색엔진최적화

자신의 crawler를 검색엔진



gam 'faker'

raeke db:seed

seeds.erb

```ruby
20.times do
    User.create(
        email: Faker::Internet.email,
        password: "1234" 
    )
end
```

```ruby
20.time do
    Post.create(
        title: Faker::Movie.quote,
        content: Faker::LeagueOfLegends.champion,
        user_id: (1..20).to_a.sample
    )
end
```



rails g scaffold blog title:string content:text

rake db:migrate

controllers -> concerns -> blogs_controller.rb



##### User & Post & Comment

User

- model: email, password

Post

+ model: user_id, title, content

Content

+ model: post_id, content



User => has_many :posts

Post => belongs_to :user



Post => has_many :comments

Comment => belongs_to :post