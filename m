Date: Sat, 18 Jan 2020 12:10:44 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Fix built-in early-load Intel microcode alignment
Message-ID: <20200118201040.GH1511@yoga>
References: <CACMCwJK-2DHZDA_F5Z3wsEUEKJSc3uOwwPD4HRoYGW7A+kA75w@mail.gmail.com>
 <20200113154739.GB11244@42.do-not-panic.com>
 <CAHk-=wja2GChi_JBu0xBkQ96mqXC3TMKUp=YvRhgPy0+1m5YNw@mail.gmail.com>
 <20200115022705.GE11244@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115022705.GE11244@42.do-not-panic.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jari Ruusu <jari.ruusu@gmail.com>, Borislav Petkov <bp@alien8.de>, Fenghua Yu <fenghua.yu@intel.com>, johannes.berg@intel.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 14 Jan 18:27 PST 2020, Luis Chamberlain wrote:

> On Mon, Jan 13, 2020 at 11:44:25AM -0800, Linus Torvalds wrote:
> > On Mon, Jan 13, 2020 at 7:47 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > >
> > > So I'd like to determine first if we really need this. Then if so,
> > > either add a new global config option, and worst comes to worst
> > > figure out a way to do it per driver. I don't think we'd need it
> > > per driver.
> > 
> > I really don't think we need to have a config option for some small
> > alignment. Increasing the alignment unconditionally to 16 bytes won't
> > hurt anybody.
> 
> Since you are confident in that, then simply bumping it to 16 bytes
> seems fine by me.
> 
> > Now, whether there might be other firmware loaders that need even more
> > alignment, that might be an interesting question, and if such an
> > alignment would be _huge_ we might want to worry about actual memory
> > waste.
> 
> I can only envision waste being considered due to alignent for remote
> proc folks, who I *doubt* use the built-in stuff given the large size of
> their blobs... but since you never know, better poke. So I've CC'd them.
> 

I've not heard of anyone using built-in firmware with remoteproc, but as
you say firmware used with remoteproc is large. So I can't see there
being a problem of potentially wasting 8 bytes...

> > But 16-byte alignment for a fw blob? That's nothing.
> 
> Fine by me if we are sure it won't break anything and we hear no
> complaints by remote proc folks.
> 

Go for it.

Regards,
Bjorn
