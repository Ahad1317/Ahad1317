<!DOCTYPE html>
<html lang="en" class="dark">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AI Marketplace</title>
    <style>
      :root {
        --background: 224 71% 4%;
        --foreground: 213 31% 91%;
        --primary: 210 40% 98%;
        --primary-foreground: 222.2 47.4% 1.2%;
        --border: 216 34% 17%;
        --highlight: 132 71% 60%;
      }

      body {
        background: hsl(var(--background));
        color: hsl(var(--foreground));
        font-family: "Montserrat", sans-serif;
        margin: 0;
        min-height: 100vh;
        overflow-x: hidden;
        display: flex;
        flex-direction: column;
      }

      header {
        position: sticky;
        top: 0;
        z-index: 50;
        width: 100%;
        border-bottom: 1px solid hsl(var(--border));
        background-color: hsl(var(--background) / 0.95);
        backdrop-filter: blur(20px);
      }

      .header-container {
        display: flex;
        height: 4rem;
        align-items: center;
        justify-content: space-between;
        padding: 0 1rem;
        max-width: 80rem;
        margin: 0 auto;
      }

      .logo {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        font-weight: 700;
        font-size: 1.25rem;
        text-decoration: none;
        color: hsl(var(--foreground));
      }

      .logo-icon {
        width: 1.75rem;
        height: 1.75rem;
        fill: currentColor;
      }

      .theme-toggle {
        background: none;
        border: none;
        padding: 0.5rem;
        cursor: pointer;
        color: hsl(var(--foreground));
        position: relative;
        width: 2rem;
        height: 2rem;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .theme-icon {
        position: absolute;
        width: 1.25rem;
        height: 1.25rem;
        transition: all 0.3s ease;
      }

      .sun-icon {
        opacity: 1;
      }

      .moon-icon {
        opacity: 0;
      }

      .dark .sun-icon {
        opacity: 0;
        transform: rotate(90deg);
      }

      .dark .moon-icon {
        opacity: 1;
        transform: rotate(0);
      }

      .hero {
        padding-bottom: 2rem;
        background-color: hsl(var(--background));
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .hero-content {
        text-align: center;
        padding: 2rem;
      }

      .hero-title {
        font-size: 3rem;
        font-weight: 700;
        line-height: 1.2;
        margin-bottom: 2rem;
        color: #e1e7ef;
      }

      .hero-highlight {
        color: #64ff4c;
      }
      .light .hero-title {
        color: black;
      }
      .line-wrapper img {
        max-width: 100%;
        height: auto;
      }

      .light {
        --background: 0 0% 97%;
        --foreground: 222 47% 11%;
        --primary: 210 40% 98%;
        --primary-foreground: 222.2 47.4% 1.2%;
        --border: 214 32% 91%;
        --highlight: 226 100% 60%;
      }

      .light body {
        background: hsl(var(--background));
        color: hsl(var(--foreground));
      }

      .content-box {
        width: 280px; /* Increased from ~90px */
        height: 120px; /* Reduced from 200px */
        padding: 16px;
        background-color: #1d222c;
        color: #dcdfe5;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        border: 1px solid #2ecc40;
        border-radius: 8px;
      }

      .timeline-button {
        font-size: 1rem;
        border: 1px solid hsl(var(--highlight));
        background-color: transparent;
        color: hsl(var(--highlight));
        font-weight: 600;
        border-radius: 0.5rem;
        cursor: pointer;
        transition: all 0.3s ease;
        white-space: nowrap;
        padding: 0.75rem 1.5rem;
      }

      .timeline-button:hover {
        background-color: hsl(var(--highlight));
        color: white;
        transform: translateY(-1px); /* Added slight lift effect */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Added shadow on hover */
      }

      .feature-text {
        flex-grow: 1;
        font-size: 1.3rem;
        line-height: 1.5;
        color: white;
      }

      .timeline-container {
        position: relative;
        width: 100%;
        padding: 100px 50px;
        box-sizing: border-box;
      }

      .timeline-line {
        position: absolute;
        top: 50%;
        left: 5%;
        width: 90%;
        height: 4px;
        background-color: #32cd32;
        z-index: 0;
      }

      .timeline {
        display: flex;
        justify-content: space-around;
        align-items: center;
        position: relative;
        z-index: 1;
      }

      .timeline-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        width: 150px;
        position: relative;
      }

      .timeline-item .circle {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 20px; /* Adjust if needed */
        height: 20px;
        background-color: #2ecc40; /* Or whatever green you're using */
        border-radius: 50%;
        border: 3px solid #111; /* Optional glow or shadow border */
        z-index: 2;
      }

      .timeline-item .content-box,
      .timeline-item .timeline-button {
        background-color: #1c2331;
        border: 1px solid #32cd32;
        border-radius: 8px;
        padding: 12px;
        margin: 30px 0;
        font-weight: bold;
      }

      .content-box,
      .timeline-button {
        transform: skew(-10deg);
        border-radius: 12px;
        overflow: hidden;
      }

      /* Alternating layout */
      .timeline-item.odd .content-box {
        order: 1;
        margin-top: 2px;
      }

      .timeline-item.odd .circle {
        order: 2;
      }

      .timeline-item.odd .timeline-button {
        order: 3;
        margin-bottom: 100px;
      }

      .timeline-item.even .timeline-button {
        margin-top: 140px;
        margin-bottom: -65px;
      }

      .timeline-item.even .circle {
        order: 2;
      }

      .timeline-item.even .content-box {
        order: 3;
        margin-top: 140px;
      }
      .light .timeline-line {
        background-color: #221f63;
      }

      .light .circle {
        background-color: #221f63; /* Changed to purple */
        box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.2); /* Adjusted glow color */
      }
      .light .timeline-button {
        border-color: #4f46e5; /* Changed to purple */
        color: #4f46e5;
        background-color: transparent;
      }

      .light .timeline-button:hover {
        background-color: #4f46e5;
        color: white;
      }
      .light .content-box {
        background-color: rgb(38, 31, 100);
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
          0 2px 4px -1px rgba(0, 0, 0, 0.06);
        border: 1px solid #e5e7eb;
      }

      footer {
        background-color: hsl(var(--background));
        color: hsl(var(--foreground));
        text-align: center;
        padding: 1.5rem 0; /* Increased padding */
        font-size: 0.9rem;
        border-top: 1px solid hsl(var(--border));
        transition: all 0.3s ease; /* Added transition */
      }

      /* For light mode (if you use a .light class on body or html) */
      .light footer {
        background-color: white; /* Pure white background */
        color: #4b5563; /* Softer text color */
        border-top: 1px solid #e5e7eb; /* Lighter border */
        box-shadow: 0 -1px 3px rgba(0, 0, 0, 0.05); /* Added subtle shadow */
      }

      /* Mobile responsive */
      @media (max-width: 768px) {
        .timeline-line {
          left: 8px;
        }

        .timeline-item {
          position: relative;
          width: 100%;
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin: 6rem 0;
        }

        .content-box {
          width: 100%;
        }

        .timeline-button {
          margin-top: 1rem;
        }
      }

      @media (min-width: 768px) {
        .hero-title {
          font-size: 4.5rem;
        }

        .header-container {
          padding: 0 2rem;
        }
      }

      @media (min-width: 1024px) {
        .hero-title {
          font-size: 5rem;
        }
      }
    </style>
  </head>
  <body>
    <!-- Header -->
    <header>
      <div class="header-container">
        <a href="/" class="logo">
          <svg class="logo-icon" viewBox="0 0 24 24">
            <path fill="currentColor" d="M12 2L4 12l8 10 8-10-8-10z" />
          </svg>
          <span>AI Marketplace</span>
        </a>
        <button class="theme-toggle">
          <svg class="theme-icon sun-icon" viewBox="0 0 24 24">
            <circle cx="12" cy="12" r="4" fill="currentColor" />
            <path d="M12 2v2" stroke="currentColor" stroke-width="2" />
            <path d="M12 20v2" stroke="currentColor" stroke-width="2" />
            <path
              d="m4.93 4.93 1.41 1.41"
              stroke="currentColor"
              stroke-width="2"
            />
            <path
              d="m17.66 17.66 1.41 1.41"
              stroke="currentColor"
              stroke-width="2"
            />
            <path d="M2 12h2" stroke="currentColor" stroke-width="2" />
            <path d="M20 12h2" stroke="currentColor" stroke-width="2" />
            <path
              d="m6.34 17.66-1.41 1.41"
              stroke="currentColor"
              stroke-width="2"
            />
            <path
              d="m19.07 4.93-1.41 1.41"
              stroke="currentColor"
              stroke-width="2"
            />
          </svg>
          <svg class="theme-icon moon-icon" viewBox="0 0 24 24">
            <path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z" fill="currentColor" />
          </svg>
        </button>
      </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <h1 class="hero-title">
          Best <span class="hero-highlight">AI Marketplace</span><br />
          <span>Buy prompts</span><br />
          <span>at the best price</span>
        </h1>
      </div>
    </section>
    b

    <div class="timeline-container">
      <div class="timeline-line"></div>
      <div class="timeline">
        <div class="timeline-item odd">
          <div class="content-box">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur,
            mollitia?
          </div>
          <div class="circle"></div>
          <div class="timeline-button">Explore</div>
        </div>

        <div class="timeline-item even">
          <div class="timeline-button">Sell</div>
          <div class="circle"></div>
          <div class="content-box">Sell</div>
        </div>

        <div class="timeline-item odd">
          <div class="content-box">Creators</div>
          <div class="circle"></div>
          <div class="timeline-button">Creators</div>
        </div>
      </div>
    </div>
    <footer>&copy; 2025 AI Marketplace. All rights reserved.</footer>

    <script>
      const root = document.documentElement;
      const themeToggle = document.querySelector(".theme-toggle");

      // Initialize theme from localStorage or system preference
      const savedTheme = localStorage.getItem("theme");
      if (savedTheme) {
        root.classList.remove("dark", "light");
        root.classList.add(savedTheme);
      } else {
        const prefersDark = window.matchMedia(
          "(prefers-color-scheme: dark)"
        ).matches;
        root.classList.add(prefersDark ? "dark" : "light");
      }

      // Toggle theme
      themeToggle.addEventListener("click", () => {
        const currentTheme = root.classList.contains("dark") ? "dark" : "light";
        const newTheme = currentTheme === "dark" ? "light" : "dark";
        root.classList.remove("dark", "light");
        root.classList.add(newTheme);
        localStorage.setItem("theme", newTheme);
      });

      const timelineLine = document.getElementById("timelineLine");
    </script>
  </body>
</html>
