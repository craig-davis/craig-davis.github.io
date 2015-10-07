---
layout:     post
title:      "Markdown Resume Builder"
subtitle:   "A tidy resume built with Markdown tools"
date:       2012-12-31 16:39
tags:       [php]
author:     "Craig Davis"
header-img: "img/headers/placitas.jpg"
---

[Markdown Resume Generator][project] is a project that I developed in [PHP][php]
to turn a [Markdown][md] document into an elegant resume. It will publish in both
HTML and PDF, and will default to using a set of styles with an adaptive
viewport. You'll start by making a simple markdown text file, and you'll
end up with two files, pixel perfect and ready to print and publish.

You can [markup your resume][sample_md] with very simple headings and lists:


    ### Skills {#skills}

    * Web Design
      : Assertively exploit wireless initiatives rather than synergistic core competencies.

    * Interface Design
      : Credibly streamline mission-critical value with multifunctional functionalities.

    * Project Direction
      : Proven ability to lead and manage a wide variety of design and development projects in team and independent situations.


And after processing get a very nice output:
![Sample Resume Output](/img/posts/resume-sample.png)

If there is enough interest in the project, I hope to add another template or
two, and some additional documentation.

For the pdf output, the project leverages
[wkhtmltopdf][wkhtmltopdf]. Check out their wiki for information on
[how to install the wkhtmltopdf][pdf_installer].

You can view the project on it's
[Markdown Resume Project Page][project]. If you've got questions, feel free to
[open an issue][issues]

[project]: http://there4development.com/markdown-resume
[issues]: http://there4development.com/markdown-resume/issues
[md]: http://daringfireball.net/projects/markdown
[php]: http://www.php.net
[sample_md]: https://raw.github.com/there4/markdown-resume/master/examples/source/sample.md
[wkhtmltopdf]: https://code.google.com/p/wkhtmltopdf
[pdf_installer]: https://github.com/pdfkit/pdfkit/wiki/Installing-WKHTMLTOPDF
[brew]: http://mxcl.github.com/homebrew

