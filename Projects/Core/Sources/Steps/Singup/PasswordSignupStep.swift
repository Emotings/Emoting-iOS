import RxFlow

public enum PasswordSignupStep: Step {
    case oauthLoginIsRequired
    case passwordSignupIsrequired
    case nickNameSignupIsRequired
}
