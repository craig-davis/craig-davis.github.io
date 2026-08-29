(function () {
  "use strict";

  var toc = document.querySelector(".article-toc");
  if (!toc) return;

  var links = Array.prototype.slice.call(toc.querySelectorAll('a[href^="#"]'));
  var current = toc.querySelector("[data-toc-current]");
  var sections = links.map(function (link) {
    return document.getElementById(decodeURIComponent(link.hash.slice(1)));
  }).filter(Boolean);

  function select(section) {
    links.forEach(function (link) {
      var active = link.hash === "#" + section.id;
      if (active) link.setAttribute("aria-current", "location");
      else link.removeAttribute("aria-current");
    });
    if (current) current.textContent = "Current section: " + section.textContent.trim();
  }

  function update() {
    var marker = Math.max(120, window.innerHeight * 0.28);
    var active = sections[0];
    sections.forEach(function (section) {
      if (section.getBoundingClientRect().top <= marker) active = section;
    });
    if (active) select(active);
  }

  var queued = false;
  window.addEventListener("scroll", function () {
    if (queued) return;
    queued = true;
    window.requestAnimationFrame(function () {
      update();
      queued = false;
    });
  }, { passive: true });
  window.addEventListener("resize", update);
  update();
}());
