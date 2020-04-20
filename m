Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-3-mathieu.poirier@linaro.org> <e980e9e6-04d6-60b8-c921-d2fb1f2b9a1b@st.com>
In-Reply-To: <e980e9e6-04d6-60b8-c921-d2fb1f2b9a1b@st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 20 Apr 2020 15:29:24 -0600
Message-ID: <CANLsYkwYFDYeG8SZ+0S_-cY7GA3iFbU5czKyKgGmkObXXpgc2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] remoteproc: Split firmware name allocation from rproc_alloc()
Content-Type: text/plain; charset="UTF-8"
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>, Alex Elder <elder@linaro.org>, Markus Elfring <Markus.Elfring@web.de>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hey,

On Mon, 20 Apr 2020 at 03:24, Arnaud POULIQUEN <arnaud.pouliquen@st.com> wrote:
>
> Hi Mathieu,
>
> On 4/15/20 10:48 PM, Mathieu Poirier wrote:
> > Make the firmware name allocation a function on its own in an
> > effort to cleanup function rproc_alloc().
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
> >  1 file changed, 39 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 80056513ae71..4dee63f319ba 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
> >       .release        = rproc_type_release,
> >  };
> >
> > +static int rproc_alloc_firmware(struct rproc *rproc,
> > +                             const char *name, const char *firmware)
>
> nitpicking: here you do not allocate memory for the firmware but for its name
> The name of the function seems to me quite confusing...

Ok, I'll see if I can find something better.

>
> Else LGTM for the series

V3 will be out shortly and it will be fairly different from this one.

>
> Thanks,
>
> Arnaud
>
> > +{
> > +     char *p, *template = "rproc-%s-fw";
> > +     int name_len;
> > +
> > +     if (!firmware) {
> > +             /*
> > +              * If the caller didn't pass in a firmware name then
> > +              * construct a default name.
> > +              */
> > +             name_len = strlen(name) + strlen(template) - 2 + 1;
> > +             p = kmalloc(name_len, GFP_KERNEL);
> > +             if (!p)
> > +                     return -ENOMEM;
> > +             snprintf(p, name_len, template, name);
> > +     } else {
> > +             p = kstrdup(firmware, GFP_KERNEL);
> > +             if (!p)
> > +                     return -ENOMEM;
> > +     }
> > +
> > +     rproc->firmware = p;
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * rproc_alloc() - allocate a remote processor handle
> >   * @dev: the underlying device
> > @@ -2007,42 +2034,21 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >                         const char *firmware, int len)
> >  {
> >       struct rproc *rproc;
> > -     char *p, *template = "rproc-%s-fw";
> > -     int name_len;
> >
> >       if (!dev || !name || !ops)
> >               return NULL;
> >
> > -     if (!firmware) {
> > -             /*
> > -              * If the caller didn't pass in a firmware name then
> > -              * construct a default name.
> > -              */
> > -             name_len = strlen(name) + strlen(template) - 2 + 1;
> > -             p = kmalloc(name_len, GFP_KERNEL);
> > -             if (!p)
> > -                     return NULL;
> > -             snprintf(p, name_len, template, name);
> > -     } else {
> > -             p = kstrdup(firmware, GFP_KERNEL);
> > -             if (!p)
> > -                     return NULL;
> > -     }
> > -
> >       rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> > -     if (!rproc) {
> > -             kfree(p);
> > +     if (!rproc)
> >               return NULL;
> > -     }
> > +
> > +     if (rproc_alloc_firmware(rproc, name, firmware))
> > +             goto free_rproc;
> >
> >       rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> > -     if (!rproc->ops) {
> > -             kfree(p);
> > -             kfree(rproc);
> > -             return NULL;
> > -     }
> > +     if (!rproc->ops)
> > +             goto free_firmware;
> >
> > -     rproc->firmware = p;
> >       rproc->name = name;
> >       rproc->priv = &rproc[1];
> >       rproc->auto_boot = true;
> > @@ -2091,6 +2097,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >       rproc->state = RPROC_OFFLINE;
> >
> >       return rproc;
> > +
> > +free_firmware:
> > +     kfree(rproc->firmware);
> > +free_rproc:
> > +     kfree(rproc);
> > +     return NULL;
> >  }
> >  EXPORT_SYMBOL(rproc_alloc);
> >
> >
