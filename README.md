# 🍓🍌🥝🍍🥭 Juice Maker

## 🍀 소개
`Dasan`과 `kyungmin`이 만든 Juice Maker입니다. 과일 쥬스 중 하나를 선택하여 주문하기 버튼을 누르면, 필요한 과일 재고를 확인한 후 해당 과일 쥬스를 만들어 줍니다. 재고가 부족할 경우 재고 수정을 통해 필요한 만큼 재고를 추가할 수 있습니다.

<br>

## 📖 목차
1. [팀원](#-팀원)
2. [그라운드룰](#-그라운드룰)
3. [일일 스크럼](#-일일-스크럼)
4. [타임라인](#-타임라인)
5. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
6. [실행 화면](#-실행-화면)
7. [트러블 슈팅](#-트러블-슈팅)
8. [참고 링크](#-참고-링크)
9. [팀 회고](#-팀-회고)

<br>

## 👨‍💻 팀원
| Dasan | kyungmin |
| :------: | :------: |
|<Img src="https://i.imgur.com/EU67fox.jpg" width="200"> |<Img src="https://cdn.discordapp.com/attachments/1100965172086046891/1108927085713563708/admin.jpeg" width="200"> |
|[Github Profile](https://github.com/DasanKim) |[Github Profile](https://github.com/YaRkyungmin)

<br>
    
## 📝 그라운드룰
- [그라운드룰](https://github.com/YaRkyungmin/ios-juice-maker/wiki/🤙Ground-Rules)
## 📝 일일 스크럼
- [일일 스크럼](https://github.com/YaRkyungmin/ios-juice-maker/wiki/🌻일일-스크럼)


## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.05.08.(월)| - 과일의 재고를 관리하는 타입 설계 <br> - 과일 쥬스를 만드는 타입 설계 |
|2023.05.09.(화)| - 과일 재고 체크하는 메소드 구현 <br> - 과일 쥬스 만드는 메소드 구현 <br>|
|2023.05.10.(수)| - [Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/) 공부 <br> - Access Control 적용 <br>| 
|2023.05.11.(목)| - 과일 쥬스 만드는 타입 내, 과일 수량 요청하는 메소드 구현 <br> - 과일 쥬스 만드는 타입 내, 과일 수량 받는 메소드 구현 <br> - 과일 이름 및 수량을 담고 있는 프로퍼티 타입 <br> - 에러 처리 구현|
|2023.05.12.(금)| - 피드백 요청사항 반영 및 전체적인 리펙토링 진행 <br> |
|2023.05.15.(월)| - 왕초보를 위한 ios 앱개발 보면서 UI 구성 고민 <br> |
|2023.05.16.(화)| - view와 model을 viewController에서 연결 <br> - 쥬스 제작 성공 및 실패시 `alert` 구현 <br> - modal방식 화면 전환 구현 <br>|
|2023.05.17.(수)| - 프로그램 내 로직적 오류를 발견하여 수정 <br> - 뷰 사이 데이터 공유 방법 탐색 <br> |
|2023.05.18.(목)| - viewController 생명주기 공부 <br> - UIButton 구현 방식 변경 <br> - Juice 타입 내 recipe 프로퍼티 변경 <br>|
|2023.05.19.(금)| - 피드백 요청사항 반영 및 전체적인 리펙토링 진행 <br> - 화면 전환 방식 고민<br>|
|2023.05.22.(월)| - 화면 전환 방식 `segue`로 통일<br> - 얼럿 메서드 통합<br> - 역 델리게이트로 과일 재고 받아오는 기능 구현<br>|
|2023.05.23.(화)| - 데이터 공유 방법 중 `sigleton` 테스트 적용 <br> - UIStepper와 코드 연결<br> - segue의 unwind 메서드 적용<br>|
|2023.05.24.(수)| - 데이터 공유 방법 중 `notificationCenter` 테스트 적용 <br> - 재고 수정 화면에 오토레이아웃 적용 <br>|
|2023.05.25.(목)| - 데이터 공유 방법 중 `KVO` 테스트 적용 <br> - 데이터 공유 방법으로 `segue`을 통한 구현으로 최종 적용<br> - 재고수정 ViewControll에서 추가된 재고 값만 반환하도록 수정<br> - 과일 재고를 관리하는 타입 내 재고들을 외부에서 직접 수정하지 못하도록 수정 <br> - AccessControl 적용 및 전체적인 리펙토리 진행<br>|
|2023.05.26.(금)| - README.md 작성 <br>|

</br>

## 👀 시각화된 프로젝트 구조

### 초기 타입 설계
``` swift
class FruitStore {
// 프로퍼티
- 과일들(딸기, 바나나, 파인애플, 키위, 망고) 프로퍼티
- 과일 수량 프로퍼티
// 메서드
- 각 과일의 수량 추가 메서드
- 각 과일의 수량 빼기 메서드
}

struct JuiceMaker {
// 프로퍼티
FruitStore 인스턴스
// 메서드
- 쥬스 제조 메서드
- 재고 확인 요청 메서드
}

// nasted type으로 쥬스 별 제조법 구현
```

### Class Diagram
<p>
<img width="" src="https://cdn.discordapp.com/attachments/1100965172086046891/1111563908277350480/JucieMakerClassDiagram.png">
</p>
<br>

### Method Flow Chart
<p>
<img width="" src="https://github.com/YaRkyungmin/ios-juice-maker/assets/74167204/5b7f8905-4e02-4ec0-8322-11c64f187b95">
</p>
<br>

### 🗂폴더 구조
> Model : 앱 구동 로직에 필요한 모델
> View : 화면을 구성하는 뷰
> Controller : 화면의 이벤트와 전환을 컨트롤하는 컨트롤러
```
JucieMaker
├── Info
├── Model
│   ├── JuiceMaker
│   ├── FruitStore
│   ├── Fruit
│   ├── Jucie
│   └── JucieMakerError
├── View
│   ├── Main
│   ├── Assets
│   └── LaunchScreen
└── Controller
    ├── AppDelegate
    ├── SceneDelegate
    ├── JucieMakerViewController
    └── ModifyStockViewController
```
<br>

## 💻 실행 화면 

|View와 연결하기 전 콘솔 실행화면|주문 성공 시 실행화면|
|:--:|:--:|
|<img src="https://cdn.discordapp.com/attachments/1100965172086046891/1106524466877567016/juiceMaker_Step1_screenshot.png" width="400">|<img src="https://cdn.discordapp.com/attachments/1100965172086046891/1111485915261575178/orderSuccess.gif" width="400">|

|주문 실패 시 실행화면|재고수정 버튼 터치 시 실행화면|
|:--:|:--:|
|<img src="https://cdn.discordapp.com/attachments/1100965172086046891/1111486875031584919/modifyStock.gif" width="400">|<img src="https://cdn.discordapp.com/attachments/1100965172086046891/1111485940670660698/orderFail.gif" width="400">|


|iPhone SE3에서의 실행화면|iPhone 14 Pro에서의 실행화면|
|:--:|:--:|
|<img src="https://cdn.discordapp.com/attachments/1100965172086046891/1111489407262933082/iPhone_SE3rd.gif" width="400">|<img src="https://cdn.discordapp.com/attachments/1100965172086046891/1111489600611962900/iPhone_14_Pro.gif" width="400">|

</br>

## 🧨 트러블 슈팅

### 1️⃣ **과일 종류와 수량을 담는 recipe 타입 고민** <br>

🔒 **문제점** <br>

Juice타입 내 recipe프로퍼티를 구현함에 있어, 여러가지 방법들이 있었고 각각 장단점을 바탕으로 튜플을 이용해 구현 하였습니다.

1. **Nested Type - Struct내 2개의 tuple property 이용**
    ```swift 
    enum FruitType {
        (중략)
        case mangoKiwiJuice

        struct Recipe {
            let firstIngredient: (FruitType, Int), secondIngredient: (FruitType, Int)?
        }

        var recipe: Recipe {
            switch self {
            (중략)
            case .mangoJuice:
                return Recipe(firstIngredient: (.mango, 3), secondIngredient: nil)
            case .mangoKiwiJuice:
                return Recipe(firstIngredient: (.mango, 2), secondIngredient: (.kiwi, 1))
            }
        }
    }
    ```
    
- **장점**
  - index로 접근하지 않고, 프로퍼티의 이름을 통하여 접근할 수 있습니다.
- **단점**
  - switch문에서 Recipe struct의 멤버와이즈 이니셜라이져를 사용했기 때문에 코드가 길어져 가독성이 떨어졌습니다.
  - `secondIngredient` 프로퍼티 값이 `nil`일 경우, 다른 곳에서 `FruitType.recipe` 프로퍼티를 사용할 때 마다 `nil`을 처리해줘야했습니다.
  - 세가지 이상의 재료를 쓰는 경우, struct를 수정해야하는 번거로움이 있습니다.

2. **Dictionary Type**
    ```swift
    var recipe: [Fruit: Int] {
        switch self {
        (중략)
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2,.kiwi: 1]
    }
    ```
- **장점**
  - 딕셔너리는 유일한 `key`값을 보장하므로 fruit 값이 중복되지 않도록 보장해줍니다.
  - 새로운 값을 쉽게 추가할 수 있습니다.
  - `key`를 통하여 `value`값을 빠르게 찾을 수 있습니다.
  
- **단점**
  - 딕셔너리 타입은 **옵셔널 바인딩 처리**를 해줘야합니다.
  - recipe.`key`와 recipe.`value`로 접근하게 될 때 가독성이 떨어질 수 있습니다.

3. **Tuple Type Array**

    ```swift
    var recipe: [(fruit: Fruit, amount: Int)] {
        switch self {
        (중략)
        case .mangoJuice:
            return [(.mango, 3)]           
        case .mangoKiwiJuice:
            return [(.mango, 2),(.kiwi, 1)]
        }
    }
    ```
    
- **장점**
  - 튜플의 lable을 사용하여 가독성을 높일 수 있습니다.
  - 튜플 내에 타입이 다른 값들을 넣어줄 수 있습니다.
  - 튜플 타입의 배열이기 때문에 새로운 값을 추가하기 쉽습니다.
- **단점**
  - 배열의 index 사용시 상황에 따라 딕셔너리보다 가독성이 떨어질 수 있습니다.
  - 딕셔너리의 시간복잡도보다 배열의 값을 찾기위하여 순회하는 시간복잡도가 클 수 있습니다.

🔑 **해결방법** <br>
- Dictionary는 hashTable 프로토콜을 준수하여 시간 복잡도가 O(1)에 가까워 `key`값인 fruit을 사용하여 과일의 수량을 빠르게 찾을 수 있습니다.
- 그러나 `recipe` 프로퍼티를 다룰 때 실질적으로 `key`값을 이용하여 과일의 수량을 바로 찾는 로직이 없어 **딕셔너리의 장점을 활용하지 못했습니다.**
- 따라서 시간복잡도를 크게 신경쓰지 않았을 때 장점이 더 많은 튜플 배열을 선택하였습니다.
<br>

### 2️⃣ **FruitStore클래스 내 과일을 담는 FruitInventory 프로퍼티 타입 고민** 

1. **타입을 갖는 배열 이용**
    ```swift
    class FruitStore {
        private(set) var FruitInventory: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
        
        (중략)
    }
    ```
- **장점**    
  - 딕셔너리 key값으로 과일의 value값을 빠르게 찾을 수 있었습니다.  
- **단점**    
  - 수량을 꺼내올때마다 옵셔널 바인딩 처리를 해줘야 하는 단점이 있었습니다.

2. **Fruit 타입의 inventoryIndex 프로퍼티를 FruitInventory배열의 index로 활용**
    ```swift
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango

        var inventoryIndex: Int {
            switch self {
            case .strawberry:
                return 0
            case .banana:
                return 1
            case .pineapple:
                return 2
            case .kiwi:
                return 3
            case .mango:
                return 4
            }
        }
    }
    ```

    ```swift
    class FruitStore {
        private(set) var fruitInventory: [Int]

        init(initialStock: Int = 10) {
            fruitInventory = Array(repeating: initialStock,
                                   count: Fruit.allCases.count)
        }
        (중략)
    }
    ```
- **장점**
  - 딕셔너리와 다르게 사용할 때 옵셔널 바인딩 처리를 해주지 않아도 됩니다.
  - Fruit enum 타입의 `inventoryIndex`를 배열의 index로 활용하여 가독성을 키웠습니다.
  - 딕셔너리와 값을 찾는 시간 복잡도도 O(1)로 같습니다.

🔑 **해결방법** <br>
  - 위처럼 여러가지 방법이 있기 때문에, 어떤 것을 활용할 지는 "목적"에 따라 달라질 수 있었습니다.
  - **시간 복잡도를 줄이는 것**이 목적인지, **코드의 가독성을 높이는 것**이 목적인지 (혹은 옵셔널 바인딩을 최대한 줄이려고 한다던가)를 추후에 정하여 그 목적에 맞게 방법을 선택하기로 하였습니다.
<br>

### 3️⃣ **if, guard를 언제 사용하는 것이 좋을까** 

🔒 **문제점** <br>

- `if`와 `guard`중에서 조기탈출을 해줄 수 있고, 가독성 측면에서 좋다고 알고있던 `guard`를 우선적으로 사용했는데 항상 `guard`만을 사용하니 언제 `if`를 사용해야하나 고민했습니다.

    ```swift
    // 사례 1
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        var isEnoughStock: Bool = Bool()
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.hasEnoughStock(fruit: $0.key, amount: $0.value)
        }
        guard isEnoughStock else {
            
        }
    }
    ```
    ```swift
    // 사례 2
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        for ingredient in fruitJuice.recipe {
            guard fruitStore.hasEnoughStock(fruit: ingredient.fruit, amount: ingredient.amount) else {
                throw JuiceMakerError.outOfFruitStock
            }
        }
    }
    ```

🔑 **해결방법** <br>

- 로직의 마지막 부분에 오는 분기 처리에서 `guard`를 사용하면 `guard`의 조기탈출 특징을 살릴 수 없었고, 로직적으로 어색했기 때문에 로직의 가독성을 명확하게 하기 위해 `if`를 사용했습니다.
    ```swift
    // 사례 1
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        var isEnoughStock: Bool = Bool()

        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.hasEnoughStock(fruit: $0.key, amount: $0.value)
        }
        if isEnoughStock == false {
            throw JuiceMakerError.outOfFruitStock
        }
    }
    ```
    ```swift
    // 사례 2
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        for ingredient in fruitJuice.recipe {
                if !fruitStore.hasEnoughStock(fruit: ingredient.name, amount: ingredient.amount) {
                    throw JuiceMakerError.outOfFruitStock
            }
        }
    }
    ```
<br>

### 4️⃣ **기능은 같고 처리값만 다른 UIButton들 구분**

🔒 **문제점** <br>

- 기능은 같지만 버튼에 따라 처리해야하는 값이 다른 버튼들을 구분하기 위하여 UIView의 프로퍼티인 `tag`를 활용하였습니다. tag는 view 객체의 `identify`을 `Int 타입`으로 표현할 수 있는 프로퍼티이므로 Int 타입으로 간편하게 객체를 구분할 수 있었습니다. 그러나 다른 버튼이 추가되었을 때 tag를 추가해줘야할 뿐만아니라, 아래 `switch문`도 수정해야하는 불편함도 있었습니다.

    ```swift
       switch sender.tag {
       case 0:
           order(juice: .strawberryJuice)
       case 1:
           order(juice: .bananaJuice)
       case 2:
           order(juice: .kiwiJuice)
       case 3:
           order(juice: .pineappleJuice)
       case 4:
           order(juice: .strawberryBananaJuice)
       case 5:
           order(juice: .mangoJuice)
       case 6:
           order(juice: .mangoKiwiJuice)
       default:
           print("unknown")
       }
    ```

🔑 **해결방법** <br>

- UIButton 타입의 **배열을 생성**하여 각 버튼들을 Juice 타입의 순서와 **동일한 순서**로 배열에 넣어주었습니다. 또한 Juice 타입에 `CaseIterable`를 선언하여 allCases으로 Juice case 모든 값을 제공 받았습니다. 그렇게 하여 해당 버튼이 배열에 있는 순서(index)와 같은 과일 쥬스를 주문할 수 있도록 하였습니다.

    ```swift
    @IBOutlet var orderButtons: [UIButton]!
    
    if let buttonIndex = orderButtons.firstIndex(of: sender){
                order(juice: Juice.allCases[buttonIndex])
    }
    ```
<br>

### 5️⃣ **ViewController 간 데이터 전달 방법**

🔒 **문제점** <br>

데이터를 전달하는 방법들이 다양하여, 어떤 방법을 프로젝트에 적용해야할지 고민되었습니다. 각각의 장단점을 비교해보고 적용해보기 위하여 아래 4가지 방법으로 branch를 열어 테스트를 해보았습니다.

1. **KVO**
  - **장점**
    - old, new value를 쉽게 얻을 수 있습니다.
  - **단점**
    - NSObject를 상속받는 객체에서만 사용이 가능합니다. 
    - 현재 코드에서 과일 재고의 값을 추척하여 재고의 값이 바뀌었을 때 label 업데이트하도록 Handler을 구현하였는데, 과일 재고 값을 어디서든 추적하려면 결국 **싱글톤**으로 만들어줘야했습니다.
    - **변경될 객체의 관찰**하는 것이 목표인 KVO는 다른 방법들과 비교하였을 때, **직접 정보(객체 등)을 전달할 수 없었습니다.**

2. **Notification**
  - **장점**
    - **다수의 객체들에게 동시에** 이벤트의 발생을 알려줄 수 있다는 장점이 있지만 현재 코드에선 적용될만한 장점이 아니었습니다.
    - Notification과 관련된 정보를 userInfo를 통하여 전달해줄 수 있습니다.
      ```swift
        NotificationCenter.default.post(name: Notification.Name("modifyNotification") ,
                                        object: nil, 
                                        userInfo: fruitStocks)
      ```
  - **단점**
    - post가 어떤 상황에 대한 알림을 준 **그 이후의 정보를 받을 수 없습니다.**
    - `Notification.Name`이 달라도 오류가 안나는 단점을 가지고 있습니다.
    - 추적해야할 것이 많아진다면 추적이 쉽지 않을 수 있습니다.

3. **Delegate**
  - **장점**
    - 프로토콜에 필요한 메소드들이 명확하게 명시합니다.
    - 로직의 흐름을 따라가기 쉽습니다.
    - 많은 기능을 위임할 수 있습니다.
    - 확장성, 모듈화, 코드 분리에 적합합니다.
  - **단점**
    - **JuiceMakerViewController가 delegate프로토콜을 채택했을 때**는 `ModifyStockViewController`가 JuiceMakerView에서 returnValue를 통해 수정 전 과일재고를 전달받고, 수정 후 과일 재고를 parameter로 넘겨줬습니다.
    - **ModifyStockViewController가 delegate프로토콜을 채택했을 때**는 `segue`를 통해 인스턴스를 delegate로 설정하다보니 segue를 통한 인스턴스 전달과 다를게 없었습니다.
    - segue가 아닌 방식으로 화면전환을 구현했다면 필요 했을 것 같습니다. 
    - 델리게이트의 장점들에 적합한 코드를 작성할 때, 더 많은 기능을 위임할 때 delegate를 써야 할 것 같다고 생각했습니다.

4. **Singleton**
  - **장점**
    - 메모리를 아낄 수 있습니다.
    - 전역적으로 타입에 접근가능 합니다.
    - 매우 편리합니다.
  - **단점**
    - 과일 재고에 대하여 직접적 접근을 제한하는 것이 한정적이였습니다.
    - 인스턴스끼리 결합도가 높아진다고 판단했습니다.(OCP 위반)
    ```swift
    class FruitStore {
        static var shared: FruitStore = FruitStore()
        var fruitInventory: [Int]

        private init(initialStock: Int = 10) {
            fruitInventory = Array(repeating: initialStock,
                                   count: Fruit.allCases.count)
        }
        (중략)
    }
    ```

🔑 **해결방법** <br>

각 View의 기능 초점을 아래와 같이 두고 무엇이 가장 적합할지 고민해보았습니다.

- JuiceMakerViewController
  - 쥬스를 주문 받음
  - ModifyStockView로 화면 전환
  - juiceMaker가 소유하고 있는 fruitStore의 과일 재고를 ModifyStockView에게 넘겨줌
  - 쥬스 제작 성공, 실패에 대한 Alert을 띄움 
- ModifyStockViewController
  - 과일 재고를 추가하는 기능
  - 추가된 과일 재고를 JuiceMakerView에 넘겨줌

따라서 각 View가 **수정되기 전 과일 재고**와 **수정 된 과일 재고** 데이터만을 소통하면 된다고 생각했습니다. 또한 과일 재고(fruitInventory)에 대한 접근제한을 해야한다고 생각했기 때문에, 최종적으로 `Segue`의 `prepare` 및 `unwind` 메소드를 통하여 과일 재고 데이터를 주고 받도록 하였습니다.

<br>

## 📚 참고 링크

- [🍎Apple Docs: Nested Type](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [🍎Apple Docs: Array](https://developer.apple.com/documentation/swift/array)
- [🍎Apple Docs: Cocoa design patterns](https://developer.apple.com/documentation/swift/cocoa-design-patterns)
- [🍎Apple Docs: KVO](https://developer.apple.com/documentation/swift/using-key-value-observing-in-swift)
- [🍎Apple Docs: UIStoryboardSegue](https://developer.apple.com/documentation/uikit/uistoryboardsegue)
- [🍎Apple Docs: Unwind segue로 뷰컨트롤러 닫기](https://developer.apple.com/documentation/uikit/resource_management/dismissing_a_view_controller_with_an_unwind_segue)
- [🍎Apple Docs: UnwindSegueSource](https://developer.apple.com/documentation/uikit/uistoryboardunwindseguesource)

<br>

## 👥 팀 회고
### 칭찬할 부분
- 스크럼 시간 잘 지킨 것
- 서로의 의견을 자유롭게 나눌뿐 아니라 서로 경청하여 더 나은 결과를 함께 고민한 것
- 깊이 있게 고민하는 것을 함께 한 것

### 개선해야할 부분
- 객체 설계 및 기능 분리를 명확하게 설계하고 코드를 작성할 것
- 이유있는 코드를 작성하기위해 코드를 작성하기 전에 항상 고민할 것
- 이해되지 않고 실행만 되는 코드를 사용하지 않을 것

### 서로에게 하고 싶은 말
- To. Dasan
  - 다산~ 3주동안 프로젝트를 같이 해본 적은 처음인데 언제 이렇게 시간이 지났나 느껴질만큼 소중하고 알찬 시간이였습니다. 다산 덕분에 많은 것을 배웠고 항상 지칠때마다 격려해주시고 힘을 주셔서 정말 많은 도움이 됐습니다. 남은 기간동안 새롭게 알게된 것이나 정보들이 생기면 언제든지 연락해서 알려드리겠습니다. 정말 감사합니다🥰

- To. kyungmin
  - 경민! 경민의 깊이 있는 탐구력 덕분에 깊이 공부하는 즐거움을 얻고 갑니다. 배려심 넘치는 성품과 재치 덕분에 프로젝트가 힘들게 느껴지지 않았던 것 같아요! 항상 부족하다 말씀하시는 경민이지만, 누구보다 경민에게서 많은 것을 배웠습니다. 감사해요:) 3주라는 시간이 너무 짧게 느껴질 만큼 아쉽지만 앞으로 남은 시간들도 같이 응원해주면서 끝까지 가보아요!! 정말 감사했습니다☺️

