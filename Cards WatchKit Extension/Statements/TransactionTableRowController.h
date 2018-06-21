//
//  TransactionTableRowController.h
//  Cards WatchKit Extension
//
//  Created by Practice on 12.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface TransactionTableRowController : NSObject

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel* money;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel* text;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel* date;

@end
