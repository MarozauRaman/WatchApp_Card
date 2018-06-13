//
//  InterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "InterfaceController.h"
#import "CardTableRowController.h"




@interface InterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *card;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Bank"];
    
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
    NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cards" ofType:@"plist"]];

    NSLog(@"%@", plist);
    //number of rows
    int num = [plist count];
    NSLog(@"%d", num);
    [self.card setNumberOfRows:num withRowType:@"CardTableRowController"];
    NSInteger rowCount = self.card.numberOfRows;

//    NSInteger i = 0;
//    
//    
//    for (id key in plist){
//        for(i=0;i<rowCount;i++){
//            CardTableRowController* row = [self.card rowControllerAtIndex:i];
//            for(NSString* o in titles){
//                [row.labell setText:o];
//                NSLog(@"%@", o);
//            }
//        }
//    }
    
    
    NSLog(@"%i", self.card.numberOfRows);
}

@end



