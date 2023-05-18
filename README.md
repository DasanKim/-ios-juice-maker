# 🍓🍌🥝🍍🥭 Juice Maker

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

</br>

## 🍀 소개
`DasanKim`과 `kyungmin`이 만든 Juice Maker입니다. 과일 쥬스 중 하나를 선택하면, 과일 쥬스를 제조하기 위하여 필요한 과일 재고를 확인한 후 해당 과일 쥬스를 만들어 줍니다.

</br>

## 👨‍💻 팀원
| DasanKim | kyungmin |
| :------: | :------: |
|<Img src="https://i.imgur.com/EU67fox.jpg" width="200"> |<Img src="https://velog.velcdn.com/images/min3783/post/f41936fe-b7a6-469a-9320-73af0ecab8da/image.jpeg" width="200"> |
|[Github Profile](https://github.com/DasanKim) |[Github Profile](https://github.com/YaRkyungmin)

</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.05.08.| - 과일의 재고를 관리하는 타입 설계 <br> - 과일 쥬스를 만드는 타입 설계 |
|2023.05.09.| - 과일 재고 체크하는 메소드 구현 <br> - 과일 쥬스 만드는 메소드 구현 <br>|
|2023.05.10.| - [Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/) 공부 <br> - Access Control 적용 <br>| 
|2023.05.11.| - 과일 쥬스 만드는 타입 내, 과일 수량 요청하는 메소드 구현 <br> - 과일 쥬스 만드는 타입 내, 과일 수량 받는 메소드 구현 <br> - 과일 이름 및 수량을 담고 있는 프로퍼티 타입 <br> - 에러 처리 구현|
|2023.05.12.| - 피드백 요청사항 반영 및 전체적인 리펙토링 진행 <br>|

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

### Diagram
<p>
<img width="" src="https://velog.velcdn.com/images/min3783/post/0deb20ac-4654-41ec-91c8-f285d8beb061/image.png">
</p>

</br>


## 💻 실행 화면 

<img src="https://cdn.discordapp.com/attachments/1100965172086046891/1106524466877567016/juiceMaker_Step1_screenshot.png" width="800">

</br>

## 🧨 트러블 슈팅

1️⃣ **과일 종류와 수량을 담는 타입 고민** <br>
-
🔒 **문제점** <br>

과일 종류와 수량을 담는 방법에는 여러가지가 있었고 각각 장단점이 있었습니다.

1. **Nested Type - tuple 이용**
    ```swift 
    enum FruitType {
        (중략)
        case mangoKiwiJuice

        struct Recipe {
            let firstIngredient: (FruitType, Int), secondIngredient: (FruitType, Int)?
        }

        var recipe: Recipe {
            (중략)
            case .mangoJuice:
                return Recipe(firstIngredient: (.mango, 3), secondIngredient: nil)
            case .mangoKiwiJuice:
                return Recipe(firstIngredient: (.mango, 2), secondIngredient: (.kiwi, 1))
            }
        }
    }
    ```
  - switch문에서 구문을 위한 Recipe의 프로퍼티 이름이 길어져 가독성이 떨어졌습니다.
  - `secondIngredient` 값이 `nil`일 경우, 다른 곳에서 `FruitType.recipe` 프로퍼티를 사용할 때 마다 `nil`을 처리해줘야했습니다.
2. **Dictionary Type**
  - `key`인 `fruit`를 통하여 바로 `value`값인 과일의 수량을 빠르게 찾을 수 있었으나, 딕셔너리 타입은 **옵셔널 바인딩 처리**를 해줘야했습니다.
  *\*Dictionary는 hashTable 프로토콜을 준수하여 시간 복잡도가 O(1)에 가깝습니다.*

3. **Nested Type - 타입을 갖는 배열 이용**
    ```swift
       struct Recipe {
            let fruit: FruitType
            var amount: Int
       }

        var recipe: [Recipe] {
            (중략)
            case .mangoJuice:
                return Recipe(fruit: .mango, amount: 3),
            case .mangoKiwiJuice:
                return Recipe(fruit: .mango, amount: 2),
                       Recipe(fruit: .kiwi, amount: 1)
            }
        }
    ```
  - 딕셔너리와 다르게 사용할 때 옵셔널 바인딩 처리를 해주지 않아도 되지만, 딕셔너리 타입과 같이 바로 key값으로 과일의 수량을 꺼낼 수 없어 [Recipe] 배열을 순회하여 찾아야했습니다. 이는 **딕셔너리 타입보다 시간 복잡도가 늘어난다**는 단점이 있었습니다.

4. **enum의 inventoryIndex 프로퍼티를 배열의 index로 활용**
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
  - 배열에서 특정 값을 찾기 위하여 반복문을 돌 때 시간 복잡도가 늘어나는 것을 막기위하여, Fruit enum 타입의 `inventoryIndex`를 배열의 index로 활용하였습니다. 하지만 이는 시간 복잡도를 줄여주는 반면, `fruitInventory[fruit.inventoryIndex]`와 같이 사용할 때 이 변수가 무엇을 가리키고 있는지 바로 알기 어려웠습니다. 

🔑 **해결방법** <br>
  - 위처럼 여러가지 방법이 있기 때문에, 어떤 것을 활용할 지는 "목적"에 따라 달라질 수 있었습니다.
  - **시간 복잡도를 줄이는 것**이 목적인지, **코드의 가독성을 높이는 것**이 목적인지 (혹은 옵셔널 바인딩을 최대한 줄이려고 한다던가)를 추후에 정하여 그 목적에 맞게 방법을 선택하기로 하였습니다.

   
<br>

2️⃣ **에러처리 위치** <br>
-
🔒 **문제점** <br>


- 처음에는 에러처리를 `Model`에서 해야하는지 `ViewControler`에서 해야하는지 고민했습니다. `blendFruitJuice`메서드에서 에러를 던져 ViewControler에서 받아 처리를 했었지만, 에러를 처리하는 로직은 Model쪽에 위치해야 한다고 판단했기 때문에 `JuiceMaker`타입 안에서 에러를 처리했습니다.

    ```swift
    class ViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            order(menu: .strawberryJuice)
        }

        func order(menu: Juice) {
            let juiceMaker = JuiceMaker()
            do { juiceMaker.blendFruitJuice(menu: menu)
                try
            } catch JuiceMakerError.outOfFruitStock {
                print(JuiceMakerError.outOfFruitStock)
            } catch {
                print(JuiceMakerError.unknownError)
            }
        }
    }
    ```

🔑 **해결방법** <br>

- `Model`쪽에서 에러를 처리할 때도 제일 마지막 단에서 에러를 모아 처리하는 것이 로직적으로 에러를 한번에 처리할 수 있다고 판단했기 때문에 `blendFruitJuic`메서드 자체에서 에러를 처리했습니다. 

    ```swift
    struct JuiceMaker {
        private let fruitStore: FruitStore = FruitStore(initialStock: 20)

        func blendFruitJuice(menu fruitJuice: Juice) {
            do {
                try requestFruitStock(menu: fruitJuice)
                receiveFruitStock(menu: fruitJuice)
                print("주문하신 \(fruitJuice)가 나왔습니다.")
            } catch JuiceMakerError.outOfFruitStock {
                print(JuiceMakerError.outOfFruitStock)
            } catch {
                print(JuiceMakerError.unknownError)
            }
        }
    }
    ```
<br>

3️⃣ **if, guard를 언제 써야하는지** <br>
-
🔒 **문제점** <br>

- `if`와 `guard`중에서 조기탈출을 해줄 수 있고, 가독성 측면에서 좋다고 알고있던 `guard`를 우선적으로 사용했는데 항상 `guard`만을 사용하니 언제 `if`를 사용해야하나 고민했습니다.

    ```swift
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        var isEnoughStock: Bool = Bool()
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.hasEnoughStock(fruit: $0.key, amount: $0.value)
        }
        guard isEnoughStock else {
            
        }
    }
    ```

🔑 **해결방법** <br>

- 로직의 마지막 부분에 오는 분기 처리에서 `guard`를 사용하면 `guard`의 조기탈출 특징을 살릴 수 없었고, 로직적으로 어색했기 때문에 로직의 가독성을 명확하게 하기 위해 `if`를 사용했습니다.
    ```swift
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
<br>

## 📚 참고 링크

- [🍎Apple Docs: foreach](https://developer.apple.com/documentation/swift/array/foreach(_:))
- [🍎Apple Docs: Nested Type](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [🍎Apple Docs: Error](https://developer.apple.com/documentation/swift/error)
- [🍎Apple Docs: Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
<br>

## 👥 팀 회고
### 칭찬할 부분
- 스크럼 시간 잘 지키기
- 서로의 의견을 자유롭게 나눌뿐 아니라 서로 경청하여 더 나은 결과를 함께 고민하기

### 개선해야할 부분
- 객체 설계 및 기능 분리를 명확하게 설계하고 코드를 작성하기
- 이유있는 코드를 작성하기위해 코드를 작성하기 전에 항상 고민하기

