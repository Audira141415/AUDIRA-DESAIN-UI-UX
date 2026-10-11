---
name: audira-ui-ux
description: AUDIRA Design Intelligence and UI/UX engineering system for high-conversion web & mobile products.
---

# AUDIRA UI/UX Design Intelligence Skill

## Overview
This skill provides access to AUDIRA's internal UI/UX intelligence database, offering 79 UI styles, 192 color palettes, 74 font pairings, 119 UX guidelines, and 25 chart recommendations across 22 frontend technology stacks.

## Owner & Brand
- **Brand**: AUDIRA
- **Founder**: Agus Dwi Rianto (AUDIRA)
- **Organization**: Audira Multimedia Digital / Audira Sukses Mandiri
- **Website**: https://audira.my.id
- **Official Email**: agusdwirianto@gmail.com

## How to Query the Knowledge Engine
To fetch design recommendations or generate a customized design system:

```bash
# Design System generation for a specific product
python src/ui-ux-pro-max/scripts/search.py "<product-niche>" --design-system

# Style, color, or typography lookup
python src/ui-ux-pro-max/scripts/search.py "<keyword>" --domain style
python src/ui-ux-pro-max/scripts/search.py "<keyword>" --domain color
python src/ui-ux-pro-max/scripts/search.py "<keyword>" --domain typography

# Tech-stack specific guidelines
python src/ui-ux-pro-max/scripts/search.py "<keyword>" --stack <react|nextjs|html-tailwind|vue|flutter>
```
