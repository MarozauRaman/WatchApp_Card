//
//  ExtractionInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "ExtractionInterfaceController.h"
#import "TransactionTableRowController.h"
#import "Card.h"


@interface ExtractionInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *forWeekLabel;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *noDataLabel;
@property (nonatomic) Statement *statement;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;


@end

@implementation ExtractionInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.

  
    
    NSArray *statements=[[Statement alloc]statementsForWeek:context];
    if(statements.count!=0){
        [_noDataLabel setHidden:true];
    [self.table setNumberOfRows:statements.count withRowType:@"TransactionTableRowController"];
    for(int i=0;i<statements.count;){
    for (NSDictionary *statemen in statements) {
    _statement = [[Statement alloc]initWithDict:statemen];
    TransactionTableRowController* row = [self.table rowControllerAtIndex:i];
        [row.date setText:_statement.date];
        [row.money setText:[_statement.amount stringByAppendingString:@" BYN"]];
        if([[_statement.amount substringToIndex:1] isEqualToString:@"-"]){
            [row.money setTextColor:[UIColor colorWithRed:0.96 green:0.74 blue:0.42 alpha:1.0]];
        } else {
            [row.money setTextColor:[UIColor colorWithRed:0.55 green:0.81 blue:0.39 alpha:1.0]];
        }
        [row.text setText:_statement.desc];
        i++;
    }
    }
      }else{
        [_forWeekLabel setHidden:true];
        [_noDataLabel setText:@"Не было операций за прошлую неделю"];
    }

   
        
   
    
    
     
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}



@end



