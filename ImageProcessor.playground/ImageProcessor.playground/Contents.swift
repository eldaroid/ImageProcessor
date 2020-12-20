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

class ImageProcessor {
    var avgRed: Int
    var avgGreen: Int
    var avgBlue: Int
    init(avgRed: Int, avgGreen: Int, avgBlue: Int)
    {
        self.avgBlue = avgBlue
        self.avgRed = avgRed
        self.avgGreen = avgGreen
    }
    
    // добавляем красный
    func applyRed() -> RGBAImage {
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
        return (myRGBA)
    }
    // добавляем синий
    func applyBlue() -> RGBAImage {
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let blueDiff = Int(pixel.blue) - avgBlue
                if (blueDiff > 0)
                {
                    pixel.blue = UInt8( max(0,min(255,avgBlue+blueDiff * 5 ) ) )
                    myRGBA.pixels[index] = pixel
                }
            }
        }
        return (myRGBA)
    }
    // добавляем зеленый
    func applyGreen() -> RGBAImage {
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let greenDiff = Int(pixel.green) - avgGreen
                if (greenDiff > 0)
                {
                    pixel.green = UInt8( max(0,min(255,avgGreen+greenDiff * 5 ) ) )
                    myRGBA.pixels[index] = pixel
                }
            }
        }
        return (myRGBA)
    }
}

var myImage = ImageProcessor(avgRed: avgRed, avgGreen: avgGreen, avgBlue: avgBlue)

let newImage = myImage.applyBlue().toUIImage()

newImage

//let newImage2 = myRGBA.toUIImage()
        

