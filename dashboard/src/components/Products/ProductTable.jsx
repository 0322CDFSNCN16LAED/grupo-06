import React, { useState, useEffect } from "react";

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
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                </tr>
            </thead>
            <tbody>
                {
                    productsList.map(item => (
                        <React.Fragment>
                            <tr>
                                <td>{item.id}</td>
                                <td>{item.name}</td>
                                <td>{item.category}</td>
                            </tr>
                        </React.Fragment>
                    ))
                }
            </tbody>    
        </table>
        </React.Fragment>
    )
};