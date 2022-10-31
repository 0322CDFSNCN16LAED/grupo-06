import React from "react";
import {Link} from "react-router-dom";

function ProductLine({id, name, category}){
    return(
        <tr>
            <td>{id}</td>
            <td>{name}</td>
            <td>{category}</td>
            <td>
            <Link to={`products/${id}`} exact="true">
                <span className="btn btn-warning" id={id}>Ver Detalles</span>
            </Link>
            </td>
        </tr>
    )
};

export default ProductLine;