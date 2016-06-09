//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Cenker Demir on 6/8/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents {
    NSUInteger priceOfItems = 0;
    for (NSUInteger i = 0; i < [self.items count]; i++) {
        FISItem *item = self.items[i];
        priceOfItems += item.priceInCents;
    }
    return priceOfItems;
}

-(void)addItem:(FISItem *)item {
    [self.items addObject:item];
}

-(void)removeItem:(FISItem *)item {
    for (NSUInteger i=0; i<[self.items count]; i++) {
        if ([self.items[i] isEqual:item]) {
            [self.items removeObjectAtIndex:i];
            break;
        }
    }
}


-(void)removeAllItemsLikeItem:(FISItem *)item {
    [self.items removeObject:item];
}

-(void)sortItemsByNameAsc {
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByNameAsc]] mutableCopy];
    
//    self.items = [[self.items sortedArrayUsingComparator:^NSComparisonResult(FISItem *item1, FISItem *item2){
//        return [item1.name compare:item2.name];
//    }] mutableCopy];
}

-(void)sortItemsByNameDesc {
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO selector:@selector(caseInsensitiveCompare:)];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByNameDesc]] mutableCopy];
}

-(void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByNameAsc]] mutableCopy];
}

-(void)sortItemsByPriceInCentsDesc {
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByNameDesc]] mutableCopy];
}

-(NSArray *)allItemsWithName:(NSString *)name{
    NSMutableArray *itemsWithSamename = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i < [self.items count]; i++) {
        FISItem *eachItem = self.items[i];
        if ([eachItem.name isEqualToString:name]) {
            [itemsWithSamename addObject:eachItem];
        }
    }
    return itemsWithSamename;
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)minimumPrice {
    NSMutableArray *itemsWithMinPrice = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i<[self.items count]; i++) {
        FISItem *eachItem = self.items[i];
        if (eachItem.priceInCents >= minimumPrice) {
            [itemsWithMinPrice addObject:eachItem];
        }
    }
    return itemsWithMinPrice;
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)maximumPrice {
    NSMutableArray *itemsWithMaxPrice = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i<[self.items count]; i++) {
        FISItem *eachItem = self.items[i];
        if (eachItem.priceInCents <= maximumPrice) {
            [itemsWithMaxPrice addObject:eachItem];
        }
    }
    return itemsWithMaxPrice;
}


@end
