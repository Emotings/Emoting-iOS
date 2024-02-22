import RxFlow

public enum OauthLoginStep: Step {
    case oauthLoginIsRequired
    case emailLoginisRequired
    case emailSignupIsRequired
    case tabIsRequired
}
