Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 30 Jul 2018 21:02:08 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] hwspinlock: Fix incorrect return pointers
Message-ID: <20180731040208.GB5090@builder>
References: <782fc498b4f4c6e8130d64face93023eb3dc9866.1530152980.git.baolin.wang@linaro.org>
 <CAMz4kuKGaMh=M9=P4TkpF4w0onJZJcRaPd+twMyEpj56KNVJLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMz4kuKGaMh=M9=P4TkpF4w0onJZJcRaPd+twMyEpj56KNVJLA@mail.gmail.com>
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 30 Jul 04:34 PDT 2018, Baolin Wang wrote:

> Hi Bjorn,
> 
> On 28 June 2018 at 10:32, Baolin Wang <baolin.wang@linaro.org> wrote:
> > The commit 4f1acd758b08 ("hwspinlock: Add devm_xxx() APIs to request/free
> > hwlock") introduces one bug, that will return one error pointer if failed
> > to request one hwlock, but we expect NULL pointer on error for consumers.
> > This patch will fix this issue.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> 
> Could you pick up this patch which fixes the incorrect return value
> issue? Thanks.
> 

I thought I had picked this already, it's applied now. Sorry about the
delay.

Regards,
Bjorn

> > ---
> >  drivers/hwspinlock/hwspinlock_core.c |    8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
> > index e16d648..2bad40d 100644
> > --- a/drivers/hwspinlock/hwspinlock_core.c
> > +++ b/drivers/hwspinlock/hwspinlock_core.c
> > @@ -877,10 +877,10 @@ struct hwspinlock *devm_hwspin_lock_request(struct device *dev)
> >
> >         ptr = devres_alloc(devm_hwspin_lock_release, sizeof(*ptr), GFP_KERNEL);
> >         if (!ptr)
> > -               return ERR_PTR(-ENOMEM);
> > +               return NULL;
> >
> >         hwlock = hwspin_lock_request();
> > -       if (!IS_ERR(hwlock)) {
> > +       if (hwlock) {
> >                 *ptr = hwlock;
> >                 devres_add(dev, ptr);
> >         } else {
> > @@ -913,10 +913,10 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
> >
> >         ptr = devres_alloc(devm_hwspin_lock_release, sizeof(*ptr), GFP_KERNEL);
> >         if (!ptr)
> > -               return ERR_PTR(-ENOMEM);
> > +               return NULL;
> >
> >         hwlock = hwspin_lock_request_specific(id);
> > -       if (!IS_ERR(hwlock)) {
> > +       if (hwlock) {
> >                 *ptr = hwlock;
> >                 devres_add(dev, ptr);
> >         } else {
> > --
> > 1.7.9.5
> >
> 
> 
> 
> -- 
> Baolin Wang
> Best Regards
