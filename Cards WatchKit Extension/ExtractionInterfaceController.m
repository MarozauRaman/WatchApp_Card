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
#import "Statement.h"

@interface ExtractionInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *forWeekLabel;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *noDataLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceTable *extractionCard;
@property (nonatomic) Statement *statement;


@end

@implementation ExtractionInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Выписка"];
    
    int counter = 0;
    for (NSDictionary *statemen in context) {
    _statement = [[Statement alloc]initWithDict:statemen];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd.MM.yyyy"];
    NSDate *datee = [dateFormat dateFromString:_statement.date];
    if([datee timeIntervalSinceNow] > -806400){
        counter++;
    }
    }

    [self.extractionCard setNumberOfRows:counter withRowType:@"TransactionTableRowController"];
   
        
    if(counter!=0){
         [_noDataLabel setHidden:true];
        for(int i=0;i<counter;){
    for (NSDictionary *statemen in context) {
        _statement = [[Statement alloc]initWithDict:statemen];
       
        TransactionTableRowController* row = [self.extractionCard rowControllerAtIndex:i];
        
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd.MM.yyyy"];
        NSDate *datee = [dateFormat dateFromString:_statement.date];
        if([datee timeIntervalSinceNow] > -806400){
            [row.date setText:_statement.date];
            [row.money setText:[_statement.amount stringByAppendingString:@" BYN"]];
            if([[_statement.amount substringToIndex:1] isEqualToString:@"-"]){
                [row.money setTextColor:[UIColor colorWithRed:0.96 green:0.74 blue:0.42 alpha:1.0]];
            } else {
                [row.money setTextColor:[UIColor colorWithRed:0.55 green:0.81 blue:0.39 alpha:1.0]];
            }
            [row.text setText:_statement.desc];
        }
        
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



