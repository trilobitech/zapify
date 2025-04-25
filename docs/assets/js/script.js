document.addEventListener("DOMContentLoaded", function () {
    const elemsSidenav = document.querySelectorAll(".sidenav");
    M.Sidenav.init(elemsSidenav);

    const elemsDropdown = document.querySelectorAll(".dropdown-trigger");
    M.Dropdown.init(elemsDropdown, { constrainWidth: false });
});
