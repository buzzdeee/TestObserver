/*
   Project: TestObserver

   Author: Sebastian Reitenbach

   Created: 2024-10-02 15:19:00 +0200 by sebastia
*/

#import <Foundation/Foundation.h>
#import "SpellObserver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SpellObserver *observer = [[SpellObserver alloc] init];
        [observer startObserving];
        
        // Simulate changing properties that should affect `isActiveSpell`
        observer.spellItem.everLeveledUp = YES;
        observer.spellItem.level = 1;
        observer.spellItem.isTraditionSpell = YES;
        
        // Now, if everything works, we should see the "isActiveSpell" change in the observer.
        NSLog(@"Done simulating property changes.");
        
        // Clean up by removing the observer
        [observer.spellItem removeObserver:observer forKeyPath:@"isActiveSpell"];
    }
    return 0;
}

