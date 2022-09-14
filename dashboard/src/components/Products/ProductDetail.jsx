import React from "react";
import BigCard from "../BigCard";
import { useLocation } from "react-router-dom";

const productName = "hola"
const photo = "x"
const description = "description"



export default ({productName, photo, description})=>{

    const id = useLocation()
    console.log(id)

    return (
        <BigCard title={productName}>
            <div className="text-center">
                <img
                    className="img-fluid px-3 px-sm-4 mt-3 mb-4"
                    style={{ width: "40rem" }}
                    src={photo}
                    alt="Último producto cargado"
                />
            </div>
            <p>
                {description}
            </p>
        </BigCard>
)}