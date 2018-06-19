//
//  SecondScreenInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "SecondScreenInterfaceController.h"
#import "Card.h"


@interface SecondScreenInterfaceController ()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *cardInfo;
@property (nonatomic) Card *card;

@end

@implementation SecondScreenInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Назад"];
    
    _card = [[Card alloc]initWithDictionary:context];
    [_labelll setText:_card.name];
    [_balance setText:[_card.amount stringByAppendingString:@" BYN"]];
    [_number setText:_card.number];
    [_image setImageNamed:_card.imageName];
    
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)ExtractionButton {
    
    [self pushControllerWithName:@"ExtractionInterfaceController" context:_card.statement];
}
- (IBAction)AboutCardButton {
    [self pushControllerWithName:@"AboutCardInterfaceController" context:_card];
}


@end



