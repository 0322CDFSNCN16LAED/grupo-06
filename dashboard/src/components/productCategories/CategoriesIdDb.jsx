import React, { Component } from "react";
import BigCard from "../BigCard";
import Category from "./Category";

const EXPRESS_HOST = "http://localhost:3030";

export default class CategoriesIdDb extends Component {
    constructor(props) {
        super(props);
        this.state = {
            categories: [],
        };
    }

    async componentDidMount() {
        const result = await fetch(`${EXPRESS_HOST}/api/products`);
        const productsResult = await result.json();
        const category = productsResult.countByCategory;
        console.log(category)
        this.setState({
            categories: category,
        });
    }

    render() {
        return (
            <BigCard title="Categorías de Productos">
                <div className="row">
                    {this.state.categories.map((element) => {
                        return <Category {...element}/>;
                    })}
                </div>
            </BigCard>
        );
    }
}
