/*Objective-C programs are executed via GNUStep on Linux*/


#import <Foundation/Foundation.h>


int main (int argc, const char * argv[])
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    // read filename from the first argument
    NSString* filename = [NSString stringWithCString:argv[1] encoding:NSASCIIStringEncoding];
    NSString* content = [NSString stringWithContentsOfFile:filename encoding:NSASCIIStringEncoding error:nil];
    NSScanner* scanner = [NSScanner scannerWithString:content];
    
    while (![scanner isAtEnd]) {
        NSString* line;
        [scanner scanUpToString:@"\n" intoString:&line];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"0" forKey:@"zero"];
        [dict setObject:@"1" forKey:@"one"];
        [dict setObject:@"2" forKey:@"two"];
        [dict setObject:@"3" forKey:@"three"];
        [dict setObject:@"4" forKey:@"four"];
        [dict setObject:@"5" forKey:@"five"];
        [dict setObject:@"6" forKey:@"six"];
        [dict setObject:@"7" forKey:@"seven"];
        [dict setObject:@"8" forKey:@"eight"];
        [dict setObject:@"9" forKey:@"nine"];
        
//        NSDictionary *dict = [NSDictionary]@{@"zero": @"0",
//                               @"one": @"1",
//                               @"two": @"2",
//                               @"three": @"3",
//                               @"four": @"4",
//                               @"five": @"5",
//                               @"six": @"6",
//                               @"seven": @"7",
//                               @"eight": @"8",
//                               @"nine": @"9" };
        
        NSArray *wordArray = [line componentsSeparatedByString:@";"];
        NSMutableString *digit = [[NSMutableString alloc] init];
        
        for(NSString *word in wordArray){
            [digit appendString:[dict valueForKey:word]];
 
        }
        
        
        // output an answer
        printf("%s\n", [digit cStringUsingEncoding:NSASCIIStringEncoding]);
    }
    
    [pool release];
    return 0;
}
