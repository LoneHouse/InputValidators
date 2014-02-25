//
//  EmailInputValidator.m
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "EmailInputValidator.h"

NSString *const kEmailValidatorRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
NSString *const kEmailValidatorDescription = @"Input validation failed.";
NSString *const kEmailValidatorReason = @"Email address not valid. Please enter a valid address.";
NSString *const kEmptyEmailValidatorReason = @"Email address must be provided.";
NSString *const kLargeEmailValidatorReason = @"Email must be under 50 characters";

@implementation EmailInputValidator

- (BOOL)validateError:(NSError *__autoreleasing *)error {
	BOOL validationResult = YES;
	if ([self.input isEqualToString:@""]) {
		NSDictionary *userInfo = @{ NSLocalizedDescriptionKey:kEmptyValidatorDescription, NSLocalizedFailureReasonErrorKey:kEmptyEmailValidatorReason };
		*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
		validationResult = NO;
	}
	else {
		if (self.input.length > 50) {
			NSDictionary *userInfo = @{ NSLocalizedDescriptionKey:kEmptyValidatorDescription, NSLocalizedFailureReasonErrorKey:kLargeEmailValidatorReason };
			*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
			validationResult = NO;
		}
		else{
			NSError *regError = nil;
			NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:kEmailValidatorRegex options:NSRegularExpressionAnchorsMatchLines error:&regError];
			NSUInteger numberOfMatches = [regex numberOfMatchesInString:self.input options:NSMatchingAnchored range:NSMakeRange(0, [self.input length])];
			// if there is not a single match
			// then return an error and NO
			if (numberOfMatches != 1) {
				if (error != nil) {
					NSDictionary *userInfo = @{ NSLocalizedDescriptionKey:kEmailValidatorDescription, NSLocalizedFailureReasonErrorKey:kEmailValidatorReason };
					*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
				}
				validationResult = NO;
			}
		}
	}
	return validationResult;
}

@end
