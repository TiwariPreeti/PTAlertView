//
//  ViewController.m
//  PAlertView
//
//  Created by Asia Webnet MAC 1 on 13/11/17.
//  Copyright © 2017 Preeti Tiwari. All rights reserved.
//

#import "ViewController.h"
#import "PTAlertClass.h"

@interface ViewController ()<UIAlertViewDelegate>
- (IBAction)buttonActionMultipleAlertOption:(UIButton *)sender;
- (IBAction)buttonActionSingleAlertOption:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonActionMultipleAlertOption:(UIButton *)sender {
    //Multiple Option
    [[PTAlertClass sharedManager] presentAlertWithTitle:@"Alert!!" message:@"Do you want to use this app?" andButtonsWithTitle:@[@"YES",@"NO"] onController:self dismissedWith:^(NSInteger index, NSString *buttonTitle) {
        [self.view endEditing:YES];
        if (index == 0) {
        }
        else if (index == 1){
        }
    }];
}

- (IBAction)buttonActionSingleAlertOption:(UIButton *)sender {
    //Single Option
    [[PTAlertClass sharedManager] displayInformativeAlertwithTitle:@"" andMessage:@"Write your alert message here" onController:self];
}
@end
