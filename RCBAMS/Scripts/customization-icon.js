// Adds icon + tooltip for DevExpress "Show/Hide Customization Window" buttons.
(function () {
  // Disabled: restore original DevExpress customization button/window behavior & styling.
  // (User requested to remove all applied filters/customizations.)
  return;

  function isCustomizationButton(el) {
    if (!el) return false;
    var t = (el.textContent || "").trim();
    return /customization/i.test(t);
  }

  function apply(el) {
    if (!el) return;
    var t = (el.textContent || "").trim();
    var isCust = /customization/i.test(t);

    // Only customization button becomes icon; other SoftOrange buttons remain normal.
    if (!isCust) {
      el.classList.remove("customization-toggle-icon");
      el.removeAttribute("aria-label");

      // Cleanup: remove injected icon (if any) but keep original markup intact.
      var oldIcon = el.querySelector ? el.querySelector("i.dx-icon-columnchooser[data-injected='1']") : null;
      if (oldIcon && oldIcon.parentNode) oldIcon.parentNode.removeChild(oldIcon);
      // keep existing title if any
      return;
    }

    // Inject the requested icon markup WITHOUT replacing DevExpress button internals.
    // DevExpress relies on its internal markup/events for the customization window.
    if (el.querySelector && !el.querySelector("i.dx-icon-columnchooser[data-injected='1']")) {
      var iEl = document.createElement("i");
      iEl.className = "dx-icon-columnchooser";
      iEl.setAttribute("aria-hidden", "true");
      iEl.setAttribute("data-injected", "1");
      el.insertBefore(iEl, el.firstChild);
    }

    el.classList.add("customization-toggle-icon");
    el.setAttribute("title", "Show customization window");
    el.setAttribute("aria-label", "Show customization window");

    // Try to move the icon next to export (PDF/XLS) buttons within same content block.
    placeNearExports(el);
  }

  function placeNearExports(el) {
    // ASP.NET ImageButton renders as <input type="image" ...>
    var root = el.closest ? el.closest(".cnt_div, .container, .container-fluid") : null;
    var scope = root || document;

    var exportBtn =
      scope.querySelector('input[type="image"][src*="PDF"], input[type="image"][src*="pdf"], img[src*="PDF"], img[src*="pdf"]') ||
      scope.querySelector('input[type="image"][src*="XLS"], input[type="image"][src*="xls"], img[src*="XLS"], img[src*="xls"]');

    if (!exportBtn || !exportBtn.parentNode) return;

    var parent = exportBtn.parentNode;

    // Ensure a consistent inline toolbar container to align icons.
    // We only touch markup when we actually find export icons.
    if (parent && parent.classList && !parent.classList.contains("export-icon-row")) {
      parent.classList.add("export-icon-row");
    }

    // Insert the customization icon just before the first export icon.
    // Ensure it's not already placed there.
    if (el.nextSibling === exportBtn || el === exportBtn.previousSibling) return;

    parent.insertBefore(el, exportBtn);
  }

  function init() {
    var buttons = Array.prototype.slice.call(document.querySelectorAll(".dxbButton_SoftOrange"));
    for (var i = 0; i < buttons.length; i++) {
      apply(buttons[i]);
    }

    // Keep tooltip updated when page scripts toggle text (Show -> Hide)
    var observer = new MutationObserver(function (mutations) {
      for (var m = 0; m < mutations.length; m++) {
        var target = mutations[m].target;
        if (target && target.classList && target.classList.contains("dxbButton_SoftOrange")) {
          apply(target);
        }
      }
    });

    for (var j = 0; j < buttons.length; j++) {
      observer.observe(buttons[j], { childList: true, subtree: true, characterData: true });
    }
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();

