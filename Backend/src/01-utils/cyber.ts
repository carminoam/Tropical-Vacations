import jwtDecode from 'jwt-decode';
import jwt from "jsonwebtoken";
import UserModel from "../03-models/user-model";
import crypto from "crypto";

const salt = "MakeThingsGoRight"; // Hash salt.

// Hash password:
function hash(plainText: string): string {

    if(!plainText) return null;

    // Hashing without salt:
    // const hashedText = crypto.createHash("sha512").update(plainText).digest("hex"); // hex --> convert to string

    // Hashing with salt:
    // HMAC = Hashed based Message Authentication Code
    const hashedText = crypto.createHmac("sha512", salt).update(plainText).digest("hex"); // hex --> convert to string

    return hashedText;
}


const secretKey = "KittensAreCute";

function getNewToken(user: UserModel): string {

    // The object we're setting inside the token: 
    const payload = { user };

    // Generate token: 
    const token = jwt.sign(payload, secretKey, { expiresIn: "2h" });

    // Return the token:
    return token;
}

// Verify token:
function verifyToken(authorizationHeader: string): Promise<boolean> {

    return new Promise((resolve, reject) => {

        // If there is no authorization header: 
        if(!authorizationHeader) {
            resolve(false);
            return;
        }

        // Extract the token ("Bearer given-token"): 
        const token = authorizationHeader.split(" ")[1];

        // If there is no token: 
        if(!token) {
            resolve(false);
            return;
        }

        // Here we have a token: 
        jwt.verify(token, secretKey, (err) => {

            // If token expired, if token not legal:
            if(err) {
                resolve(false);
                return;
            }

            // Here the token is legal: 
            resolve(true);
        });

    });

}

function verifyRole(authorizationHeader: string) {

    return new Promise((resolve, reject) => {

        // If there is no authorization header: 
        if(!authorizationHeader) {
            resolve(false);
            return;
        }

        // Extract the token ("Bearer given-token"): 
        const token = authorizationHeader.split(" ")[1];

        // If there is no token: 
        if(!token) {
            resolve(false);
            return;
        }

        // if the user is not admin: 
        const encodedObject: any = jwtDecode(token);
        if(encodedObject.user.role !== "admin") {
            resolve(false);
            return;
        }

        // Here we have a token: 
        jwt.verify(token, secretKey, (err) => {

            // If token expired, if token not legal:
            if(err) {
                resolve(false);
                return;
            }

            // Here the token is legal: 
            resolve(true);
        });

    });

}

function extractUserId(authorizationHeader: string): string {

    // If there is no authorization header: 
    if(!authorizationHeader) {
        console.log("no header");
        return null;
    }

    // Extract the token ("Bearer given-token"): 
    const token = authorizationHeader.split(" ")[1];

    // If there is no token: 
    if(!token) {
        console.log("no token");
        return null;
    }

    // Here we have a token: 
    const encodedObject: any = jwtDecode(token);
    return encodedObject.user.id;
}

export default {
    hash,
    getNewToken,
    verifyToken,
    verifyRole,
    extractUserId
};