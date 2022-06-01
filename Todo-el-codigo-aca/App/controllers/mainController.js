module.exports = {
    home : (req, res)=>{
        res.render("home");
    },

    product : (req,res) =>{
        res.render("productDetail");
    },

    cart : (req,res) =>{
        res.render("productCart");
    }
};