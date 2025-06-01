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

      window.addEventListener("scroll", () => {
        const line = document.querySelector(".timeline-line");
        const timeline = document.querySelector(".timeline");

        const timelineTop = timeline.offsetTop;
        const timelineHeight = timeline.offsetHeight;
        const scrollY = window.scrollY + window.innerHeight;

        const progress = Math.min((scrollY - timelineTop) / timelineHeight, 1);
        const lineHeight = progress * timelineHeight;

        line.style.height = `${lineHeight}px`;
      });
