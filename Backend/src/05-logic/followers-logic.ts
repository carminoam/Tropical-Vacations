import dal from "../04-dal/dal";
import VacationModel from '../03-models/vacation-model';

// // Get number of followers per vacation:
// async function getFollowersPerVacation(vacationId: number): Promise<number> {
//     const sql = `SELECT COUNT(*) AS count FROM vacationsfollowers WHERE vacationId = ?`;
//     const result = await dal.execute(sql, [vacationId]);
//     return result[0].count;
// }

//Get list vacations & followers:
async function getListWithFollowers(): Promise <VacationModel[]> {
    const sql = `SELECT vacations.id, vacations.destination,
            (SELECT COUNT(*) FROM vacationsfollowers WHERE vacationId = vacations.id) AS sumOfFollowers
            FROM vacations
            LEFT JOIN vacationsfollowers
            ON vacations.id = vacationsfollowers.vacationId
            GROUP BY vacations.id`;
    const result = await dal.execute(sql);
    return result;
}

// Add a follow:
async function addFollow(userId: number, vacationId: number): Promise<void> {
    const sql = `INSERT INTO vacationsfollowers VALUES(?, ?)`;
    await dal.execute(sql, [userId, vacationId]);
}

// Remove a follow:
async function removeFollow(userId: number, vacationId: number): Promise<void> {
    const sql = `DELETE FROM vacationsfollowers WHERE userId = ? AND vacationId = ?`;
    await dal.execute(sql, [userId, vacationId]);
}

export default {
    addFollow,
    removeFollow,
    getListWithFollowers
};
