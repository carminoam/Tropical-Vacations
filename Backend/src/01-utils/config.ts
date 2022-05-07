class Config {

}

class DevelopmentConfig extends Config {
    public isDevelopment = true;
    public mysql = { host: "localhost", user: "root", password: "", database: "project3_vacations" };
}

class ProductionConfig extends Config {
    public isDevelopment = false;
    public mysql = { host: "eu-cdbr-west-02.cleardb.net", user: "becbcb852884ec", password: "c96a7186", database: "heroku_95fbc017f598094" };
}

const config = process.env.NODE_ENV === "production" ? new ProductionConfig() : new DevelopmentConfig();

export default config;
