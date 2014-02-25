//
//  InputValidator.m
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "InputValidator.h"

NSString *const kErrorDomain = @"com.weezlabs.JaxFitness";
NSString *const kEmptyValidatorDescription = @"Input validation failed.";


@implementation InputValidator

- (id)initWithInput:(NSString *)inputString {
	self = [super init];
	
	if (self) {
		self.input = inputString;
	}
	
	return self;
}

- (BOOL)validateError:(NSError *__autoreleasing *)error {
	if (error) {
		*error = nil;
	}
	
	return NO;
}

@end
