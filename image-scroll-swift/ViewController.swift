//
//  ViewController.swift
//  image-scroll-swift
//
//  Created by Evgenii Neumerzhitckii on 4/10/2014.
//  Copyright (c) 2014 Evgenii Neumerzhitckii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!

  @IBOutlet weak var imageConstraintTop: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintRight: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintLeft: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintBottom: NSLayoutConstraint!

  var lastZoomScale: CGFloat = 1

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
  }

}

