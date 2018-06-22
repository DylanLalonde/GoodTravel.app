function changeNavbarOnScroll() {
  const navbar = document.querySelector('.home.navbar-goodtravel');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight - 65) {
        navbar.classList.add('opaque');
      } else {
        navbar.classList.remove('opaque');
      }
    });
  }
}

export { changeNavbarOnScroll };
