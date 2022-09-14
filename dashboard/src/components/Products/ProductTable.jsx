import React, { useState, useEffect } from "react";
import ProductLine from "./ProductLine";
import "./productTable.css"

const EXPRESS_HOST = "http://localhost:3030";

export default ()=>{

    const [productsList, setProductsList] = useState([]);

    const getProducts = async () => {
        const data = await fetch(`${EXPRESS_HOST}/api/products`);
        const result = await data.json();
        const products = result.products;
        setProductsList(products);
    }
    
    useEffect(()=>{
        getProducts()
    }, [])
    
    return(
        <React.Fragment>
        <h1>Productos: </h1>
            <table>
                <thead>
                    <tr>
                        <th className="id">Id</th>
                        <th className="name">Nombre</th>
                        <th className="category">Categoría</th>
                        <th>Detalle</th>
                    </tr>
                </thead>
                <tbody>
                {productsList.map((item)=>{
                    return <ProductLine id={item.id} name={item.name} category={item.category} key={item.name} />
                })}
                </tbody>    
            </table>
        </React.Fragment>
    )
};