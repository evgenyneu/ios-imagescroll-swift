import UIKit

let imageScrollLargeImageName = "wallabi.jpg"
let imageScrollSmallImageName = "wallabi_small.jpg"

class ViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var imageSizeToggleButton: UIButton!

  @IBOutlet weak var imageConstraintTop: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintRight: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintLeft: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintBottom: NSLayoutConstraint!

  var lastZoomScale: CGFloat = -1

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    imageView.image = UIImage(named: imageScrollLargeImageName)
    scrollView.delegate = self
    updateZoom()
  }
  
  // Update zoom scale and constraints with animation.
  @available(iOS 8.0, *)
  override func viewWillTransition(to size: CGSize,
    with coordinator: UIViewControllerTransitionCoordinator) {
      
    super.viewWillTransition(to: size, with: coordinator)
      
    coordinator.animate(alongsideTransition: { [weak self] _ in
      self?.updateZoom()
    }, completion: nil)
  }

  //
  // Update zoom scale and constraints with animation on iOS 7.
  //
  // DEPRECATION NOTICE:
  //
  // This method is deprecated in iOS 8.0 and it is here just for iOS 7.
  // You can safely remove this method if you are not supporting iOS 7.
  // Or if you do support iOS 7 you can leave it here as it will be ignored by the newer iOS versions.
  //
  override func willAnimateRotation(
    to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {

    super.willAnimateRotation(to: toInterfaceOrientation, duration: duration)
    updateZoom()
  }

  func updateConstraints() {
    if let image = imageView.image {
      let imageWidth = image.size.width
      let imageHeight = image.size.height

      let viewWidth = scrollView.bounds.size.width
      let viewHeight = scrollView.bounds.size.height

      // center image if it is smaller than the scroll view
      var hPadding = (viewWidth - scrollView.zoomScale * imageWidth) / 2
      if hPadding < 0 { hPadding = 0 }

      var vPadding = (viewHeight - scrollView.zoomScale * imageHeight) / 2
      if vPadding < 0 { vPadding = 0 }

      imageConstraintLeft.constant = hPadding
      imageConstraintRight.constant = hPadding

      imageConstraintTop.constant = vPadding
      imageConstraintBottom.constant = vPadding

      view.layoutIfNeeded()
    }
  }

  // Zoom to show as much image as possible unless image is smaller than the scroll view
  fileprivate func updateZoom() {
    if let image = imageView.image {
      var minZoom = min(scrollView.bounds.size.width / image.size.width,
        scrollView.bounds.size.height / image.size.height)

      if minZoom > 1 { minZoom = 1 }

      scrollView.minimumZoomScale = 0.3 * minZoom

      // Force scrollViewDidZoom fire if zoom did not change
      if minZoom == lastZoomScale { minZoom += 0.000001 }

      scrollView.zoomScale = minZoom
      lastZoomScale = minZoom
    }
  }

  @IBAction func onImageSizeToggleButtonTapped(_ sender: AnyObject) {
    imageSizeToggleButton.isSelected = !imageSizeToggleButton.isSelected
    imageSizeToggleButton.invalidateIntrinsicContentSize()

    let fileName = imageSizeToggleButton.isSelected ?
      imageScrollSmallImageName : imageScrollLargeImageName

    imageView.image = UIImage(named: fileName)
    updateZoom()
  }
  
  // UIScrollViewDelegate
  // -----------------------

  func scrollViewDidZoom(_ scrollView: UIScrollView) {
    updateConstraints()
  }

  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }

}

