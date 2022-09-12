import React, { Component, useState, useEffect } from "react";
import BigCard from "../BigCard";
import Category from "./Category";

const EXPRESS_HOST = "http://localhost:3030";

export default ()=>{

    const [categories, setCategories] = useState(["cargando..."]);
    useEffect(()=>{
        fetch(`${EXPRESS_HOST}/api/products`)
        .then(result => result.json())
        .then(productsResult => setCategories(productsResult.countByCategory))
    }, [])

    return(
            <BigCard title="Categorías de Productos">
                <div className="row">
                    {categories.map((element) => {
                        return <Category {...element}/>;
                    })}
                </div>
            </BigCard>
    );
}
