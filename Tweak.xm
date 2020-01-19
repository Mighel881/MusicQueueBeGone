#import "Tweak.h"

BOOL enabled;
HBPreferences *preferences;
NSInteger feedbackStyle;
NSInteger ringStyle;


%hook _TtC5Music31ContextActionsHUDViewController

- (void)viewDidLoad {

    if (enabled) {

    } else {
    
        %orig;
    
    }
    
        switch (feedbackStyle) {

            case 0:
            AudioServicesPlaySystemSound(1519);
            break;

            case 1:
            AudioServicesPlaySystemSound(1520);
            break;

            case 2:
            AudioServicesPlaySystemSound(1521);
            break;

            case 3:
            break;

            default:
            break;

    }
    
    switch (ringStyle) {

        case 0:
        AudioServicesPlaySystemSound(1051);
        break;

        case 1:
        AudioServicesPlaySystemSound(1052);
        break;

        case 2:
        AudioServicesPlaySystemSound(1053);
        break;

        case 3:
        break;

        default:
        break;
    
    
    }
}
    
%end

//iOS 13 Support
%hook MusicQueueBeGone

- (void)viewDidLoad {

    if (enabled) {
    
    //Do Nothing
    
    } else {
    
        %orig;
    
    }
    
        switch (feedbackStyle) {

            case 0:
            AudioServicesPlaySystemSound(1519);
            break;

            case 1:
            AudioServicesPlaySystemSound(1520);
            break;

            case 2:
            AudioServicesPlaySystemSound(1521);
            break;

            case 3:
            break;

            default:
            break;

    }
    
    switch (ringStyle) {

        case 0:
        AudioServicesPlaySystemSound(1051);
        break;

        case 1:
        AudioServicesPlaySystemSound(1052);
        break;

        case 2:
        AudioServicesPlaySystemSound(1053);
        break;

        case 3:
        break;

        default:
        break;
    }
    
}
    
%end


%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.twickd.ethan-whited.musicqueuebegone"];
    [preferences registerBool:&enabled default:YES forKey:@"enabled"];
    [preferences registerInteger:&feedbackStyle default:0 forKey:@"feedbackStyle"];
    [preferences registerInteger:&ringStyle default:0 forKey:@"ringStyle"];
    
        %init(MusicQueueBeGone = objc_getClass("MusicApplication.ContextActionsHUDViewController"));

};
