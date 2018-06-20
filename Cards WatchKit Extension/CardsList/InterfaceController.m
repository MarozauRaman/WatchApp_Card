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

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;
@property (strong, nonatomic) NSMutableArray *cards;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.

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

    [self.table setNumberOfRows:[self.cards count] withRowType:@"CardTableRowController"];
    NSLog(@"%@", self.cards);
    for(int i =0;i<[self.cards count];i++){
        Card* card=self.cards[i];
        CardTableRowController* row = [self.table rowControllerAtIndex:i];
        [row.labell setText:card.name];
        
        [row.image setImageNamed:card.imageName];
        [row.number setText:card.number];
        
        
   //
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd.MM.yyyy"];
        NSDate *date = [dateFormat dateFromString:card.term];
    
        if([date timeIntervalSinceNow] < 259200){
            [row.labell setTextColor:[UIColor colorWithRed:0.91 green:0.96 blue:0.40 alpha:1.0]];
        }
        if([date timeIntervalSinceNow] < 0){
            [row.labell setTextColor:[UIColor colorWithRed:1.00 green:0.25 blue:0.21 alpha:1.0]];
        }
        
        
    }
   
}

-(void)table:(WKInterfaceTable *)_card didSelectRowAtIndex:(NSInteger)rowIndex{

   [self pushControllerWithName:@"SecondScreenInterfaceController" context:[_cards objectAtIndex:rowIndex]];

}

#pragma mark - Init cards

-(NSMutableArray*)cards {
    if (!_cards) {
        _cards =[NSMutableArray array];
        NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cards" ofType:@"plist"]];
        for (NSDictionary* dict in plist) {
            Card* card = [[Card alloc] initWithDictionary:dict];
            [_cards addObject:card];
        }
    }
    return _cards;
}


@end



