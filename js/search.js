(function () {
  "use strict";

  var root = document.querySelector("[data-search-root]");
  if (!root) return;

  var form = root.querySelector("[data-search-form]");
  var input = root.querySelector("[data-search-input]");
  var status = root.querySelector("[data-search-status]");
  var results = root.querySelector("[data-search-results]");
  var index = [];
  var indexReady = false;
  var pendingQuery = "";

  function normalize(value) {
    return String(value || "").toLocaleLowerCase().normalize("NFKD").replace(/[\u0300-\u036f]/g, "");
  }

  function searchable(item) {
    return normalize([item.title, item.description, item.topic, (item.tags || []).join(" "), item.year].join(" "));
  }

  function score(item, terms) {
    var title = normalize(item.title);
    var topic = normalize(item.topic);
    var tags = normalize((item.tags || []).join(" "));
    var body = searchable(item);
    var total = 0;

    for (var i = 0; i < terms.length; i += 1) {
      if (body.indexOf(terms[i]) === -1) return -1;
      if (title.indexOf(terms[i]) !== -1) total += 8;
      if (topic.indexOf(terms[i]) !== -1) total += 4;
      if (tags.indexOf(terms[i]) !== -1) total += 3;
      total += 1;
    }
    return total;
  }

  function resultNode(item) {
    var li = document.createElement("li");
    var link = document.createElement("a");
    var meta = document.createElement("p");
    var description = document.createElement("p");

    link.href = item.url;
    link.textContent = item.title;
    meta.className = "search-result__meta";
    meta.textContent = [item.topic, item.year].filter(Boolean).join(" · ");
    description.textContent = item.description;
    li.appendChild(meta);
    li.appendChild(link);
    if (item.description) li.appendChild(description);
    return li;
  }

  function runSearch(query, updateHistory) {
    var cleanQuery = query.trim();
    var terms = normalize(cleanQuery).split(/\s+/).filter(Boolean);
    results.replaceChildren();

    if (terms.length === 0) {
      status.textContent = "Enter a search above.";
      if (updateHistory) history.replaceState(null, "", window.location.pathname);
      return;
    }

    var matches = index.map(function (item) {
      return { item: item, score: score(item, terms) };
    }).filter(function (match) {
      return match.score >= 0;
    }).sort(function (a, b) {
      return b.score - a.score || b.item.date.localeCompare(a.item.date);
    }).slice(0, 50);

    matches.forEach(function (match) { results.appendChild(resultNode(match.item)); });
    status.textContent = matches.length === 1 ? "1 result" : matches.length + " results";
    if (updateHistory) {
      var url = cleanQuery ? "?q=" + encodeURIComponent(cleanQuery) : window.location.pathname;
      history.replaceState(null, "", url);
    }
  }

  form.addEventListener("submit", function (event) {
    event.preventDefault();
    if (!indexReady) {
      pendingQuery = input.value;
      status.textContent = "Loading the archive…";
      return;
    }
    runSearch(input.value, true);
  });

  fetch(root.dataset.indexUrl, { credentials: "same-origin" }).then(function (response) {
    if (!response.ok) throw new Error("Search index unavailable");
    return response.json();
  }).then(function (items) {
    index = items.map(function (item) {
      item._searchable = searchable(item);
      return item;
    });
    indexReady = true;
    var initialQuery = new URLSearchParams(window.location.search).get("q") || "";
    if (initialQuery) {
      input.value = initialQuery;
      runSearch(initialQuery, false);
    } else if (pendingQuery) {
      input.value = pendingQuery;
      runSearch(pendingQuery, true);
    }
  }).catch(function () {
    status.textContent = "Search is temporarily unavailable. Browse the writing archive instead.";
  });
}());
