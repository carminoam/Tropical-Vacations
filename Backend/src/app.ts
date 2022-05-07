import dotenv from 'dotenv';
import express, { NextFunction, Request, Response } from "express";
import path from 'path';
import errorsHandler from './02-middleware/error-handler';
import vacationController from './06-controllers/vacations-controller';
import expressFileUploaded from 'express-fileupload';
import cors from 'cors';
import config from './01-utils/config';
import ErrorModel from './03-models/error-model';
import authController from './06-controllers/auth-controller';
import socketLogic from './05-logic/socket-logic';
import followersController from './06-controllers/followers-controller';

dotenv.config();

const server = express();

console.log(config.isDevelopment);

if (config.isDevelopment) {  // Use cors if development mode.
    server.use(cors());
}
server.use(express.json());
server.use(expressFileUploaded());

// Expose index.html from 07-frontend directory:
const frontendDir = path.join(__dirname, '07-frontend'); // Create full path to frontend directory.
server.use(express.static(frontendDir)) // Serve index.html when user request root url.

server.use('/api', followersController);
server.use('/api', vacationController);
server.use('/api', authController);

server.use("*", (request: Request, response: Response, next: NextFunction) => {
    // On development - return 404 error
    if (config.isDevelopment) {
        next(new ErrorModel(404, "Route not found."));
    }
    else { // On production - return index.html to show desired page or page-not-found:
        const indexHtmlFile = path.join(__dirname, "07-frontend", "index.html");
        response.sendFile(indexHtmlFile);
    }
});

server.use(errorsHandler);
console.log(process.env.PORT);

const httpServer = server.listen(process.env.PORT, () => console.log(`Listening to port: ${process.env.PORT}`));

socketLogic(httpServer);
