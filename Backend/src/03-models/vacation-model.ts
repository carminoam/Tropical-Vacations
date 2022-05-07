import { UploadedFile } from "express-fileupload";
import joi from "joi";

class VacationModel {
    public id: number = 0;
    public description: string = "";
    public destination: string = "";
    public imageName: string = "";
    public image: UploadedFile = null;
    public startTime: string = "";
    public endTime: string = "";
    public price: number = 0;
    public isFollow: boolean = false;
    public sumOfFollowers: number = 0;

    public constructor(vacation: VacationModel) {
        this.id = vacation.id;
        this.description = vacation.description;
        this.destination = vacation.destination;
        this.imageName = vacation.imageName;
        this.image = vacation.image;
        this.startTime = vacation.startTime;
        this.endTime = vacation.endTime;
        this.price = vacation.price;
        this.isFollow = vacation.isFollow;
        this.sumOfFollowers = vacation.sumOfFollowers;
    }

    // private static postSchema = joi.object({
    //     description: joi.string().required(),
    //     destination: joi.string().required(),
    //     image: joi.any().optional(),
    //     startTime: joi.string().required(),
    //     endTime: joi.string().required(),
    //     price: joi.number().required(),
    //     followers: joi.number().required(),
    // });
}

export default VacationModel;