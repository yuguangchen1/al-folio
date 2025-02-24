---
layout: page
title: The CIRAAS Survey
description: Comprehensive IFU Research on Accurate Abundance Studies
img: assets/img/cover_suggestion_YChen%20copy-sm.webp
importance: 1
category: List of Projects
related_publications: true
---

Gas-phase metallicity is the amount of heavy elements (e.g., O/H, N/H) in a galaxy’s interstellar gas. Stars make these elements through nuclear fusion and release them through stellar and supernova wind. Metallicity and the relative ratios between different metals are sensitive to the galaxy formation history: how many stars it has formed and how much fresh gas it has gained or lost. It also affects how new stars and planets form since metals help gas cool and turn into new celestial bodies.

However, measuring the gas-phase metallicity is not straightforward. Different observational methods may not agree with each other. 

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/adf.png" title="The abundance discrepancy factor" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    The abundance discrepancy factor (ADF). Two "direct" method to measure the gas-phase metallicity have systematic differences. The metallicities measured from the faint recombination lines are consistently higher than the strong collisionally excited lines by ~1.5-2x.
</div>

The CIRAAS (Comprehensive IFU Research on Accurate Abundance Studies) Survey is designed to map the metal emission lines in the optical and infrared wavelengths, by using the integral field units (IFU) on the Keck, Herschel, and SOFIA observatories. The primary goal is to investigate the cause of the inconsistency and unify the metallicity measurement methods. 

Some early results are presented in {% cite 2023NatAs...7..771C %} and {% cite 2024arXiv240518476C %}. The CIRAAS survey will extend the methodology to ~25 star-forming regions/galaxies in the nearby universe and provide crucial local references to galaxies across the Universe. 



### Investigating Star Formation and Metallicity in the Early Universe
Our research focuses on uncovering the physical conditions of high-redshift galaxies, particularly during their formative stages. By leveraging state-of-the-art instruments like the JWST NIRSpec and Keck/MOSFIRE, we analyze key spectral features such as oxygen and nitrogen emission lines to assess metallicities and ionization conditions. Studies have revealed young, bursty star-forming phases, low metallicities, and insights into the rapid assembly of stellar populations in galaxies at redshifts as high as z∼9. This work provides a crucial foundation for understanding the interplay between star formation and chemical enrichment in the universe’s earliest galaxies.

### Lyα Emission and Photon Escape as Diagnostics
Lyα emission is a powerful tool for investigating ionizing photon escape and star formation activity in early galaxies. Using a combination of spectroscopic and photometric data, we explore how Lyα profiles, equivalent widths, and other features correlate with ionizing escape fractions and other galaxy properties. These efforts aim to refine models of reionization and improve the accuracy of metallicity diagnostics across cosmic time.



Every project has a beautiful feature showcase page.
It's easy to include images in a flexible 3-column grid format.
Make your photos 1/3, 2/3, or full width.

To give your project a background in the portfolio page, just add the img tag to the front matter like so:

    ---
    layout: page
    title: project
    description: a project with a background image
    img: /assets/img/12.jpg
    ---

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/1.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/3.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This image can also have a caption. It's like magic.
</div>

You can also put regular text between your rows of images, even citations {% cite einstein1950meaning %}.
Say you wanted to write a bit about your project before you posted the rest of the images.
You describe how you toiled, sweated, _bled_ for your project, and then... you reveal its glory in the next row of images.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>

The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes. {% cite 2024ApJ...977L..23C %}
Here's the code for the last row of images above:

{% raw %}

```html
<div class="row justify-content-sm-center">
  <div class="col-sm-8 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm-4 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
```

{% endraw %}
