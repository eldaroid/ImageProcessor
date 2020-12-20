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

//let avgRed = 50
//let avgGreen = 50
//let avgBlue = 50

 //The next part of the code is responsible for changing the color settings of the photo.

public class apllied{
    func applyGreen(percentageOfGreen: Int) -> RGBAImage {
         for y in 0..<myRGBA.height{
             for x in 0..<myRGBA.width{
                 let index = y * myRGBA.width + x
                 var pixel = myRGBA.pixels[index]
                 let greenDiff = Int(pixel.green) - avgGreen
                 if (greenDiff > 0)
                 {
                     pixel.green = UInt8( max(0,min(255,avgGreen+greenDiff * (percentageOfGreen/2) ) ) )
                     myRGBA.pixels[index] = pixel
                 }
             }
         }
         return (myRGBA)
     }
    func applyBlue(percentageOfBlue: Int) -> RGBAImage {
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let blueDiff = Int(pixel.blue) - avgBlue
                if (blueDiff > 0)
                {
                    pixel.blue = UInt8( max(0,min(255,avgBlue+blueDiff * (percentageOfBlue/2) ) ) )
                    myRGBA.pixels[index] = pixel
                }
            }
        }
        return (myRGBA)
    }
    func applyRed(percentageOfRed: Int) -> RGBAImage {
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let redDiff = Int(pixel.red) - avgRed
                if (redDiff > 0)
                {
                    pixel.red = UInt8( max(0,min(255,avgRed+redDiff * (percentageOfRed/2) ) ) )
                    myRGBA.pixels[index] = pixel
                }
            }
        }
        return (myRGBA)
    }
    func brightness(percentageOfBright: Int) -> RGBAImage {
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                pixel.red = UInt8(max(1, min(255, Int(pixel.red) + 2 * percentageOfBright)))
                pixel.blue = UInt8(max(1, min(255, Int(pixel.blue) + 2 * percentageOfBright)))
                pixel.green = UInt8(max(1, min(255, Int(pixel.green) + 2 * percentageOfBright)))
                myRGBA.pixels[index] = pixel
            }
        }
        return (myRGBA)
    }
    func defaultFilter() -> RGBAImage {
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                pixel.red = UInt8(avgRed)
                pixel.blue = UInt8(avgBlue)
                pixel.green = UInt8(avgGreen)
            }
        }
        return (myRGBA)
    }
}

class ImageProcessor: apllied {
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
    func apply(method: String, persentageOfApply: Int) -> RGBAImage {
        if (method == "red"){
            let applyR = apllied()
            return(applyR.applyRed(percentageOfRed: persentageOfApply))
        }
        else if (method == "blue")
        {
            let applyB = apllied()
            return(applyB.applyBlue(percentageOfBlue: persentageOfApply))
        }
        else if (method == "green")
        {
            let applyG = apllied()
            return(applyG.applyGreen(percentageOfGreen: persentageOfApply))
        }
        else if (method == "bright"){
            return (apllied().brightness(percentageOfBright: persentageOfApply))
        }
        else {
            return (apllied().defaultFilter())
        }
    }
}

var myImage = ImageProcessor(avgRed: avgRed, avgGreen: avgGreen, avgBlue: avgBlue)

let test = myImage.apply(method: "bright", persentageOfApply: 50).toUIImage()

