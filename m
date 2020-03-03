Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <20200228110804.25822-1-nikita.shubin@maquefel.me>
 <CANLsYkyDsJaxO_37qTjEP+aeQju8W2+jhHFRF7+oifBMqJqyng@mail.gmail.com> <20200302214317.GI210720@yoga>
In-Reply-To: <20200302214317.GI210720@yoga>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 3 Mar 2020 08:56:40 -0700
Message-ID: <CANLsYkwBxNecM4M2Ld_HFecOiQJ=S0FFWQY1KJTwY3VGLyr_FA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: error on kick missing
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: nikita.shubin@maquefel.me, Nikita Shubin <NShubin@topcon.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, 2 Mar 2020 at 14:43, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Mon 02 Mar 09:44 PST 2020, Mathieu Poirier wrote:
>
> > Hi Nikita,
> >
> > On Fri, 28 Feb 2020 at 04:07, <nikita.shubin@maquefel.me> wrote:
> > >
> > > From: Nikita Shubin <NShubin@topcon.com>
> > >
> > > .kick method not set in rproc_ops will result in:
> > >
> > > 8<--- cut here ---
> > > Unable to handle kernel NULL pointer dereference
> > >
> > > in rproc_virtio_notify, after firmware loading.
> >
> > There wasn't any kernel stack trace?  What platform was this observed
> > on? I'm afraid we won't be able to move forward with this patch
> > without one, or more information on what is happening.
> >
> > >
> > > refuse to register an rproc-induced virtio device if no kick method was
> > > defined for rproc.
> > >
> > > Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> > > ---
>
> Nikita, please include "v2" in the subject and add here (below the ---)
> short summary of what changes since v1.
>
> > >  drivers/remoteproc/remoteproc_virtio.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 8c07cb2ca8ba..31a62a0b470e 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -334,6 +334,13 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >         struct rproc_mem_entry *mem;
> > >         int ret;
> > >
> > > +       if (rproc->ops->kick == NULL) {
> > > +               ret = -EINVAL;
> > > +               dev_err(dev, ".kick method not defined for %s",
> > > +                               rproc->name);
> > > +               goto out;
> > > +       }
> >
> > I think it would be better to use WARN_ONCE() in rproc_virtio_notify()
> > than prevent a virtio device from being added.  But again I will need
> > more information on this case to know for sure.
> >
>
> I reviewed v1 and afaict there's no way rproc->ops->kick would change
> and that things wouldn't work without a kick.

Yes, a "v2" tag and a little bit of history would have helped.  We
came to the same conclusion - I couldn't see either how things would
work without a kick(), especially if an rvdev with virtio queues is
used.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
> So I requested that it should be checked during initialization instead.
> Please let me know if I missed some case.
>
> Regards,
> Bjorn
>
> > Thanks,
> > Mathieu
> >
> > > +
> > >         /* Try to find dedicated vdev buffer carveout */
> > >         mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> > >         if (mem) {
> > > --
> > > 2.24.1
> > >
