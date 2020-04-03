Date: Fri, 3 Apr 2020 14:18:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc/omap: Fix set_load call in
 omap_rproc_request_timer
Message-ID: <20200403211837.GC20625@builder.lan>
References: <20200402010812.GA751391@yoga>
 <20200403013134.11407-1-natechancellor@gmail.com>
 <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 03 Apr 10:48 PDT 2020, Linus Torvalds wrote:

> On Thu, Apr 2, 2020 at 6:32 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
> > Enable autoreload in set_pwm") in the clockevents tree interacting with
> > commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
> > usage") from the rpmsg tree.
> >
> > This should have been fixed during the merge of the remoteproc tree
> > since it happened after the clockevents tree merge; however, it does not
> > look like my email was noticed by either maintainer and I did not pay
> > attention when the pull was sent since I was on CC.
> 
> Thanks, I've taken this patch directly into my tree since it was my
> merge that screwed up.
> 

Thanks Nathan, Suman and Linus.
