# zeno-blade-creator.github.io

Enzo Markarian's resume and project portfolio.

**Live at:** https://zeno-blade-creator.github.io

## Structure

```
index.html                     resume / landing page
projects/peak-on-wine.html     case study: Unity 6 game on free Wine
style.css                      one stylesheet, light + dark, no dependencies
```

Plain HTML and CSS. No build step, no framework, no JavaScript. GitHub Pages
serves the files as they are, so editing a file and pushing is the whole
deployment process.

## Editing

Change the file, commit, push. The live site updates within a minute or two.

```bash
cd ~/Desktop/resume-site
# edit
git add -A && git commit -m "what changed" && git push
```

## Status

**Draft as of 2026-08-13.** The Wine case study is complete. The resume itself is
a skeleton — everything marked `TODO` in `index.html` needs real content.

### Not built yet

- **`resume.md` as a single source, with a generated PDF.** The plan is for one
  markdown file to produce both the web resume and `resume.pdf`, via a GitHub
  Action, so they can never drift apart. Until that exists, `index.html` is the
  only source — deliberately, so there is nothing to drift *from*. Do not add a
  second copy of the resume text before the generator exists.
- LinkedIn link, education, and remaining roles.

## Why GitHub Pages

Free, no account to maintain, and the limits are far beyond anything a personal
site will reach: 1 GB site size, 100 GB/month bandwidth (soft), 10 builds/hour
(soft). No usage billing — exceeding a soft limit means throttling and an email,
not a charge.
