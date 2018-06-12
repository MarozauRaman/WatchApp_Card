//
//  InfoTableRowController.h
//  Cards WatchKit Extension
//
//  Created by Practice on 12.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface InfoTableRowController : NSObject
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *title;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *data;

@end
