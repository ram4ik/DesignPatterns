//
//  Strategy.swift
//  DesignPatterns
//
//  Created by Ramill Ibragimov on 31.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import Foundation
import UIKit

final class Filter {
    var filterStrategy: FilterStrategy?
    
    func applyFilter(to image: UIImage) {
        filterStrategy?.process(image: image)
    }
}

protocol FilterStrategy {
    
    @discardableResult
    func process(image: UIImage) -> UIImage
}

final class SepiaFilter: FilterStrategy {
    func process(image: UIImage) -> UIImage {
        print("Apply SEPIA filter to image")
        return image
    }
}

final class BWFilter: FilterStrategy {
    func process(image: UIImage) -> UIImage {
        print("Apply BW filter to image")
        return image
    }
}

final class DistortionFilter: FilterStrategy {
    func process(image: UIImage) -> UIImage {
        print("Apply DISTORTION filter to image")
        return image
    }
}

class StrategyExecutor {
    
    func execute() {
        
        let filter = Filter()
        let image = UIImage()
        
        filter.filterStrategy = SepiaFilter()
        filter.applyFilter(to: image)
        
        filter.filterStrategy = BWFilter()
        filter.applyFilter(to: image)
        
        filter.filterStrategy = DistortionFilter()
        filter.applyFilter(to: image)
    }
}
