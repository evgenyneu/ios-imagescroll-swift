# Image in a scroll view with auto layout in iOS

This is a iOS demo app that shows how to use an image in a scroll view with auto layout. It is written in Swift. Image can be panned and zoomed. It is centered and zoomed out initially. Adapts to device orientation change with animation.

Tested in iOS 7, 8 and 9.

<img src='https://raw.githubusercontent.com/evgenyneu/ios-imagescroll-swift/master/graphics/image_scroll.png' width='556' alt='Using image inside a scroll view with auto layout in iOS 7'>

## Things to note

* The job is done with auto layout constraints only.
* On each zoom we update the `constant` values for the constraints to center the image if needed.
* Feel free to contact me if you are stuck (like I was).

## How to copy this control to your project

* In your storyboard 'Use Auto Layout' setting must enabled.
* Copy [ViewController.swift](https://github.com/evgenyneu/ios-imagescroll-swift/blob/master/image-scroll-swift/ViewController.swift) file into your project.
* Copy the View Controller into your storyboard, like this:

<img src='https://raw.githubusercontent.com/evgenyneu/ios-imagescroll-swift/master/graphics/copy_image_scroll_view_controller.png' width='357' alt='Copy Image View Controller'>


## Troubleshooting

Here are things to check if something goes wrong.

* Your view controller's class is ViewController in Identity Inspector.
* Storyboard has all the controls: View, ScrollView and ImageView along with all their constraints.
* To enable zooming ScrollView's 'max zoom' should be greater than 1 (Attributes Inspector). I used 3 in this demo.
* ImageView, ScrollView, four layout constraints and 'change image' button should be linked to their outlets in `ViewController.swift`.
* If you have a navigation bar clear the **Adjust Scroll View Insets** checkbox in the *Attribute Inspector* of your view controller.

<img src='https://raw.githubusercontent.com/evgenyneu/ios-imagescroll-swift/master/graphics/adjust_table_view_insets.png' width='463' alt='Clear "Adjust Scroll View Insets" in your View Controller.'>

* Set the *Intrinsic size* property to *Placeholder* in the *Size inspector* of the image view.

<img src='https://raw.githubusercontent.com/evgenyneu/ios-imagescroll-swift/master/graphics/intrinsic_size_placeholder_image_view.png' width='423' alt='Set the intrinsic size to placeholder for the image view.'>


### Image constraint item order

For each of the four auto layout constraints between the image and the scroll view: **first item must be image** (and not superview).

<img src='https://raw.githubusercontent.com/evgenyneu/ios-imagescroll-swift/master/graphics/image_constraint.png' width='402' alt='image constraint item order'>


## Objective-C version

This repository replaces previous [objective-c version](https://github.com/evgenyneu/ios-imagescroll).

## Thanks

* [William Warby](https://www.flickr.com/photos/wwarby) for making the wallaby photo. http://www.flickr.com/photos/wwarby

* [cojoj](https://github.com/cojoj) for fixing [layout bug](https://github.com/evgenyneu/ios-imagescroll/issues/5) in iOS 8.
