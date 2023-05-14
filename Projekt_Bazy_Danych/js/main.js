const optionBtn = document.querySelector(".option-btn");
const optionWrapper = document.querySelector(".options-nav-box");

optionBtn.addEventListener("click", () => {
  const visibility = optionWrapper.getAttribute("data-visible");
  // console.log(visibility);

  if (visibility === "false") {
    optionWrapper.setAttribute("data-visible", true);
    optionWrapper.setAttribute("aria-expanded", true);
  } else {
    optionWrapper.setAttribute("data-visible", false);
    optionWrapper.setAttribute("aria-expanded", false);
  }
});

const colorTheme = document.querySelector(".switch-box");

const storeTheme = function (theme) {
  localStorage.setItem("theme", theme);
};

const retriveTheme = function () {
  const activeTheme = localStorage.getItem("theme");
  if (colorTheme.attributes[2].value == activeTheme) {
    colorTheme.checked = true;
  }
};

colorTheme.addEventListener("change", () => {
  const themeData = colorTheme.getAttribute("data-theme");
  if (colorTheme.checked) {
    colorTheme.setAttribute("data-theme", "dark");
    storeTheme(themeData);
    // console.log(colorTheme.attributes[2].value);
  } else {
    colorTheme.setAttribute("data-theme", "light");
    storeTheme(themeData);
    // console.log(colorTheme.attributes[2].value);
  }
});

window.onload = retriveTheme();

document.addEventListener("DOMContentLoaded", () => {
  retriveTheme();
});
