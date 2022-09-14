import "./App.css";
import Dashboard from "./components/Dashboard";
import Sidebar from "./components/SideBar/Sidebar";
import ProductTable from "./components/Products/ProductTable";
import ProductDetail from "./components/Products/ProductDetail"
import SearchProducts from "./components/Products/SearchProducts";
import Users from "./components/Users/Users";
import Orders from "./components/Orders/Orders";

import { Route, Switch } from "react-router-dom";

function App() {
    return (
        <div id="wrapper">
            {/* <!-- Sidebar --> */}
            <Sidebar />
            {/* <!-- End of Sidebar --> */}

            {/* <!-- Content Wrapper --> */}
            <div id="content-wrapper" className="d-flex flex-column">
                {/* <!-- Main Content --> */}
                <div id="content">
                    {/* <!-- Content Row Top --> */}
                    <div className="container-fluid pt-5">
                        <Switch>
                            <Route
                                path="/"
                                component={Dashboard}
                                exact={true}
                            />
                            <Route
                                path="/products"
                                component={ProductTable}
                                exact={true}
                            />
                            <Route
                                path="/products/:id"
                                component={ProductDetail}
                            />
                            <Route
                                path={"/searchProduct"}
                                component={SearchProducts}
                            />
                            <Route
                                path={"/users"}
                                component={Users}
                            />
                            <Route
                                path={"/orders"}
                                component={Orders}
                            />
                        </Switch>
                    </div>
                    {/* <!--End Content Row Top--> */}
                </div>
                {/* <!-- End of MainContent --> */}

                {/* <!-- Footer --> */}
                <footer className="sticky-footer bg-white">
                    <div className="container my-auto">
                        <div className="copyright text-center my-auto">
                            <span>Copyright &copy; Supermercado Alcer</span>
                        </div>
                    </div>
                </footer>
                {/* <!-- End of Footer --> */}
            </div>
            {/* <!-- End of Content Wrapper --> */}
        </div>
    );
}

export default App;
