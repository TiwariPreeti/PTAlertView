//
//  PTAlertClass.h
//  PTAlertView
//
//  Created by Asia Webnet MAC 1 on 13/11/17.
//  Copyright © 2017 Preeti Tiwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^AlertCompletionBlock) (NSInteger index, NSString *buttonTitle);

@interface PTAlertClass : NSObject


+(instancetype)sharedManager;

-(void)presentAlertWithTitle:(NSString*)title
                     message:(NSString*)message
         andButtonsWithTitle:(NSArray*)buttonTitles
                onController:(UIViewController*)controller
               dismissedWith:(AlertCompletionBlock)completionBlock;
-(void)displayInformativeAlertwithTitle:(NSString *)title andMessage:(NSString*)message onController:(UIViewController*)controller;


@end
