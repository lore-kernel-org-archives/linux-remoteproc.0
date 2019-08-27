Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 26 Aug 2019 22:10:07 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
Message-ID: <20190827051007.GK1263@builder>
References: <20181024011909.21674-1-s-anna@ti.com>
 <40831f80-1e36-66ca-b8e5-684d46ba167e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40831f80-1e36-66ca-b8e5-684d46ba167e@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 09 Aug 13:25 PDT 2019, Suman Anna wrote:

> Hi Bjorn,
> 

Hi Suman

> On 10/23/18 8:19 PM, Suman Anna wrote:
> > The virtio_rpmsg_bus driver uses the "%p" format-specifier for
> > printing the vring buffer address. This prints only a hashed
> > pointer even for previliged users. Use "%pK" instead so that
> > the address can be printed during debug using kptr_restrict
> > sysctl.
> 
> Seems to have been lost among the patches, can you pick up this trivial
> patch for 5.4? Should apply cleanly on the latest HEAD as well.
> 

I share Andrew's question regarding what benefit you have from knowing
this value. Should we not just remove the va from the print? Or do you
actually have a use case for it?

Regards,
Bjorn

> regards
> Suman
> 
> > 
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index f29dee731026..1345f373a1a0 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -950,7 +950,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  		goto vqs_del;
> >  	}
> >  
> > -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
> > +	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
> >  		bufs_va, &vrp->bufs_dma);
> >  
> >  	/* half of the buffers is dedicated for RX */
> > 
> 
