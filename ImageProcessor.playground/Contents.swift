import UIKit

let image = UIImage(named: "switzerland.jpg")!

// Process the image!
var myRGBA = RGBAImage(image: image)!

var totalRed = 0
var totalGreen = 0
var totalBlue = 0

for y in 0..<myRGBA.height{
    for x in 0..<myRGBA.width{
        let index = y * myRGBA.width + x
        var pixel = myRGBA.pixels[index]
        totalRed += Int(pixel.red)
        totalGreen += Int(pixel.green)
        totalBlue += Int(pixel.blue)
    }

}

let count = myRGBA.height * myRGBA.width
let avgRed = totalRed/count
let avgGreen = totalGreen/count
let avgBlue = totalBlue/count

//let avgRed = 68
//let avgGreen = 81
//let avgBlue = 82
//
//for y in 0..<myRGBA.height{
//    for x in 0..<myRGBA.width{
//        let index = y * myRGBA.width + x
//        var pixel = myRGBA.pixels[index]
//        let redDiff = Int(pixel.red) - avgRed
//        if (redDiff > 0)
//        {
//            pixel.red = UInt8( max(0,min(255,avgRed+redDiff * 5 ) ) )
//            myRGBA.pixels[index] = pixel
//        }
//    }
//}
//
//let newImage2 = myRGBA.toUIImage()
        












//let x = 100
//let y = 100
//
//let index = y * myRGBA.width + x
//
//var pixel = myRGBA.pixels[index]
//
//pixel.blue = 0
//pixel.red = 0
//pixel.green = 255
//
//myRGBA.pixels[index] = pixel
//
//let newImage = myRGBA.toUIImage()
//newImage
