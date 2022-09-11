import React from "react";

function Category({ name, count }) {
    return (
        <div className="col-lg-6 mb-4">
            <div className="card text-white bg-dark  shadow">
                <div className="card-body">
                    {name} -  {count} productos
                </div>
            </div>
        </div>
    );
}
export default Category;
