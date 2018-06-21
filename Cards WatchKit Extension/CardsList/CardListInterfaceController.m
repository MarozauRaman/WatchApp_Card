//
//  InterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "CardListInterfaceController.h"
#import "CardTableRowController.h"
#import "Card.h"


@interface CardListInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable* table;
@property (strong, nonatomic) NSMutableArray* cards;

@end

@implementation CardListInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.

    [self.table setNumberOfRows:[self.cards count] withRowType:@"CardTableRowController"];
    for(int i =0;i<[self.cards count];i++){
        Card* card=self.cards[i];
        CardTableRowController* row = [self.table rowControllerAtIndex:i];
        
        [row.label setText:card.name];
        [row.image setImageNamed:card.imageName];
        [row.number setText:card.number];
        
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd.MM.yyyy"];
        NSDate *date = [dateFormat dateFromString:card.term];
        
        if([date timeIntervalSinceNow] < 259200){
            [row.label setTextColor:[UIColor colorWithRed:0.91 green:0.96 blue:0.40 alpha:1.0]];
        }
        if([date timeIntervalSinceNow] < 0){
            [row.label setTextColor:[UIColor colorWithRed:1.00 green:0.25 blue:0.21 alpha:1.0]];
        }
        
        
    }
}


-(void)table:(WKInterfaceTable *)_card didSelectRowAtIndex:(NSInteger)rowIndex{
   [self pushControllerWithName:@"CardDetailInterfaceController" context:[self.cards objectAtIndex:rowIndex]];
}

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



