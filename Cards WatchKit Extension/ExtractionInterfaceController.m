//
//  ExtractionInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "ExtractionInterfaceController.h"
#import "TransactionTableRowController.h"

@interface ExtractionInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *forWeekLabel;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *noDataLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceTable *extractionCard;

@end

@implementation ExtractionInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Выписка"];
    NSDictionary* sourceDict =(NSDictionary*)context;
    
    NSMutableArray* arrayWithDictionaries=[[NSMutableArray alloc]init] ;
    [arrayWithDictionaries addObjectsFromArray:sourceDict[@"statement"]];
    
    int counter = 0;
    for (int i=0;i<arrayWithDictionaries.count;i++){
        NSDictionary* dict = [arrayWithDictionaries objectAtIndex:i];
        
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd.MM.yyyy"];
        NSDate *datee = [dateFormat dateFromString:dict[@"date"]];
        if([datee timeIntervalSinceNow] > -806400){
            counter = counter+1;
        }
    }
    
    [self.extractionCard setNumberOfRows:counter withRowType:@"TransactionTableRowController"];
    
    if(counter!=0){
        
        
        [_noDataLabel setHidden:true];
        
        for (int i =0; i<counter; i++) {
            TransactionTableRowController* row = [self.extractionCard rowControllerAtIndex:i];
            NSDictionary* dict = [arrayWithDictionaries objectAtIndex:i];
            
            NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
            [dateFormat setDateFormat:@"dd.MM.yyyy"];
            NSDate *datee = [dateFormat dateFromString:dict[@"date"]];
            if([datee timeIntervalSinceNow] > -806400){
                
                [row.date setText:dict[@"date"]];

                [row.money setText:[dict[@"amount"] stringByAppendingString:@" BYN"]];
                if([[dict[@"amount"] substringToIndex:1] isEqualToString:@"-"]){
                    [row.money setTextColor:[UIColor colorWithRed:0.96 green:0.74 blue:0.42 alpha:1.0]];
                } else {
                    [row.money setTextColor:[UIColor colorWithRed:0.55 green:0.81 blue:0.39 alpha:1.0]];
                }
        
                [row.text setText:dict[@"desc"]];
                
            }
            
        }
        
        
    } else{
        [_forWeekLabel setHidden:true];
        [_noDataLabel setText:@"No transactions "];
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



