import RxFlow

public enum NickNameSignupStep: Step {
    case ageSignupIsRequired
    case oauthLoginIsRequired
    case nickNameSignupIsRequired
}
