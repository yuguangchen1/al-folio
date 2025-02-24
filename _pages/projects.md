---
layout: page
title: Research
permalink: /research/
description: Unveiling the Dynamics of Galaxies - Gas Flows, Star Formation, and the Cosmic Ecosystem
nav: true
nav_order: 2
display_categories: [List of Projects, ADS Word Cloud]
horizontal: true
---

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="https://www.annualreviews.org/docserver/fulltext/astro/55/1/aa550389.f1.gif" title="The cosmic baryon cycle from Tumlinson et al., 2017" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

I have a broad interest in the formation and evolution of galaxies in our Universe. Particularly, I am interested
in the "cosmic baryon cycle"--how baryonic matter moves through galaxies and intergalactic space. In this cycle, gas falls into galaxies from the intergalactic medium, fueling star formation. In turn, stars and supernovae eject gas back into the intergalactic medium through stellar winds and feedback. Some gas cools and falls back, continuing the cycle. This process intrinsically regulates galaxy growth and evolution and shapes what our current Universe looks like.

Below lists some important projects that I am working on. 

<!-- pages/projects.md -->
<div class="projects">
{% if site.enable_project_categories and page.display_categories %}
  <!-- Display categorized projects -->
  {% for category in page.display_categories %}
  <a id="{{ category }}" href=".#{{ category }}">
    <h2 class="category">{{ category }}</h2>
  </a>
  {% assign categorized_projects = site.projects | where: "category", category %}
  {% assign sorted_projects = categorized_projects | sort: "importance" %}
  <!-- Generate cards for each project -->
  {% if page.horizontal %}
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
    {% for project in sorted_projects %}
      {% include projects_horizontal.liquid %}
    {% endfor %}
    </div>
  </div>
  {% else %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for project in sorted_projects %}
      {% include projects.liquid %}
    {% endfor %}
  </div>
  {% endif %}
  {% endfor %}

{% else %}

<!-- Display projects without categories -->

{% assign sorted_projects = site.projects | sort: "importance" %}

  <!-- Generate cards for each project -->

{% if page.horizontal %}

  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
    {% for project in sorted_projects %}
      {% include projects_horizontal.liquid %}
    {% endfor %}
    </div>
  </div>
  {% else %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for project in sorted_projects %}
      {% include projects.liquid %}
    {% endfor %}
  </div>
  {% endif %}
{% endif %}
</div>

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/concept_cloud.png" title="concept cloud" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
