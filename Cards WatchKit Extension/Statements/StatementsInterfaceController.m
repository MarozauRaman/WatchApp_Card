//
//  ExtractionInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "StatementsInterfaceController.h"
#import "TransactionTableRowController.h"
#import "Card.h"



@interface StatementsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel* forWeekLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel* noDataLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable* table;

@end

@implementation StatementsInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.

    Card* currentCard=(Card*)context;
   
    if(currentCard.statement.count!=0){
        [_noDataLabel setHidden:true];
        [self.table setNumberOfRows:currentCard.statement.count withRowType:@"TransactionTableRowController"];
        for(int i=0;i<currentCard.statement.count;i++){
            TransactionTableRowController* row = [self.table rowControllerAtIndex:i];
            Statement* statement = [currentCard.statement objectAtIndex:i];
            [row.text setText:statement.desc];
            [row.date setText:statement.date];
            [row.money setText:[statement.amount stringByAppendingString:@" BYN"]];
            
            if([statement.amount intValue] < 0){
                [row.money setTextColor:[UIColor colorWithRed:0.96 green:0.74 blue:0.42 alpha:1.0]];
            } else {
                [row.money setTextColor:[UIColor colorWithRed:0.55 green:0.81 blue:0.39 alpha:1.0]];
            }
            
        }
    }else{
        [_forWeekLabel setHidden:true];
        [_noDataLabel setText:@"Не было операций за прошлую неделю"];
        
    }

}



@end



