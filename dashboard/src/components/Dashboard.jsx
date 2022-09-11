import CategoriesIdDb from "./productCategories/CategoriesIdDb";
import LastMovie from "./LastMovie";
import MiniCard from "./MiniCard";

const miniCards = [
    {
        id: "32",
        title: "Usuarios Registrados",
        color: "warning",
        value: "49",
        icon: "fa-user",
    },
    {
        id: "24",
        title: "Total de productos",
        color: "success",
        value: "79",
        icon: "fa-baguette",
    },
];

export default function Dashboard() {
    return (
        <>
            <div className="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 className="h3 mb-0 text-gray-800">App Dashboard</h1>
            </div>

            {/* <!-- Content Row Movies--> */}
            <div className="row">
                {/* <!-- Movies in Data Base --> */}
                {miniCards.map((data) => {
                    return <MiniCard {...data} key={data.id} />;
                })}
            </div>
            {/* <!-- End movies in Data Base --> */}

            {/* <!-- Content Row Last Movie in Data Base --> */}
            <div className="row">
                {/* <!-- Last Movie in DB --> */}
                <LastMovie />
                {/* <!-- End content row last movie in Data Base --> */}

                {/* <!-- Genres in DB --> */}
                <CategoriesIdDb />
            </div>
        </>
    );
}
