// ==========================================================================
// Vipin Vijayan Nair - Portfolio
// Interactive JavaScript
// ==========================================================================

(function () {
  'use strict';

  // ----- DOM Ready -----
  document.addEventListener('DOMContentLoaded', () => {
    initNavigation();
    initScrollEffects();
    initRevealAnimations();
    initTypedEffect();
    initYearsOfExperience();
    setCurrentYear();
  });

  // ----- Mobile Navigation -----
  function initNavigation() {
    const toggle = document.getElementById('nav-toggle');
    const menu = document.getElementById('nav-menu');
    const links = document.querySelectorAll('.nav__link');

    if (!toggle || !menu) return;

    toggle.addEventListener('click', () => {
      toggle.classList.toggle('active');
      menu.classList.toggle('open');
      document.body.style.overflow = menu.classList.contains('open') ? 'hidden' : '';
    });

    // Close menu when a link is clicked
    links.forEach((link) => {
      link.addEventListener('click', () => {
        toggle.classList.remove('active');
        menu.classList.remove('open');
        document.body.style.overflow = '';
      });
    });

    // Close menu when clicking outside
    document.addEventListener('click', (e) => {
      if (!menu.contains(e.target) && !toggle.contains(e.target) && menu.classList.contains('open')) {
        toggle.classList.remove('active');
        menu.classList.remove('open');
        document.body.style.overflow = '';
      }
    });
  }

  // ----- Scroll Effects (Header, Active Link, Scroll-to-Top) -----
  function initScrollEffects() {
    const header = document.getElementById('header');
    const scrollTopBtn = document.getElementById('scrollTop');
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav__link');

    let lastScroll = 0;

    function onScroll() {
      const scrollY = window.scrollY;

      // Header shrink on scroll
      if (header) {
        header.classList.toggle('scrolled', scrollY > 50);
      }

      // Show scroll-to-top button
      if (scrollTopBtn) {
        scrollTopBtn.classList.toggle('visible', scrollY > 500);
      }

      // Active nav link based on scroll position
      let currentSection = '';
      sections.forEach((section) => {
        const top = section.offsetTop - 120;
        const height = section.offsetHeight;
        if (scrollY >= top && scrollY < top + height) {
          currentSection = section.getAttribute('id');
        }
      });

      navLinks.forEach((link) => {
        link.classList.remove('active');
        if (link.getAttribute('href') === `#${currentSection}`) {
          link.classList.add('active');
        }
      });

      lastScroll = scrollY;
    }

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    // Scroll to top
    if (scrollTopBtn) {
      scrollTopBtn.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
      });
    }
  }

  // ----- Reveal on Scroll -----
  function initRevealAnimations() {
    const targets = document.querySelectorAll(
      '.hero__content, .hero__visual, .about__content, .about__highlights, .skill-category, .timeline__item, .project-card, .cert__card, .contact__card'
    );

    targets.forEach((el) => el.classList.add('reveal'));

    if (!('IntersectionObserver' in window)) {
      targets.forEach((el) => el.classList.add('visible'));
      return;
    }

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry, index) => {
          if (entry.isIntersecting) {
            // Slight stagger effect
            setTimeout(() => entry.target.classList.add('visible'), index * 60);
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.12, rootMargin: '0px 0px -60px 0px' }
    );

    targets.forEach((el) => observer.observe(el));
  }

  // ----- Typed Effect for Hero Role -----
  function initTypedEffect() {
    const el = document.getElementById('typed');
    if (!el) return;

    const roles = [
      'Mobile Software Engineer',
      'iOS & Android Developer',
      'AI Engineer (LLMs & RAG)',
      'Tech Lead'
    ];

    let roleIndex = 0;
    let charIndex = 0;
    let isDeleting = false;
    const typeSpeed = 80;
    const deleteSpeed = 40;
    const pauseEnd = 1800;
    const pauseStart = 400;

    function type() {
      const current = roles[roleIndex];

      if (isDeleting) {
        el.textContent = current.substring(0, charIndex - 1);
        charIndex--;
      } else {
        el.textContent = current.substring(0, charIndex + 1);
        charIndex++;
      }

      let delay = isDeleting ? deleteSpeed : typeSpeed;

      if (!isDeleting && charIndex === current.length) {
        delay = pauseEnd;
        isDeleting = true;
      } else if (isDeleting && charIndex === 0) {
        isDeleting = false;
        roleIndex = (roleIndex + 1) % roles.length;
        delay = pauseStart;
      }

      setTimeout(type, delay);
    }

    type();
  }

  // ----- Set Current Year in Footer -----
  function setCurrentYear() {
    const yearEl = document.getElementById('year');
    if (yearEl) yearEl.textContent = new Date().getFullYear();
  }

  // ----- Years of Experience (calculated from first employment) -----
  // First employment: May 2010 — Manager, Smart Phone Apps at Schogini Systems
  function initYearsOfExperience() {
    const startDate = new Date(2010, 4, 1); // May 2010 (month is 0-indexed)
    const now = new Date();
    const years = now.getFullYear() - startDate.getFullYear();
    const hasAnniversaryPassed =
      now.getMonth() > startDate.getMonth() ||
      (now.getMonth() === startDate.getMonth() && now.getDate() >= startDate.getDate());
    const totalYears = hasAnniversaryPassed ? years : years - 1;
    const display = `${totalYears}+`;

    const targets = [
      'years-experience',
      'years-experience-about',
      'years-experience-info',
      'years-experience-stat'
    ];

    targets.forEach((id) => {
      const el = document.getElementById(id);
      if (el) el.textContent = display;
    });
  }

})();
