import CategoriesIdDb from "./productCategories/CategoriesIdDb";
import LastProduct from "./LastProduct";
import MiniCard from "./MiniCard";
import React, { useState, useEffect } from "react";

const EXPRESS_HOST = "http://localhost:3030";

export default function Dashboard() {

    const [userNumber, setUserNumber] = useState(["cargando..."]);
    const [productNumber, setProductNumber] = useState(["cargando..."]);
    const [categoryNumber, setCategoryNumber] = useState(["cargando..."])

    useEffect(()=>{
        fetch(`${EXPRESS_HOST}/api/users`)
        .then(dataUsers=>dataUsers.json())
        .then(users=>setUserNumber(users.count));

        fetch(`${EXPRESS_HOST}/api/products`)
        .then(dataProducts=>dataProducts.json())
        .then(products=>{
            setProductNumber(products.count);
            setCategoryNumber(products.countByCategory.length)
        })
    }, [])

    const miniCards = [
        {
            id: "1",
            title: "Usuarios Registrados",
            color: "warning",
            value: userNumber,
            icon: "fa-user",
        },
        {
            id: "2",
            title: "Total de productos",
            color: "success",
            value: productNumber,
            icon: "fa-bag-shopping",
        },
        {
            id: "3",
            title: "Categorías de Productos",
            color: "primary",
            value: categoryNumber,
            icon: "fa-filter",
        }
    ];


    return (
        <React.Fragment>
            <div className="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 className="h3 mb-0 text-gray-800">App Dashboard</h1>
            </div>

            {/* <!-- Content Row products/users--> */}
            <div className="row">
                {/* <!-- products/users in Data Base --> */}
                {miniCards.map((data) => {
                    return <MiniCard {...data} key={data.id} />;
                })}
            </div>
            {/* <!-- End products/users in Data Base --> */}

            {/* <!-- Content Row Last Product in Data Base --> */}
            <div className="row">
                {/* <!-- Last Product in DB --> */}
                <LastProduct />
                {/* <!-- End content row last Product in Data Base --> */}

                {/* <!-- Categories in DB --> */}
                <CategoriesIdDb />
            </div>
        </React.Fragment>
    );
}
