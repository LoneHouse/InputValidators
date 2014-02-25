//
//  ConfirmEmailInputValidator.m
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "ConfirmEmailInputValidator.h"

NSString *const kConfirmEmailValidatorDescription = @"Input validation failed.";
NSString *const kConfirmEmailValidatorReason = @"Emails do not match. Please try again.";

@implementation ConfirmEmailInputValidator

- (id)initWithInput:(NSString *)inputString andPatternString:(NSString *)pattern {
	if (self = [self initWithInput:inputString]) {
		self.patternString = pattern;
	}
	
	return self;
}

- (BOOL)validateError:(NSError *__autoreleasing *)error {
	BOOL validationResult = YES;
	
	if (![self.input isEqualToString:self.patternString]) {
		validationResult = NO;
		NSDictionary *userInfo = @{
								   NSLocalizedDescriptionKey: kConfirmEmailValidatorDescription, NSLocalizedFailureReasonErrorKey: kConfirmEmailValidatorReason
								   };
		*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
	}
	
	return validationResult;
}

@end
