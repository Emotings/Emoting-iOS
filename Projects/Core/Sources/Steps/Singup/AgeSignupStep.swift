import RxFlow

public enum AgeSignupStep: Step {
    case ageSignupIsRequired
    case oauthLoginIsRequired
    case proFilSignupIsRequired
}
