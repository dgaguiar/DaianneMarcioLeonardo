//
//  String+.swift
//  ComprasUSA
//
//  Created by Daianne Aguiar on 25/09/22.
//

import UIKit

extension String {
    func convertBase64StringToImage() -> UIImage {
        let imageData = Data(base64Encoded: self) ?? Data()
        let image = (UIImage(data: imageData) ?? UIImage(named: "playstore")) ?? UIImage()
        return image
    }
}
