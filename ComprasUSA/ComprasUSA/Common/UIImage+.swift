//
//  UIImage+.swift
//  ComprasUSA
//
//  Created by Daianne Aguiar on 25/09/22.
//

import UIKit

extension UIImage {
    func convertImageToBase64String () -> String {
        return self.jpegData(compressionQuality: 0.1)?.base64EncodedString() ?? ""
    }
}
