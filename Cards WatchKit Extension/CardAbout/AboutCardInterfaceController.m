//
//  AboutCardInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "AboutCardInterfaceController.h"
#import "InfoTableRowController.h"
#import "SecondScreenInterfaceController.h"
#import "Card.h"

@interface AboutCardInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;
@property (nonatomic) Card *card;
@end

@implementation AboutCardInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.

    
   _card = [[Card alloc]init];
    _card=context;
    [self.table setNumberOfRows:4 withRowType:@"InfoTableRowController"];
    for(int i=0;i<4;i++){
            InfoTableRowController* row = [self.table rowControllerAtIndex:i];
            switch (i) {
                case 0:{
                    [row.labell setText:@"Название"];
                    [row.data setText:_card.name];
                    break;
                }
                case 1:{
                    [row.labell setText:@"Номер"];
                    [row.data setText:_card.number];
                    break;
                }
                    
                case 2:{
                    [row.labell setText:@"IBAN"];
                    [row.data setText:@"IBAN Number"];
                    break;
                }
                case 3:{
                    [row.labell setText:@"Срок действия карты"];
                    [row.data setText:_card.term];
                }
                default:{
                    break;
                }
                    
            }

        
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
-(void)configureTableWithData{
    
 
}

@end



