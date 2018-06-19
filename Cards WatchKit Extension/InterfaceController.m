//
//  InterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "InterfaceController.h"
#import "CardTableRowController.h"
#import "SecondScreenInterfaceController.h"
#import "Card.h"


@interface InterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *card;
@property (nonatomic) Card *cardd;
@property NSArray *cards;
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

     _cards = [[Card alloc]allCards];
    //number of rows
    int num = [_cards count];
    [self.card setNumberOfRows:num withRowType:@"CardTableRowController"];
    NSInteger rowCount = self.card.numberOfRows;
    for(int i =0;i<rowCount;i++){
      
       _cardd =[[Card alloc]initWithDictionary:[_cards objectAtIndex:i]];
        CardTableRowController* row = [self.card rowControllerAtIndex:i];
        [row.labell setText:_cardd.name];
        [row.image setImageNamed:_cardd.imageName];
        [row.number setText:_cardd.number];
        
    }
   
}

-(void)table:(WKInterfaceTable *)_card didSelectRowAtIndex:(NSInteger)rowIndex{

   [self pushControllerWithName:@"SecondScreenInterfaceController" context:[_cards objectAtIndex:rowIndex]];

}



@end



