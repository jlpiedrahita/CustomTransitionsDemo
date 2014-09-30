CustomTransitionsDemo
=====================

Sample project demonstrating a custom date picker controller (a not so uncommon requirement) implemented with custom view controller transitions. If you're not presenting your custom sheets/alerts/modals/pickers/popups using this API, you're doing it **wrong**.

Includes 3 custom transition animators:

1. Spring transition animator: animates the presentation using UIView <a href="https://developer.apple.com/library/IOs/documentation/UIKit/Reference/UIView_Class/index.html#//apple_ref/occ/clm/UIView/animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:">spring animations</a>
2. Zoom transition animator: simple scale transform animation
3. Drop transition animator: simulates a falling object using UIKit Dynamics

Screenshots
------
<img src="http://i.imgur.com/5LnJTKL.png">
&nbsp;
<img src="http://i.imgur.com/mkf9xqV.png">

Requirements
------
* XCode 6
* iOS 8
