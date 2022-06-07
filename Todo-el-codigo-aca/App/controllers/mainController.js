const productos = require("../dataBaseProduct");

module.exports = {
    home : (req, res)=>{
        res.render("home",{"productos":productos});
    },

    product : (req,res) =>{
        res.render("productDetail");
    },

    cart : (req,res) =>{
        res.render("productCart");
    },

    register: (req, res) => {
        res.render("register");
    },

    login: (req, res) => {
        res.render("login");
    }
};