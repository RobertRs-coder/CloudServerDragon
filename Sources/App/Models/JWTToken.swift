//
//  File.swift
//  
//
//  Created by Roberto Rojo Sahuquillo on 27/9/23.
//

import Vapor
import JWT

enum JWTTokenType: String, Codable {
    case accessToken
    case refreshToken
}

struct JWTToken: Content, JWTPayload {
    
    // MARK: - Properties
    var exp: ExpirationClaim
    var iss: IssuerClaim
    var sub: SubjectClaim
    var type: JWTTokenType
    
    // MARK: - JWTPayload
    func verify(using signer: JWTKit.JWTSigner) throws {
        
        // Expired
        try exp.verifyNotExpired()
        
        // Validate bundle id
        guard iss.value != Environment.process.APP_BUNDLE_ID else {
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
        
        let accesToken: String
        let refreshToken: String
    }
}
