//
//  JPTreeNode.m
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import "JPTreeNode.h"

@implementation JPTreeNode

@synthesize parent = _parent;
@synthesize children = _children;
@synthesize key = _key;
@synthesize leafValue = _leafValue;
@synthesize attributes = _attributes;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
