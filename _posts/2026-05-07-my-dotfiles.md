---
layout: post
title:  "My Dotfiles"
date:   2026-05-07 10:00:00
categories: linux code
---

I started university two and a half years ago with an old and clunky 2013
MacBook Pro after spending most of my school years on Windows. I still
remember having to relearn most of the basic shortcuts like <kbd>Shift</kbd> +
<kbd>Option</kbd> + <kbd>4</kbd> for screenshots instead of <kbd>Win</kbd> +
<kbd>Shift</kbd> + <kbd>S</kbd>, or trying to run a `.exe` file from my
Applications folder.

At first, I really liked the polished, "glossy" look of macOS and learned
a lot of trackpad gestures. Compared to Windows, interacting with the system
felt more intuitive and creative. But soon I noticed the pure pain of window
management.

I rarely work in a single window with full focus. Most of the time, I read
papers on one side of the screen while taking notes on the other, or write
emails and use tools like ChatGPT to refine the wording and make them sound
more professional. Later at university, we often worked with a text editor and
a terminal side by side instead of using an IDE.

Back on Windows, arranging windows with <kbd>Win</kbd> + <kbd>Arrow</kbd> keys felt
effortless. But on macOS, I often found myself dragging windows around with the
trackpad or using Split View through the small button in the corner.

After spending some time on Wikipedia and falling into a bit of a rabbit hole,
I discovered Linux with its tiling window managers like [i3](https://i3wm.org/). The idea of
controlling everything through the keyboard with vim-like key-bindings
immediately clicked. If you have ever learned the "Language of Motion" you can
apply the same principles to navigating your entire operating system. 

I stopped constantly switching between scrolling, clicking, and typing, after
an adjustment period of a few weeks. Instead, everything becomes part of a
single, consistent interaction model. In addtion to increased cognitive
ergonomics, it is also physically more ergonomic. Your hands stay on the
keyboard, your arms remain in a neutral position and you avoid constantly
reaching for a mouse which reduces unnecessary repetitive movement and awkward
posture shifts.

![Ergonomic Mouse](/assets/images/ergonomic-mouse.jpg)

*I know multiple people who, after developing hand pain from “normal” mouse
usage, ended up using something like a crane navigation joystick just to open
PDFs.*

After my MacBook lost about 85% of its battery capacity and became permanently
dependent on a charger (and then its power cable started smoking while I was
editing a paper in the uni library), I decided something had to change. So
last summer I  installed Linux on a gigantic 17" HP Probook from 2015 and
began setting up the system I am still using today.

In the process, I learned that "settings apps" like the ones I was used to on my
phone or older laptops, can often be replaced by simple text files.
Instead of clicking through deeply nested menus with hundreds of toggles and
radio buttons, you simply describe what you want in a plain text file, and
the system applies it. 

These configuration files (often called "rc" short for run commands) can
influence the behaviour of many programs you use. This gives you a lot of
customization power while keeping the setup process consistent. You are
just using your text editor instead of learning a new GUI for each tool.

I’d say it took me about one to two weeks to get everything working in a
usable state. It’s still far from finished, but it probably never will be. The
goal isn’t a perfect product, but an infrastructure for personalization.
In that sense, I'm quite happy with my current setup...

**So should you also use a dotfile based operating System?**

It depends on how often you use a computer and whether you enjoy using it efficently.
As a rough guide, [this](https://m.xkcd.com/1205/index.html) xkcd chart is often referenced:

![Is It Wort the Time? Mouse](/assets/images/is-it-worth-the-time.png)


I first learned about managing dotfiles through one of the best open
educational resources I've come across and later adapted the ideas to my own
system. The material is [here](https://missing.csail.mit.edu/2019/dotfiles/),
and i highly recommend it.

If you are curious, you can check out my configuration [here](https://github.com/hschoss/dotfiles)
and get inspired by some of the free software I use:
