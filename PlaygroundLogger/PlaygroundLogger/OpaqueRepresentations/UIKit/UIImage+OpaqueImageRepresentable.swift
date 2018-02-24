//===--- UIImage+OpaqueImageRepresentable.swift ---------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2017-2018 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

#if os(iOS) || os(tvOS)
    import UIKit
    
    extension UIImage: OpaqueImageRepresentable {
        func encodeImage(into encoder: LogEncoder, withFormat format: LogEncoder.Format) {
            guard let pngData = UIImagePNGRepresentation(self) else {
                loggingError("Failed to convert an image to a PNG")
            }

            encoder.encode(number: UInt64(pngData.count))
            encoder.encode(data: pngData)
        }
    }
#endif
