import UIKit

//var greeting = "Hello, playground"
//
//func plusMinus(arr: [Int]) -> Void {
//    // Write your code here
//    var positiveNumber: Int = 0
//    var negativeNumber: Int = 0
//    var zero: Int = 0
//    let positiveRatio: Double
//    let negativeRatio: Double
//    let zeroRatio: Double
//    for i in arr {
//        if i > 0 {
//            positiveNumber = positiveNumber + 1
//        } else if i < 0 {
//            negativeNumber = negativeNumber + 1
//        } else  {
//            zero = zero + 1
//        }
//    }
//    
//    let arrCount: Double = Double (arr.count)
//    positiveRatio = Double(positiveNumber) / arrCount
//    negativeRatio = Double(negativeNumber) / arrCount
//    zeroRatio = Double(zero) / arrCount
//    print(positiveRatio.truncate(places: 6), negativeRatio.truncate(places: 6), zeroRatio.truncate(places: 6))
//    
//    
//}
//extension Double {
//    func truncate(places : Int)-> Double {
//        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
//    }
//}
//
//plusMinus(arr: [1, 1 ,4, 0, -1, -1, -3])


func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here
    
    var arr2 : [Int] = []
    var temp: Int
    var isAllElementSame: Bool = false
    
    
    var sum: Int = 0
    for i in 0...arr.count {
            if (i < 4 && arr[i] == arr[i+1] ) {
                isAllElementSame = true
            }
    }
    
    if(!isAllElementSame) {
        for i in 0...arr.count-1 {
            for j in 0...arr .count-1{
                if (arr[i] != arr[j]) {
                    sum = sum + arr[j]
                    
                }
            }
            arr2.append(sum)
            sum = 0
            
        }
        for i in 0...arr2.count-1 {
            for j in 0...arr2 .count-1{
                if (arr2[i] < arr2[j]) {
                    temp = arr2[i]
                    arr2[i] = arr2[j]
                    arr2[j] = temp
                }
            }
        }
        print(arr2[0], arr2[4])
    } else {
        
        for i in 0...arr.count-1 {
            for j in 0...arr .count-1{
                if (i != j) {
                    sum = sum + arr[j]
                    
                }
            }
            arr2.append(sum)
            sum = 0
            
        }
        print(arr2)
        print(arr2[0], arr2[4])
    }
}

miniMaxSum(arr: [5,5,5,5,5])
