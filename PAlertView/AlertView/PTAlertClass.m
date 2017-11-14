//
//  PTAlertClass.m
//  PTAlertView
//
//  Created by Asia Webnet MAC 1 on 13/11/17.
//  Copyright © 2017 Preeti Tiwari. All rights reserved.
//

#import "PTAlertClass.h"
@interface PTAlertClass () <UIAlertViewDelegate>

@property (nonatomic, strong) AlertCompletionBlock completionBlock;

@end

@implementation PTAlertClass

+ (instancetype)sharedManager {
    
    static PTAlertClass *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}
-(void)displayInformativeAlertwithTitle:(NSString *)title andMessage:(NSString*)message onController:(UIViewController*)controller {
    
    [self presentAlertWithTitle:title message:message andButtonsWithTitle:[NSArray arrayWithObject:@"OK"] onController:controller dismissedWith:^(NSInteger index, NSString *buttonTitle) { }];
}

-(void)presentAlertWithTitle:(NSString*)title
                     message:(NSString*)message
         andButtonsWithTitle:(NSArray*)buttonTitles
                onController:(UIViewController*)controller
               dismissedWith:(AlertCompletionBlock)completionBlock {
    
    id buttonTitle = [buttonTitles firstObject];
    if (!buttonTitle || ![buttonTitle isKindOfClass:[NSString class]]) {
        //        NSLog(@"AlertView ERROR ==> Invalid button title!");
        return;
    }
    
    self.completionBlock = completionBlock;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        //display UIAlertView
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
        
        for (NSInteger index = 0; index < buttonTitles.count; index++)
            [alertView addButtonWithTitle:[buttonTitles objectAtIndex:index]];
        
        [alertView show];
    }
    else
    {
        //display UIAlertController
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        for (NSInteger index = 0; index < buttonTitles.count; index++) {
            
            UIAlertAction * buttonAction = [UIAlertAction actionWithTitle:[buttonTitles objectAtIndex:index] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                //  AlertActionBLock
                self.completionBlock(index, action.title);
                
            }];
            [alertController addAction:buttonAction];
        }
        
        [controller presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark * * * * UIAlertViewDelegate Method * * * *
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    self.completionBlock(buttonIndex, [alertView buttonTitleAtIndex:buttonIndex]);
}

@end
