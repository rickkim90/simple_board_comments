

# 4차산업혁명 선도인재 양성 프로젝트 과정

---
## 1. Week 1 Day 6: Simple_board_comments

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