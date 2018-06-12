//
//  CardRowController.h
//  Cards WatchKit Extension
//
//  Created by Practice on 12.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//
#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

@interface CardRowController : NSObject
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *imag;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *title;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *number;
@end
