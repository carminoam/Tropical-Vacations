import express, { NextFunction, Request, Response } from 'express';
import path from 'path';
import VacationModel from '../03-models/vacation-model';
import logic from '../05-logic/vacations-logic';
import verifyLoggedIn from '../02-middleware/verify-logged-in';
import verifyAdmin from '../02-middleware/verify-admin';
import cyber from '../01-utils/cyber';

const router = express.Router();

// Get all vacations:
router.get("/vacations",verifyLoggedIn , async (request: Request, response: Response, next: NextFunction) => {
    try {
        const userId = +cyber.extractUserId(request.headers.authorization);
        const vacations = await logic.getAllVacations(userId);
        response.json(vacations);
    }
    catch (err: any) {
        next(err);
    }
});

// Get one vacation: 
router.get("/vacations/:id", async (request: Request, response: Response, next: NextFunction) => {
    try {
        const id = +request.params.id;
        const vacation = await logic.getOneVacation(id);
        response.json(vacation);
    }
    catch (err: any) {
        next(err);
    }
});

// Add one vacation:
router.post("/vacations", async (request: Request, response: Response, next: NextFunction) => {
    try {
        request.body.image = request.files?.pic;
        const vacation = new VacationModel(request.body);
        const addedVacation = await logic.addVacation(vacation);
        response.status(201).json(addedVacation);
    }
    catch (err: any) {
        next(err);
    }
});

// Update one full vacation: (not in use)
router.put("/vacations/:id", async (request: Request, response: Response, next: NextFunction) => {
    try {
        const id = +request.params.id;
        request.body.id = id;
        const vacation = new VacationModel(request.body);
        const updatedVacation = await logic.updateFullVacation(vacation);
        response.json(updatedVacation);
    }
    catch (err: any) {
        next(err);
    }
});

// Update one part vacation:
router.patch("/vacations/:id", async (request: Request, response: Response, next: NextFunction) => {
    try {
        request.body.image = request.files?.pic;
        const id = +request.params.id;
        request.body.id = id;
        const vacation = new VacationModel(request.body);
        const updatedVacation = await logic.updatePartialVacation(vacation);
        response.json(updatedVacation);
    }
    catch (err: any) {
        next(err);
    }
});

// Delete one vacation:
router.delete("/vacations/:id", async (request: Request, response: Response, next: NextFunction) => {
    try {
        const id = +request.params.id;
        await logic.deleteVacation(id);
        response.sendStatus(204);
    }
    catch (err: any) {
        next(err);
    }
});

//Get vacation image:
router.get("/vacations/images/:imageName", async (request: Request, response: Response, next: NextFunction) => {
    try {
        const imageName = request.params.imageName;
        const absolutePath = path.join(__dirname, "..", "assets", "images", imageName);
        response.sendFile(absolutePath);
    } catch (err: any) {
        next(err);
    }
});


export default router;