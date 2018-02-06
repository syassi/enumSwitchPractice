//: Playground - noun: a place where people can play

import UIKit

//enum 復習

enum BloodType:Int {
    case ab
    case a
    case b
    case o
}

enum BloodTypeStr:String {
    case ab
    case a
    case b
    case o
}

let typeAB = BloodType.ab
typeAB.rawValue
//型を宣言すると省略できる。
let typeO:BloodType = .o
typeO.rawValue

let typeABStr = BloodTypeStr.ab
typeABStr.rawValue
//型を宣言すると省略できる。
let typeOStr:BloodTypeStr = .o
typeOStr.rawValue

enum Signal: Int {
    case blue = 1
    case yellow
    case green
    case red = 5
}

enum Weather: String {
    case sunny = "晴れ"
    case cloudy = "曇り"
    case rain = "雨"
    case snow = "雪"
}

let signalBlue: Signal = .green
signalBlue.rawValue

let sunnyWeather: Weather = .sunny
sunnyWeather.rawValue

//enumをSwitchで使う場合
struct StockTrade {
    
    enum Trade {
        case buy
        case sell
    }
    
    func order(tradeType: Trade, stock: String, amount: Int) {
        switch tradeType {
        case .buy:
            //買い注文
            print("\(stock)株を\(amount)購入する")
        case .sell:
            //売り注文
            print("\(stock)株を\(amount)売却する")
        //defaultが必要なくなる
        }
    }
    
}

enum Fruit {
    case apple
    case banana
    case orange
    case melon
    
    func inJapaneseName() -> String {
        switch self {
        case .apple:
            return "りんご"
        case .banana:
            return "バナナ"
        case .orange:
            return "みかん"
        case .melon:
            return "メロン"
        }
    }
}

let apple = Fruit.apple
apple.inJapaneseName()


//Switch の復習

let num = 5

switch num {
case 1:
    print("1だよ")
    //Javaなどとは違いbreakがなくても処理が下に流れない
case 2, 3:
    //複数caseはコンマ区切りで記述
    print("2か3だよ")
case 4:
    print("4だよ")
case 0:
    //何の処理も必要ない(無視する)場合はbreakを記述する
    break
default: // defaultはその他の処理
    print("全部違ったよ")
}


//Switchでは、範囲指定もできる。

let num2 = 300

var result: String = "numは"
switch num2 {
case 0...99:
    //値1…値2で -> 値1 以上 値2以下 の範囲で絞れる
    print("0以上99以下だよ")
case 100..<200:
    //値1..<値2で -> 値1 以上 値2未満 の範囲で絞れる
    print("100以上200未満だよ")
case let score where score >= 200:
    //Where を使うと値以上という条件もできる
    result += "200以上"
    //Javaとかでbreakで止めないと処理が下に流れていたんだけど、それとは逆で処理を下に流すには fallthrough を書いてあげる必要がある
    fallthrough
default:
    result += "だよ"
}
print(result)

//　タプルを使って、条件を複数の場合

let score = (50, 90) // (数学の点数,英語の点数)

switch score {
case (let mathScore, let engScore) where mathScore >= 80 && engScore >= 80 :
    print("優秀！")
    
// 数学が80点未満、英語が80点以上
case (let mathScore, let engScore) where mathScore < 80 && engScore >= 80 :
    print("数学頑張ろう...")
    print("英語は\(engScore)点！いいね！")
    
// 英語が80点未満、数学が80点以上
case (let mathScore, let engScore) where mathScore >= 80 && engScore < 80 :
    print("英語頑張ろう...")
    print("数学は\(mathScore)点！いいね！")
    
case (let mathScore, let engScore) where mathScore < 80 && engScore < 80:
    print("がんばろ。。")
    
default:
    print("？")
}
