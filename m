Date: Thu, 21 Nov 2019 15:35:38 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: char: release allocated memory
Message-ID: <20191121233535.GW18024@yoga>
References: <20190917033124.1077-1-navid.emamdoost@gmail.com>
 <CAEkB2EQTO3wtCrZgLv068xGpxJYwir_SuMUBK0jGaTU6KdCRNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEkB2EQTO3wtCrZgLv068xGpxJYwir_SuMUBK0jGaTU6KdCRNg@mail.gmail.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 21 Nov 10:20 PST 2019, Navid Emamdoost wrote:

> On Mon, Sep 16, 2019 at 10:31 PM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> >
> > In rpmsg_eptdev_write_iter, if copy_from_iter_full fails the allocated
> > buffer needs to be released.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> 
> Would you please review this patch?
> 

I'm sorry, I must have missed to reply as I applied the patch. You can
find it in the rpmsg-next branch [1] and it will be part of the pull
request for v5.5

[1] https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=rpmsg-next

Regards,
Bjorn

> Thank you,
> 
> > ---
> >  drivers/rpmsg/rpmsg_char.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index eea5ebbb5119..c655074c07c2 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -227,8 +227,10 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
> >         if (!kbuf)
> >                 return -ENOMEM;
> >
> > -       if (!copy_from_iter_full(kbuf, len, from))
> > -               return -EFAULT;
> > +       if (!copy_from_iter_full(kbuf, len, from)) {
> > +               ret = -EFAULT;
> > +               goto free_kbuf;
> > +       }
> >
> >         if (mutex_lock_interruptible(&eptdev->ept_lock)) {
> >                 ret = -ERESTARTSYS;
> > --
> > 2.17.1
> >
> 
> 
> -- 
> Navid.
