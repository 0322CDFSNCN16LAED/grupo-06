import React from "react";
import { Link } from "react-router-dom";
import "./SideBar.css"

import logoAlcer from "../../assets/images/Logo-borde.png";

function Sidebar() {
    return (
        <ul
            className="navbar-nav bg-gradient-secondary sidebar sidebar-dark accordion"
            id="accordionSidebar"
        >
            {/* <!-- Sidebar - Brand --> */}
            <a
                className="sidebar-brand d-flex align-items-center justify-content-center"
                href="/"
            >
                <div className="sidebar-brand-icon">
                    <img className="logo" src={logoAlcer} alt="Supermercado Alcer" />
                </div>
            </a>

            {/* <!-- Divider --> */}
            <hr className="sidebar-divider my-0" />

            {/* <!-- Nav Item - Dashboard --> */}
            <li className="nav-item active">
                <Link className="nav-link collapsed" to="/" exact="true">
                    <i className="fas fa-fw fa-user"></i>
                    <span>Dashboard - ALCER</span>
                </Link>
            </li>

            {/* <!-- Divider --> */}
            <hr className="sidebar-divider" />

            {/* <!-- Heading --> */}
            <div className="sidebar-heading">Actions</div>

            {/* <!-- Nav Item - Pages --> */}
            <li className="nav-item">
                <Link className="nav-link collapsed" to="/products" exact="true">
                    <i className="fas fa-fw fa-folder"></i>
                    <span>Productos</span>
                </Link>
            </li>
            <li className="nav-item">
                <Link className="nav-link collapsed" to="/searchProduct" exact="true">
                    <i className="fas fa-fw fa-search"></i>
                    <span>Buscar Producto</span>
                </Link>
            </li>

            <li className="nav-item">
                <Link className="nav-link collapsed" to="/users" exact="true">
                    <i className="fas fa-fw fa-user"></i>
                    <span>Usuarios</span>
                </Link>
            </li>

            {/* <!-- Nav Item - Tables --> */}
            <li className="nav-item">
                <Link className="nav-link collapsed" to="/orders" exact="true">
                    <i className="fas fa-fw fa-table-cells"></i>
                    <span>Órdenes</span>
                </Link>
            </li>

            {/* <!-- Divider --> */}
            <hr className="sidebar-divider d-none d-md-block" />
        </ul>
    );
}

export default Sidebar;
