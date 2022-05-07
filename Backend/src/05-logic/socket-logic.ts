import { Server as HttpServer } from "http";
import { Server as SocketIoServer, Socket } from "socket.io";
import config from "../01-utils/config";
import VacationModel from "../03-models/vacation-model";
import vacationsLogic from "./vacations-logic";

function socketLogic(httpServer: HttpServer): void {

    const socketIoServer = new SocketIoServer(httpServer, { cors: { origin: config.isDevelopment ? "http://localhost:3000" : "https://vacations-app-noam.herokuapp.com/" } });
    // const socketIoServer = new SocketIoServer(httpServer, { cors: { origin: "http://localhost:3000"  } });


    socketIoServer.sockets.on("connection", (socket: Socket) => {

        console.log("Client has connected...");

        socket.on("AdminChangeData", () => {
                
                socketIoServer.sockets.emit("updateVacationsList");

        });

        socket.on("disconnect", () => {
            console.log("Client has been disconnect");
        });
    });
};



export default socketLogic;



