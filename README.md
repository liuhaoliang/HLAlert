# Introduction
An easy way to use AlertView and ActionSheet in your Object-C or Swift project,this library are based on UIAlertViewController. 

# Usage:
1. add the repo in your podfile
2. use pod 'HLAlert' or drag the library into your project folder
- ### Use Object-C
1. import the header
```
#import <HLAlert/HLAlert-Swift.h>
```

2. write the method
```
[HLAlert showAlertWithTitle:@"title" message:@"message" actionTitles:@[@"action1",@"action2"] handler:^(NSInteger idx) {
        //do something
    }];
```
- ### Use Swift
1. import the header
```
import HLAlert
```
2. write the method
```
HLAlert.showAlert(title: "title", message: "message", actionTitles: ["action1","action2"]) { (idx) in
            // do something
        }
```



