setTimeout(() => {
  const preload = document.getElementById('preload');
  if (preload) {
    preload.classList.add('loaded'); // Add the loaded class

    // Optionally, hide the preloader completely after transition
    setTimeout(() => {
      preload.style.display = 'none';

      // Ensure the elements exist before modifying them
      const elements = document.querySelectorAll('.header, .about, .contact-container, .content');
      elements.forEach(el => el.classList.add('visible'));
    }, 500); // Duration of the fade-out transition
  }
}, 900); // Hide preloader after 900 milliseconds
