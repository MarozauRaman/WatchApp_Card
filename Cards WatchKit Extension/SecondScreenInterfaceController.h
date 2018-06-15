//
//  SecondScreenInterfaceController.h
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface SecondScreenInterfaceController : WKInterfaceController
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *labelll;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *number;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *balance;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *image;
@end
