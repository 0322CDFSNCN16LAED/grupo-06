import React, {useState, useEffect} from "react";
import BigCard from "../BigCard";
import { useLocation } from "react-router-dom";

const EXPRESS_HOST = "http://localhost:3030";


export default (props)=>{

    const [productName, setProductName] = useState("cargando...");
    const [photo, setPhoto] = useState();
    const [description, setDescription] = useState("cargando...");

    const url = useLocation()
    const getProducts = async (id) => {
        const data = await fetch(`${EXPRESS_HOST}/api/products/${id}`);
        const result = await data.json();
        return result;
    }

    useEffect(()=>{
        const id = url.pathname.slice(10);
        getProducts(id)
        .then((product)=>{
            setProductName(product.name);
            setPhoto(product.product_photo);
            setDescription(product.description);
        })
        .catch((error)=>{
            setProductName("producto no encontrado");
            setDescription("producto no encontrado");
        })


    },[])

    return (
        <BigCard title={productName}>
            <div className="text-center">
                <img
                    className="img-fluid px-3 px-sm-4 mt-3 mb-4"
                    style={{ width: "40rem" }}
                    src={photo}
                    alt="Imagen no encontrada"
                />
            </div>
            <p>
                {description}
            </p>
        </BigCard>
)}