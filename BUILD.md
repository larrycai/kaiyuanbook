# Introduction #

As open source books, ebooks and pdf format should be created on fly, the following sections describe those solution in detail.

The solution below is based on [Pro Git][progit]; while it is little updated on format inside. 

# Making Pdf books #
PDF format is used to read/print in nice way like real book, [pandoc][pandoc] good at this and it is used instead to generate latex from markdown, and latex tool `xelatex` (is part of [TexLive][texlive] now) is used to convert pdf from latex.

Please check [ctax](http://www.ctan.org/) and [TexLive][texlive] for more background for latex, which is quite complicated and elegant if you have never touched before.

## Ubuntu Platform ##

Ubuntu Platform Oneiric (11.10) is used mainly due to pandoc. 

[pandoc][pandoc] can be installed directly from source, which version is 1.8.x. If you use Ubuntu 11.04, then it is just 1.5.x.

Though texlive 2011 can be installed separately, the default one texlive 2009 from Ubuntu repository is good enough so far. 

	$ sudo apt-get install pandoc
    $ sudo apt-get texlive-xelatex
    $ sudo apt-get texlive-latex-recommended # main packages
    $ sudo apt-get texlive-latex-extra # package titlesec
	
You need to install related fonts for Chinese, fortunately they exist in ubuntu source also.
    
    $ sudo apt-get install ttf-arphic-gbsn00lp ttf-arphic-ukai # from arphic 
	$ sudo apt-get install ttf-wqy-microhei ttf-wqy-zenhei # from WenQuanYi

Then it should work perfectly

	$ ./makepdfs zh
    
Just remind you, some [extra pandoc markdown format](http://johnmacfarlane.net/pandoc/README.html) is used inside this book:

  * code syntax highlight (doesn't work in pdf, while it should work in html/epub which needed later)
  * footnote
    
# Making Ebooks #

**In long term** I will use pandoc instead of solution below since from 1.8.x, pandoc supports for epub as well.

[ruby rdiscount](https://github.com/rtomayko/rdiscount) is used to convert all the markdown files to html format.

[Calibre][calibre]'s command `ebook-convert` is used to convert html files into ebooks like `.mobi` (Kindle) and `.epub` (for iPad), it exists in several platforms (Windows, OS X, Linux).

[Calibre][calibre] needs X-Windows for some reason, If X-Windows is not used like server only, then [xvfb](http://en.wikipedia.org/wiki/Xvfb) (Virtual Framebuffer 'fake' X server) package should be installed to support headless X-Windows. Simple X-Windows server like XMing doesn't support X-Input.

After preparing the environment, you can simple run the command below to generate related ebooks

    $ ./makeebooks zh  # default for .mobi
	$ export FORMAT=epub ; 
	$ ./makeebooks zh  # for epub

## Ubuntu ##
Ubuntu 11.04 (Natty) is verified, it should work in other version as well with slight changes.

    $ sudo apt-get install ruby calibre rubygems # ruby 1.8.7 is used
	$ sudo apt-get install calibre # calibre 0.7.44 for ubuntu 11.04
	$ gem install rdiscount ruby-debug 
	
## Windows (not fixed) ##
	
[RubyInstaller & DevKit](http://rubyinstaller.org/downloads/) is needed for ruby environment on windows, ruby 1.9 is verified, and "Git for windows" is used to provide unix environment.
	
	$ gem install rdiscount 
	$ gem install ruby-debug19 # have problem
	
	Building native extensions.  This could take a while...
	ERROR:  Error installing ruby-debug19:
        ERROR: Failed to build gem native extension.

        c:/Ruby193/bin/ruby.exe extconf.rb
	checking for vm_core.h... no
	c:/Ruby193/lib/ruby/gems/1.9.1/gems/ruby_core_source-0.1.5/lib/ruby_core_source.rb:39: Use RbConfig instead of obsolet
	and deprecated Config.
	checking for vm_core.h... no
	*** extconf.rb failed ***
	...
	
[Calibre][calibre]'s command `ebook-convert` is under `calibre` directory, it should be added into your path, then the related ebook can be created.

Then you should be able to generate pdf

    $ xvfb-run ./makeebooks zh # if no X-Windows	
	
## Fedora platform ##
This is copied from [Pro Git][progit], not verified yet

On Fedora you can run something like this::

    $ yum install ruby calibre rubygems ruby-devel rubygem-ruby-debug 
    $ gem install rdiscount
    $ makeebooks en  # will produce a mobi
	
[pandoc]: http://johnmacfarlane.net/pandoc/    
[calibre]: http://calibre-ebook.com/
[progit]: http://github.com/progit/progit 
[texlive]: http://www.tug.org/texlive/
