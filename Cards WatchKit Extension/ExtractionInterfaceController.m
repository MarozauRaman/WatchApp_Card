//
//  ExtractionInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "ExtractionInterfaceController.h"

@interface ExtractionInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *forWeekLabel;

@property (weak, nonatomic) IBOutlet WKInterfaceTable *extractionCard;

@end

@implementation ExtractionInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Выписка"];
    
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
    NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CardsExtractions" ofType:@"plist"]];
    int num = [plist count];
    [self.extractionCard setNumberOfRows:num withRowType:@"TransactionTableRowController"];
    
    NSLog(@"Last");
    NSLog(@"%i", self.extractionCard.numberOfRows);
}

@end



