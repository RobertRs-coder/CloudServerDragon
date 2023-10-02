//
//  JWTToken.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 27/9/23.
//

import Vapor
@preconcurrency import JWT

enum JWTTokenType: String, Codable {
    case accessToken
    case refreshToken
}

struct JWTToken: Content, JWTPayload, Authenticatable {
    
    // MARK: - Properties
    // We can add more fields if we need it as admin
    var exp: ExpirationClaim
    var iss: IssuerClaim
    var sub: SubjectClaim
    var type: JWTTokenType
    
    // MARK: - JWTPayload
    func verify(using signer: JWTSigner) throws {
        
        // Expired
        try exp.verifyNotExpired()
        
        // Validate bundle id
        guard iss.value == Environment.process.APP_BUNDLE_ID else {
                    throw JWTError.claimVerificationFailure(name: "iss", reason: "Issuer is invalid")
        }
        // Validate subject
        guard let _ = UUID(sub.value) else {
            throw JWTError.claimVerificationFailure(name: "sub", reason: "Subject is invalid")
        }
        // Validate JWTType
        guard type == .accessToken || type ==  .refreshToken else {
            throw JWTError.claimVerificationFailure(name: "type", reason: "JWT type is invalid")

        }
    }
}

// MARK: - DTO's
extension JWTToken {
    
    struct Public: Content {
        
        let accessToken: String
        let refreshToken: String
    }
}

// MARK: Auxiliar
extension JWTToken {
    
    static func generateTokens(userID: UUID) -> (access: JWTToken, refresh: JWTToken) {
        
        var expDate = Date().addingTimeInterval(Constants.accesTokenLifeTime)
        let access = JWTToken(
            exp: .init(value: expDate),
            iss: .init(value: Environment.process.APP_BUNDLE_ID!),
            sub: .init(value: userID.uuidString),
            type: .accessToken)
        
        expDate = Date().addingTimeInterval(Constants.refreshTokenLifeTime)
        let refresh = JWTToken(
            exp: .init(value: expDate),
            iss: .init(value: Environment.process.APP_BUNDLE_ID!),
            sub: .init(value: userID.uuidString),
            type: .refreshToken)
        
        return (access, refresh)
    }
}
