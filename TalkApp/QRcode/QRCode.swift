//
//  QRCode.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/26.
//

import CoreImage
import UIKit

// QRコード作成ページ

class QRCode {
    static func makeQRImage(_ input: String) -> UIImage {
        let inputData = input.data(using: .utf8)!
        
        let qrFilter = CIFilter(name: "CIQRCodeGenerator",
                                parameters: ["inputMessage": inputData,
                                             "inputCorrectionLevel": "Q"])
        let ciImage = qrFilter!.outputImage!
        
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCiImage = ciImage.transformed(by: sizeTransform)
        
        let context = CIContext()
        let qrCgImage = context.createCGImage(scaledCiImage, from: scaledCiImage.extent)!
        return UIImage(cgImage: qrCgImage)
    }
}
