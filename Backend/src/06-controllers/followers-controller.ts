import express, { NextFunction, Request, Response } from 'express';
import cyber from '../01-utils/cyber';
import followersLogic  from '../05-logic/followers-logic';


const router = express.Router();

// Get vacations list with number of followers:
router.get("/vacations/followers", async (request: Request, response: Response, next: NextFunction) => {
    try {
        const result = await followersLogic.getListWithFollowers();
        response.json(result);
    }
    catch (err: any) {
        next(err);
    }
});

// Add a follow:
router.post("/vacations/followers/:vacationId", async (request: Request, response: Response, next: NextFunction) => {
    try {
        const vacationId = +request.params.vacationId;
        const userId = +cyber.extractUserId(request.headers.authorization);
        await followersLogic.addFollow(userId , vacationId);
        response.sendStatus(201);
    }
    catch (err: any) {
        next(err);
    }
});

// Remove a follow:
router.delete("/vacations/followers/:vacationId", async (request: Request, response: Response, next: NextFunction) => {
    try {
        const vacationId = +request.params.vacationId;
        const userId = +cyber.extractUserId(request.headers.authorization);
        await followersLogic.removeFollow(userId , vacationId);
        response.sendStatus(204);
    }
    catch (err: any) {
        next(err);
    }
});

export default router;



