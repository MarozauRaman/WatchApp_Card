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
    NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CardsExtractions" ofType:@"plist"]];
    int num = [plist count];
    NSMutableArray* arrayWithDictionaries=[[NSMutableArray alloc]init] ;
    int counter = 0;
    for (int i=0;i<num;i++){
        NSDictionary* dict = [plist objectAtIndex:i];
        for (id key in dict){
            NSString* data = [dict objectForKey:key];
            if([data isEqualToString:sourceDict[@"Number"]]){
                counter = counter+1;
            [arrayWithDictionaries addObject:[plist objectAtIndex:i]];
                break;
            }
        }
    }
    [self.extractionCard setNumberOfRows:counter withRowType:@"TransactionTableRowController"];
        
    if(counter!=0){
        [_noDataLabel setHidden:true];
        for (int i =0; i<arrayWithDictionaries.count; i++) {
            TransactionTableRowController* row = [self.extractionCard rowControllerAtIndex:i];
            NSDictionary* dict = [arrayWithDictionaries objectAtIndex:i];
            for(id key in dict){
                 NSString* data = [dict objectForKey:key];
                if([key isEqualToString:@"Money"]){
                    [row.money setText:data];

                }
                if([key isEqualToString:@"Text"]){
                    [row.text setText:data];

                }
                if([key isEqualToString:@"Date"]){
                    [row.date setText:data];

                }
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



