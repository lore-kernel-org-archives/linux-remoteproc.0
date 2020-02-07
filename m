Return-Path: <nikita.shubin@maquefel.me>
Date: Fri, 7 Feb 2020 09:30:15 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
Subject: Re: [PATCH] remoteproc: warn on kick missing
Message-ID: <20200207063015.GA15993@maquefel.me>
References: <20200206055419.15897-1-NShubin@topcon.com>
 <20200206201827.GP2514@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200206201827.GP2514@yoga>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Nikita Shubin <NShubin@topcon.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Feb 06, 2020 at 12:18:27PM -0800, Bjorn Andersson wrote:
> On Wed 05 Feb 21:54 PST 2020, Nikita Shubin wrote:
> 
> > .kick method not set in rproc_ops will result in:
> > 
> > 8<--- cut here ---
> > Unable to handle kernel NULL pointer dereference
> > 
> > in rproc_virtio_notify, after firmware loading.
> > 
> > At least a warning needed on attempt to call missing method.
> 
> Is this not a fatal error only happening during development? In which
> case the NULL pointer dereference will come with an oops with sufficient
> information to pinpoint what's going on?

Hello, Bjorn.

This error is happenning if no kick method was defined for struct
rproc_ops, like, for example, in imx_rproc. 

Looks, like if we have a resource table with defined vring's in it, a
virtqueue will be allocated in rp_find_vq, passing rproc_virtio_notify.

But may be it's a better way to refuse calling vring_new_virtqueue if kick
method method is not defined. To avoid explicit load in rproc_virtio_notify.

> 
> Regards,
> Bjorn
> 
> > 
> > Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> > ---
> >  drivers/remoteproc/remoteproc_virtio.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index 8c07cb2ca8ba..77a81f331e3f 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -32,6 +32,12 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
> > 
> >         dev_dbg(&rproc->dev, "kicking vq index: %d\n", notifyid);
> > 
> > +       if (unlikely(rproc->ops->kick == NULL)) {
> > +               WARN_ONCE(rproc->ops->kick == NULL, ".kick method not defined for %s",
> > +                       rproc->name);
> > +               return false;
> > +       }
> > +
> >         rproc->ops->kick(rproc, notifyid);
> >         return true;
> >  }
> > --
> > 2.24.1
> > 
> > Confidentiality Notice: This message (including attachments) is a private communication solely for use of the intended recipient(s). If you are not the intended recipient(s) or believe you received this message in error, notify the sender immediately and then delete this message. Any other use, retention, dissemination or copying is prohibited and may be a violation of law, including the Electronic Communication Privacy Act of 1986.   ??
