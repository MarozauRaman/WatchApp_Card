//
//  AboutCardInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "AboutCardInterfaceController.h"
#import "InfoTableRowController.h"
#import "CardDetailInterfaceController.h"
#import "Card.h"

@interface AboutCardInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable* table;

@end

@implementation AboutCardInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.

    Card* currentCard=(Card*) context;
    
    [self.table setNumberOfRows:4 withRowType:@"InfoTableRowController"];
    for(int i=0;i<4;i++){
            InfoTableRowController* row = [self.table rowControllerAtIndex:i];
            switch (i) {
                case 0:{
                    [row.label setText:@"Название"];
                    [row.data setText:currentCard.name];
                    break;
                }
                case 1:{
                    [row.label setText:@"Номер"];
                    [row.data setText:currentCard.number];
                    break;
                }
                    
                case 2:{
                    [row.label setText:@"IBAN"];
                    [row.data setText:@"IBAN Number"];
                    break;
                }
                case 3:{
                    [row.label setText:@"Срок действия карты"];
                    [row.data setText:currentCard.term];
                }
                default:{
                    break;
                }
                    
            }

        
    }
    
}



@end



