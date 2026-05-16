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

At first, I really liked the polished, "glossy" look of macOS and learned a lot
of trackpad gestures. Compared to Windows, interacting with the system felt
more intuitive and creative. But soon I noticed the persistent friction of
window management.

I rarely work in a single window environment. Most of the time, I read papers
on one side of the screen while taking notes on the other, or write emails and
use tools like ChatGPT to refine them. Later at university, we often
worked with a text editor and a terminal side by side instead of using an IDE.

Back on Windows, arranging windows with <kbd>Win</kbd> + <kbd>Arrow</kbd> keys felt
effortless. But on macOS, I often found myself dragging windows around with the
trackpad or using Split View through the small button in the corner.

After spending some time on Wikipedia and falling into a deep rabbit hole, I
discovered Linux with its tiling window managers like [i3](https://i3wm.org/).
The idea of navigating my entire system through the keyboard with vim-like
key-bindings immediately clicked. Once you have climbed the steep learning
curve of the “language of motion”, you start to notice its benefits even in
contexts where there is no text to edit.

Within weeks, I stopped constantly switching between scrolling, clicking, and
typing. Instead, everything became part of a single, consistent interaction
model with less task switching. This improved both cognitive and physical
ergonomics. Now, my hands stay on the keyboard, my arms remain in a neutral
position, and I no longer need to constantly reach for a mouse. As a result, my
posture has improved and i feel less strained than before.

![Ergonomic Mouse](/assets/images/ergonomic-mouse.jpg)

*I know multiple people who, after developing hand pain from “normal” mouse
usage, ended up using something like this crane navigation joystick just to open
PDFs.*

After my MacBook lost about 85% of its battery capacity and became permanently
dependent on a charger (and then its power cable started smoking while I was
editing a paper in the uni library), I decided it was time to move on. So last
summer I installed Linux on a gigantic 17" HP Probook and began setting up the
system I am still using today.

In the process, I learned that 'settings apps' like the ones I was used to on my
phone or older laptops, can often be replaced by simple text files.
Instead of clicking through deeply nested menus with hundreds of toggles and
radio buttons, you describe what you want in a plain text file, and
the system applies it. 

These configuration files (often called "rc" short for run commands) can
influence the behaviour of many programs you use. This gives you a lot of
individualization power while keeping the setup process consistent. You are
just using your text editor instead of learning a new GUI for each tool.

It took me about one to two weeks to get everything working in a usable state.
It’s still far from finished, but it probably never will be. The goal isn’t a
perfect product, but a system I can actually configure rather than just use. In
that sense, I'm quite happy with my current setup...

**So should you also use a dotfile based operating System?**

It depends on how often you use a computer and whether you're drawn to thinking
about how you work. As a rough guide,
[this](https://m.xkcd.com/1205/index.html) xkcd chart is often referenced:

![Is It Wort the Time? Mouse](/assets/images/is-it-worth-the-time.png)

I first learned about managing dotfiles through one of the best open
educational resources I've come across and later adapted the ideas to my own
system. The material is [here](https://missing.csail.mit.edu/2019/dotfiles/),
and i highly recommend it.

If you're curious, here's [my
configuration](https://github.com/hschoss/dotfiles) and some of the free
software I use.


