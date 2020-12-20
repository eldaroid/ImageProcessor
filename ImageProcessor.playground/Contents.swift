import UIKit

let image = UIImage(named: "switzerland.jpg")!
var myRGBA = RGBAImage(image: image)!

//This part of the code is responsible for calculating the average values of Red Green and Blue, which we later use for changes.

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

 //The next part of the code is responsible for changing the color settings of the photo.

for y in 0..<myRGBA.height{
    for x in 0..<myRGBA.width{
        let index = y * myRGBA.width + x
        var pixel = myRGBA.pixels[index]
        let redDiff = Int(pixel.red) - avgRed
        if (redDiff > 0)
        {
            pixel.red = UInt8( max(0,min(255,avgRed+redDiff * 5 ) ) )
            myRGBA.pixels[index] = pixel
        }
    }
}

let newImage2 = myRGBA.toUIImage()
        
newImage2
