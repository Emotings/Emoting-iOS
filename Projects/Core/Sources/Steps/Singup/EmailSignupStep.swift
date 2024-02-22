import RxFlow

public enum EmailSignupStep: Step {
    case emailSignupIsRequired
    case oauthLoginIsRequired
    case passwordSignupIsrequired
}
