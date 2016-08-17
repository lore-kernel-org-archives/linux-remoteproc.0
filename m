Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Wed, 17 Aug 2016 08:46:05 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: Fix randomly placed
 semi-colon
Message-ID: <20160817074605.GC4254@dell>
References: <20160720092935.5902-1-lee.jones@linaro.org>
 <20160816125248.GA2775@dell>
 <20160816162643.GO26240@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160816162643.GO26240@tuxbot>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, ohad@wizery.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 16 Aug 2016, Bjorn Andersson wrote:

> On Tue 16 Aug 05:52 PDT 2016, Lee Jones wrote:
> 
> > On Wed, 20 Jul 2016, Lee Jones wrote:
> > 
> > > It should never have been there in the first place.
> > > 
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > I'm assuming this was missed.  Would you like me to send it again, or
> > do you have the original patch still in your inbox?
> > 
> 
> It was applied end of last week, but forgot to respond to your email,
> sorry about that.

Ah, great, thanks.

> > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > index fe03b2a..9823178 100644
> > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > @@ -865,7 +865,7 @@ static void rpmsg_recv_done(struct virtqueue *rvq)
> > >  		msgs_received++;
> > >  
> > >  		msg = virtqueue_get_buf(rvq, &len);
> > > -	};
> > > +	}
> > >  
> > >  	dev_dbg(dev, "Received %u messages\n", msgs_received);
> > >  
> > 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
