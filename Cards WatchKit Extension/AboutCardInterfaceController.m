//
//  AboutCardInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "AboutCardInterfaceController.h"

@interface AboutCardInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *cardAbout;



@end

@implementation AboutCardInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"О карте"];
    [self configureTableWithData];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
-(void)configureTableWithData{
    NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"/Users/practice/Projects/Cards/Cards WatchKit App/Cards" ofType:@"plist"]];
    [_cardAbout setRowTypes:plist];
    int num = sizeof(plist);
    [self.cardAbout setNumberOfRows:num withRowType:@"InfoTableRowController"];
    NSLog(@"Last");
    
    NSLog(@"%i", self.cardAbout.numberOfRows);
}

@end



