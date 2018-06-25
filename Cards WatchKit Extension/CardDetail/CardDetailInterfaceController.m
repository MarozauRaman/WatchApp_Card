//
//  SecondScreenInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "CardDetailInterfaceController.h"
#import "Card.h"


@interface CardDetailInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage* image;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel* titleOfCard;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel* number;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel* balance;
@property (strong,nonatomic) Card* currentCard;

@end

@implementation CardDetailInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    
    self.currentCard =(Card*) context;
    
    [self.number setText:self.currentCard.number];
    [self.balance setText:[self.currentCard.amount stringByAppendingString:[@" " stringByAppendingString: self.currentCard.currency]]];
    [self.image setImageNamed:self.currentCard.imageName];
    [self.titleOfCard setText:self.currentCard.name];
    
}


- (IBAction)ExtractionButton {
    [self pushControllerWithName:@"StatementsInterfaceController" context:self.currentCard];
}
- (IBAction)AboutCardButton {
    [self pushControllerWithName:@"AboutCardInterfaceController" context:self.currentCard];
}


@end



