function changeNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-goodtravel');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-goodtravel-black');
      } else {
        navbar.classList.remove('navbar-goodtravel-black');
      }
    });
  }
}

export { changeNavbarOnScroll };
