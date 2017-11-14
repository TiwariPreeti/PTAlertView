# PTAlertView
============

PTAlertView is a Customizable AlertView, written in Objective C 

### Manually

Clone or Download this Repo. Then simply drag the folder ```AlertView``` to your Xcode project

## Adding PTAlertView

Start by adding the following to your desired View Controller:

```Objective-C
#import "PTAlertClass.h"
```

### Presenting an PTAlertView

```Objective-C
## For multiple option

    [[PTAlertClass sharedManager] presentAlertWithTitle:@"Alert!!" message:@"Do you want to use this app?" andButtonsWithTitle:@[@"YES",@"NO"] onController:self dismissedWith:^(NSInteger index, NSString *buttonTitle) {
        [self.view endEditing:YES];
        if (index == 0) {
        }
        else if (index == 1){
        }
    }];
    
##For single option
[[PTAlertClass sharedManager] displayInformativeAlertwithTitle:@"" andMessage:@"Write your alert message here" onController:self];
```
About PTAlertView
-----------------

PTAlertView is a customizable and beautifully designed AlertView. I designed this because I've always wanted to have access to change the different attributes of the default UIAlertView at one place. 

All improvements and suggestions are welcome.

Cheers 🍻

### Author

Created and designed by [Preeti Tiwari].

