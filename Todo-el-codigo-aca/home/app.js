const express = require("express")  //requerimos el paquete express
const path = require ("path")  //path unifica las rutas dentro de los sistemas operatvos((direcciones))

const app = express()  //
const publicPath = path.resolve(__dirname, "./public") //le indicamos a path que resuelva la siguiente ruta
app.use(express.static(publicPath))  //usamos la funcion static de express, que recibe como parametro la ruta a la carpeta public


app.listen(3000, () => console.log("Servidor ejecutándose en el puerto 3000"));


app.get("/",(req,res)=>{
    res.sendFile(path.resolve(__dirname, "./views/home.html"))
})