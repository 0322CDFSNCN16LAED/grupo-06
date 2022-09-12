import BigCard from "./BigCard";
import { useState, useEffect } from "react";

const EXPRESS_HOST = "http://localhost:3030";

export default function LastProduct() {

    const [lastProductDb, setLastProductDb] = useState({name:"Cargando...",product_photo:"cargando...",description:"...cargando descripción"})

    useEffect(()=>{
        fetch(`${EXPRESS_HOST}/api/products/1`)
        .then( result => result.json())
        .then( product =>{
            setLastProductDb({
                name: product.name,
                product_photo: product.product_photo,
                description: product.description
            })
        })
    }, []);


    return (
        <BigCard title={`Último producto cargado: ${lastProductDb.name}`}>
            <div className="text-center">
                <img
                    className="img-fluid px-3 px-sm-4 mt-3 mb-4"
                    style={{ width: "40rem" }}
                    src={lastProductDb.product_photo}
                    alt="Último producto cargado"
                />
            </div>
            <p>
                {lastProductDb.description}
            </p>
            <a
                className="btn btn-danger"
                target="_blank"
                rel="nofollow"
                href="/"
            >
                Ver detalles
            </a>
        </BigCard>
    );
}
