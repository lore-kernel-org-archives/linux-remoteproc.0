Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 2 Dec 2016 13:56:39 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: remoteproc/ste: Hide config option by default
Message-ID: <20161202215639.GE9322@tuxbot>
References: <20161201094955.4c4eefe3@endymion>
 <CACRpkdbVYE3ya+GfQ0+4V4XfdQF548ZOfsEcggDCrAdX-VB4RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbVYE3ya+GfQ0+4V4XfdQF548ZOfsEcggDCrAdX-VB4RQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.de>, linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 02 Dec 02:08 PST 2016, Linus Walleij wrote:

> On Thu, Dec 1, 2016 at 9:49 AM, Jean Delvare <jdelvare@suse.de> wrote:
> 
> > Back in July 2014 I asked around what was the intended target
> > platform for the STE Modem remoteproc driver, so that I could add the
> > proper hardware dependency to its config option. The answer I got was
> > that there was no known publicly available hardware needing it and it
> > was unlikely that there ever would.
> >
> > Still there were objections to deleting the driver, which I do not
> > really understand, but I do respect. But as there is no point in
> > presenting the config option by default, let's hide it unless
> > build-testing.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Ohad Ben-Cohen <ohad@wizery.com>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>
> > Cc: Suman Anna <s-anna@ti.com>
> > ---
> > As suggested by Linus Walleij over 2 years ago, sorry for not
> > following up back then:
> >   https://lkml.org/lkml/2014/7/25/218
> >
> > The driver could also be moved to staging/.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Also for moving it to staging, if you want. Or deleting it.
> 

If there's no known present or future users of this code I would prefer
that we just drop it - it will stay with us in the git history if
someone wants it back.


I do not want to see it moved to staging, I still need to maintain it
when the internal remoteproc APIs changes.

Regards,
Bjorn
