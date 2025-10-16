import Foundation

func checkPasswordStrength(_ password: String) -> String {
    var feedback: [String] = []
    
    if password.count < 10 {
        feedback.append("Password must be at least 10 characters long.")
    }
    
    let digits = CharacterSet.decimalDigits
    if password.rangeOfCharacter(from: digits) == nil {
        feedback.append("Password must contain at least one digit.")
    }
    
    let uppercase = CharacterSet.uppercaseLetters
    let lowercase = CharacterSet.lowercaseLetters
    
    if password.rangeOfCharacter(from: uppercase) == nil {
        feedback.append("Password must contain at least one uppercase letter.")
    }
    if password.rangeOfCharacter(from: lowercase) == nil {
        feedback.append("Password must contain at least one lowercase letter.")
    }
    
    let specialCharacters = CharacterSet.punctuationCharacters
    if password.rangeOfCharacter(from: specialCharacters) == nil {
        feedback.append("Password must contain at least one special character.")
    }
    

    if feedback.isEmpty {
        return "Strong password!"
    } else {
        return "Weak password:\n" + feedback.joined(separator: "\n")
    }
}

let testPasswords = [
    "StrongPass@123",
    "Short1!",
    "NoDigitsHere!",
    "lowercase123!",
    "Password2024"
]

for password in testPasswords {
    print("Testing: \(password)")
    print(checkPasswordStrength(password))
    print("----")
}
