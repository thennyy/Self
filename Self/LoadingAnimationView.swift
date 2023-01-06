//
//  LoadingAnimationView.swift
//  SeekSupport
//
//  Created by Thenny Chhorn on 7/10/20.
//  Copyright © 2020 Thenny Chhorn. All rights reserved.
//

import UIKit

var vSpinner: UIView?

extension UIViewController {
    
    func showSpinner(onView: UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

