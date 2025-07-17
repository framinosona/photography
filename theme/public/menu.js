// Menu control functions
let isFraminosonaMenuOpen = false;
const framinosonaMenu = document.getElementById("framinosona-menu-panel");
const framinosonaTopSideBlock = document.getElementById(
  "framinosona-side-ui-block-top"
);

function toggleMenu() {
  if (isFraminosonaMenuOpen) {
    closeMenu();
  } else {
    openMenu();
  }
}

function openMenu() {
  framinosonaMenu.classList.add("open");
  framinosonaTopSideBlock.classList.add("menu-open");
  isFraminosonaMenuOpen = true;
}

function closeMenu() {
  framinosonaMenu.classList.remove("open");
  framinosonaTopSideBlock.classList.remove("menu-open");
  isFraminosonaMenuOpen = false;
}

document.addEventListener("DOMContentLoaded", function () {
  initializeMenu();
  framinosonaTopSideBlock.addEventListener("click", toggleMenu);
});

// Optional: Close menu when clicking outside
document.addEventListener("click", function (event) {
  if (
    isFraminosonaMenuOpen &&
    !framinosonaMenu.contains(event.target) &&
    !framinosonaTopSideBlock.contains(event.target)
  ) {
    closeMenu();
  }
});
