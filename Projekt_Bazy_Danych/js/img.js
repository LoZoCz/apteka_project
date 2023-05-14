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
