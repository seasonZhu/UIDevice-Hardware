# UIDevice-Hardware

## 前言

Swift UIDevice分类 用于判断手机型号等硬件功能

代码参考了OC版本的[UIDeviceIdentifier](https://github.com/squarefrog/UIDeviceIdentifier)


使用UIDevice的分类使得代码逻辑与结构更为简单,另外语言风格更加Swift化

这算是第一次将自己写的东西在pods实战吧,吃了点亏

对public属性不是了解,结果方法都是对模块内的,导致就算import引用了,也无法调用其方法,于是更新了好几次,打了好几次tag.也算是一直搜获吧

## Adding UIDeviceHardware to your project (添加 UIDeviceHardware 到你的项目)

[CocoaPods](http://cocoapods.org) is the recommended way to add `UIDeviceHardware` to your project.

1. Add a pod entry for `UIDeviceHardware` to your Podfile </br>
```
pod 'UIDeviceHardware'
```
2. Install the pod(s) by running </br>
```
pod install
```
3. Include `UIDeviceHardware`once you need it with </br>
```
import UIDeviceHardware
```


## Example
```
if UIDevice.deviceType == UIDevice.Info.iPhone8 {
            print("it is iPhone8")
 }
```


