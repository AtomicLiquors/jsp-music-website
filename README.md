# JSP 음악 커뮤니티 웹사이트 :headphones:  
>Jsp 기반의 음악 파일 업로드 및 공유 중심의 커뮤니티 웹사이트입니다.  

&nbsp;  
### :clock2: 제작 기간
'22.05.01 - '22.05.16 (3주)  

&nbsp;  
### :construction_worker: 개발 인원 : 
#### [총 4명]
  - **최효빈 [팀장: 화면설계, DB설계, 프론트엔드(주), 홈화면]**   
    - 레이아웃 (사이드바, 헤더, 푸터) 구현
    - 화면 구현 분담
    0
    - 홈 화면 및 관리자 화면 기능 구현
    - 음악파일 플레이어, 네이버 아이디 로그인 등 부가기능 구현
    
  - **김상준 [게시판 기능]**   
    - 게시판 구현
    - 멜론 차트 웹크롤링 구현
    - 좋아요한 게시글
    
  - **김준형 [회원 기능]**   
    - DB 커넥션
    
  - **김한솔 [프론트엔드(부)]**   
    - 화면 구현 분담


&nbsp;  
### :books: 사용한 기술 
- Java, MySQL
- Tool : HeidiSQL, Github Desktop


&nbsp;  
___

   
### 회원 기능
- 네이버 아이디 로그인
- 좋아요/저장 게시글 모아보기

&nbsp;  
### 게시판 기능
- 게시글 링크 공유
- 게시글에 유튜브 플레이어 및 첨부파일 표시(이미지, 음원, 영상)

&nbsp;  
### 음원 차트 웹크롤링

&nbsp;  

### 관리자 기능
- 회원 탈퇴
&nbsp;  



&nbsp;  
### :wrench: 주요 기능
- **계정 기능**    
 DB에 계정 정보를 등록하고 로그인, 계정 정보 찾기, 중복확인 등 수행
 
- **일정 등록 및 댓글 기능**     
 특정 날짜에 일정을 등록합니다. 
  - 일정은 DB에 등록되고, 달력에 표시됩니다.
  - 등록된 일정에 댓글을 작성할 수 있습니다.
 
- **D-Day**    
 등록된 일정 중 하나를 지정하여 좌측 사이드바에 D-Day로 표시합니다.

&nbsp;  
### :hammer: Troubleshooting
- **달력 예제 디버깅(경곗값 오류)**   
  
  CalendarGrid.java에 구현된 달력 패널은 구글링을 통해 캘린더 예제를 변형한 것이다.  
  예제에 연도가 넘어갈 때 월이 0 이하로 감소하였다.  
  직접 코드를 분석하고, 알고리즘을 수정하여 연도가 변해도 날짜가 정상적으로 출력되게끔 하였다.  
  
- **Github 업로드시 .java파일 한글 인코딩 오류 발생**  
 
  Github Desktop을 통해 조원과 소스 파일을 공유하는 중,  
  한글이 손상되는 문제가 발생하였다.  
  조원들과 의논한 결과 Workspace 전체를 UTF-8로 바꿔서 해결하였다.  


&nbsp;  
___

&nbsp;  
### :hammer: Troubleshooting
   


&nbsp;   
### :bar_chart: 구조
#### [Class Diagram]

&nbsp;  
&nbsp;  
#### [ER Diagram]
<img src = "https://github.com/AtomicLiquors/java-calendar/blob/main/ER_Diagram.png" style= "width: 60vw;">



&nbsp;  
___

&nbsp;   
### :memo: 후기
