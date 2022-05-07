import { OkPacket } from "mysql";
import ErrorModel from "../03-models/error-model";
import VacationModel from "../03-models/vacation-model";
import dal from "../04-dal/dal";
import { v4 as uuid } from 'uuid';
import fs from "fs";
import path from "path";

// Get all vacations: 
async function getAllVacations(userId: number): Promise<VacationModel[]> {

    const sql = `SELECT id, description, destination, imageName, startTime, endTime, price, vacationsfollowers.userId AS isFollow FROM vacations 
                LEFT JOIN vacationsfollowers
                ON vacations.id = vacationsfollowers.vacationId 
                && vacationsfollowers.userId = ?
                ORDER BY vacationsfollowers.userId DESC;`;

    // const sql = `SELECT * FROM vacations`;

    const vacations = await dal.execute(sql, [userId]);

    for (let i in vacations) {
        if (vacations[i].isFollow !== null) {
            vacations[i].isFollow = true;
        } else {
            vacations[i].isFollow = false;
        }
    }
    return vacations;
}

// Get one vacation: 
async function getOneVacation(id: number): Promise<VacationModel> {

    const sql = `SELECT * FROM vacations WHERE id = ? `

    const vacations = await dal.execute(sql, [id]);
    const vacation = vacations[0];
    if (!vacation) throw new ErrorModel(404, `id ${id} not found`);
    return vacation;
}

// Add vacation: 
async function addVacation(vacation: VacationModel): Promise<VacationModel> {

    // Handle image:
    if (vacation.image) {
        const extension = vacation.image.name.substring(vacation.image.name.lastIndexOf(".")); // Extract the file extension.
        vacation.imageName = uuid() + extension; // Generate new uniq name.
        const absolutePath = path.join(__dirname, "..", "assets", "images", vacation.imageName);
        await vacation.image.mv(absolutePath); //Move image to folder.
        delete vacation.image; // Delete the file from the vacation object.
    }

    // const sql = `INSERT INTO vacations(Description, Destination, ImageName, Dates, Price, Followers)
    //              VALUES(?,?,?,?,?,?)`;
    const sql = `INSERT INTO vacations VALUES(DEFAULT, ?, ?, ?, ?, ?, ?)`;

    const info: OkPacket = await dal.execute(sql, [vacation.description, vacation.destination, vacation.imageName, vacation.startTime, vacation.endTime, vacation.price]);
    vacation.id = info.insertId;

    return vacation;
}

// Update full vacation: 
async function updateFullVacation(vacation: VacationModel): Promise<VacationModel> {

    const sql = `UPDATE vacations SET
                description = ?,
                destination = ?,
                imageName = ?,
                startTime = ?,
                endTime = ?,
                price = ?
                WHERE id = ${vacation.id}`;

    const info: OkPacket = await dal.execute(sql, [vacation.description, vacation.destination, vacation.imageName, vacation.startTime, vacation.endTime, vacation.price]);
    if (info.affectedRows === 0) throw new ErrorModel(404, `id ${vacation.id} not found`);
    return vacation;
}

async function updatePartialVacation(vacation: VacationModel): Promise<VacationModel> {
    
    const dbVacation = await getOneVacation(vacation.id);

    if (vacation.image) { // Handle image:
        const extension = vacation.image.name.substring(vacation.image.name.lastIndexOf(".")); // Extract the file extension.
        if (dbVacation.imageName) { // If there is image before updating.
            const absolutePath = path.join(__dirname, "..", "assets", "images", dbVacation.imageName);
            await fs.unlink(absolutePath, function (err) { // Delete the old image from the folder.
                if (err) {
                    throw err;
                }
            });
            const currentName = dbVacation.imageName.substring(0, dbVacation.imageName.lastIndexOf(".")); // Extract the current name without extension.
            vacation.imageName = currentName + extension; // The old name + the new extension.
            await vacation.image.mv(path.join(__dirname, "..", "assets", "images", vacation.imageName)); //Move image to folder.
            delete vacation.image; // Delete the file from the vacation object.
        } else {
            // If there is no image exists.
            vacation.imageName = uuid() + extension; // Generate new uniq name.
            const absolutePath = path.join(__dirname, "..", "assets", "images", vacation.imageName);
            await vacation.image.mv(absolutePath); //Move image to folder.
            delete vacation.image; // Delete the file from the vacation object.
        }
    }

    for (const prop in vacation) {
        if (vacation[prop] !== undefined) {
            dbVacation[prop] = vacation[prop];
        }
    }

    const updatedVacation = await updateFullVacation(new VacationModel(dbVacation));

    return updatedVacation;
}

// Delete vacation:
async function deleteVacation(id: number): Promise<void> {

    // If there is image delete from folder.
    const vacation = await getOneVacation(id);
    if (vacation.imageName) {
        const absolutePath = path.join(__dirname, "..", "assets", "images", vacation.imageName);
        await fs.unlink(absolutePath, function (err) {
            if (err) {
                throw err;
            }
        });
    }

    const sql = `DELETE FROM vacations WHERE id = ?`;
    const info: OkPacket = await dal.execute(sql, [id]);
    if (info.affectedRows === 0) throw new ErrorModel(404, `id ${id} not found`);
}



export default {
    getAllVacations,
    getOneVacation,
    addVacation,
    updateFullVacation,
    deleteVacation,
    updatePartialVacation
}


