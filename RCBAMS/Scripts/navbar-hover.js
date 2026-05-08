// Desktop-only: open Bootstrap 3 dropdowns on hover with "single open" behavior.
(function () {
  function ready(fn) {
    if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", fn);
    else fn();
  }

  ready(function () {
    var mq = window.matchMedia ? window.matchMedia("(min-width: 768px)") : null;
    function isDesktop() {
      return !mq || mq.matches;
    }

    var nav = document.getElementById("myNavbar");
    if (!nav) return;

    var dropdowns = nav.querySelectorAll("li.dropdown");
    function closeAll(except) {
      for (var i = 0; i < dropdowns.length; i++) {
        var li = dropdowns[i];
        if (except && li === except) continue;
        li.classList.remove("open");
      }
    }

    for (var i = 0; i < dropdowns.length; i++) {
      (function (li) {
        li.addEventListener("mouseenter", function () {
          if (!isDesktop()) return;
          closeAll(li);
          li.classList.add("open");
        });

        li.addEventListener("mouseleave", function () {
          if (!isDesktop()) return;
          li.classList.remove("open");
        });
      })(dropdowns[i]);
    }

    // Close when leaving the whole navbar area
    nav.addEventListener("mouseleave", function () {
      if (!isDesktop()) return;
      closeAll();
    });
  });
})();

