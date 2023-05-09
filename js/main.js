// slider zdjec

const images = document.querySelectorAll(".images");

let imgIndex = 0;

function imgSlider() {
  for (let i = 0; i < images.length; i++) {
    images[i].style.opacity = "0";
  }

  imgIndex++;

  if (imgIndex > images.length) {
    imgIndex = 1;
  }

  images[imgIndex - 1].style.opacity = "1";

  setTimeout(imgSlider, 4000);
}

imgSlider();

// otwieranie ustawien

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
