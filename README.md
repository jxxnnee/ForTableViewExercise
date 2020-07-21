# ForTableViewExercise

<img src="https://github.com/jxxnnee/ForTableViewExercise/raw/master/Images/view.png" alt="view.png" style="zoom:50%;" />


## 기능

- JSON 파일의 데이터를 읽어와 TableView를 구성하는 간단한 앱이다.

## 전체 앱 구성

- 디자인 패턴은 MVC 패턴으로 이루어져 있다.
- JSON 파일을 읽어와 Data 내용의 Section을 체크하여 각 Section 별로 나누어 TableView를 구성한다.
- TableView Cell 은 Xib 를 이용하여 CustomCell 을 제작 사용했다.
- Restaurant의 Thumbnail은 Kingfisher 라이브러리를 사용하여 가져오도록 했다.
- Option 들을 체크하여 추가하기위해 StackView 를 사용했다.
- Section 의 HeaderView는 viewForHeaderInSection Delegate를 이용하여 폰트를 변경했다.
- UIKit 관련 객체들을 손쉽게 다루기 위하여 Extension 을 통해 Custom Function을 추가하여 사용했다.
- Option 박스는 UIView를 이용하여 구현했다.

## 트러블슈팅

- **JSON Data Parsing 문제**
  - 문제점 : 초기에 SwiftyJSON을 사용했는데, 데이터를 컨트롤하기에 적합하지 않았다.
  - 해결법 : Codable을 사용하여 기본 구조는 Struct 로 정의하고, 몇가지 타입이 정해져있는 경우는
    Enum 형식으로 직접 정의하여 Struct 내에 정의해 두었다.
- **각 Section의 갯수와 Container** 
  - 문제점 : 각 Section 의 갯수와 자료를 담을 Container가 필요했다. 따로따로 변수를 선언해두기엔 보기에도 지저분해 보이고 메모리 낭비라고 생각했다.
  - 해결법 : Dictionary 타입을 사용하여 <Int, [Restaurant]> 형식으로 정의하여 키에 맞는곳에 데이터를 저장하여 사용했다. 
    Key 값이 Int 인 이유는 Delegate 에서 Section Parameter를 받아서 사용하기위해 Int 로 0 부터 Key 값을 정해두었다.
- **TableView Cell 재사용 이슈**
  - 문제점 : TableView의 Cell 이 스크롤 할 때마다 재사용을 통해 View에 나타내기 때문에 전에 선언해두거나 정의해 둔 값을 재사용하는 경우가 발생했다.
  - 해결법 : Cell 의 prepareForReuse 함수를 이용하여 매번 재사용할때마다 StackView의 내용을 초기화 시켰다. 

## 배운 점 & 느낀 점

- 아직도 기본적인 TableView 사용에도 완전하게 익숙하지 않았다. 좀 더 공부해야 할 필요가 있다고 느꼈다.
- Custom Cell 을 사용할 때 재사용 이슈가 있음을 배웠다.
- Data 를 모델링하여 Parsing 하는 작업도 많이 해보지 않으면 오래걸린다는걸 알았다.

### 공부한 내용

- **JSON Data Parsing** : 
  - https://velog.io/@public_danuel/Swift4-JSON-Codable-encode
- **Table View Section** : 
  - https://gigas-blog.tistory.com/46
  - https://stackoverflow.com/questions/19802336/changing-font-size-for-uitableview-section-headers
- **prepareForReuse** :
  - https://baked-corn.tistory.com/51
