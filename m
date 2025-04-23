Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45DD26C3B0;
	Wed, 23 Apr 2025 11:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406983; cv=none; b=BaP1cuaueStgft06kOVvIRylAOB4UkkZ0nrfBiK0M2j4ctpob8nk459XIDkq6twXy5ZQf5xdvpE43z3Yvd5AWKCEjD+6AJKiRfGi9l+1aDUBcr7t+35Ok/XUFuIjrDiFsFuueC0jQZdE/NjSmiNQoBjye8NV2USkZ+7wFvoO8GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406983; c=relaxed/simple;
	bh=9gQdBHfk1ywN0aggsqNk3mATMv3R9dvWr7Yrt3jQDug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Buqfn+nQ1TaOsyqoZ6ymSRk3dnxZTu/gHJUEPYGdMzmY2f/xajfHz07XmruowqJLURLTyuoKHrJig1kYn2aa9FaK1TYqeN45gQ6AUh5Q/iCocEqz+3EBSxEUEzghv8vCT6RAIhyj86r5LFMgS6w0NCPR65SkBh7h9LRCto/j5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=WJ9HXDdU; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="WJ9HXDdU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=6SGq4T6Yl+ZEFobujxjD7bgGVHMB88x+GLXgGlxhZLE=; b=WJ9HXDdUDI4baJC+
	RBvZ+MMGu1nJXIQvaysTTBYz79s6Twl2gqFpGWK8SXEUAjzX1OPOKcxlALsYw/Dc6Uo2vMk11UyPO
	m1n8kxRFO7Lxc/oDv8fgdzhXElr6amgXFVAjhkQecTYFpj+oyuOwvLCTysUcuFlUVA0mYjGS29Xjd
	yahGqA45Ln6VHzNFcouh6tPnCRMbmUUZO6eGkTjwclhkR2MNKLtHWBr31//FCygy8w9Wx4Vk+v4+7
	RiDU0f6gorlw4sgrMQSiCSZI3+QAHXJkD3D1AxoOUlYmQyiJNZyBrsDlAOVX63LjSvoyMBtqRomtY
	6tTkr7XHOU05QRCOhA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u7Y5L-00DJ1C-1u;
	Wed, 23 Apr 2025 11:16:11 +0000
Date: Wed, 23 Apr 2025 11:16:11 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: core: Remove deadcode
Message-ID: <aAjL-1rB3YHMnr9F@gallifrey>
References: <20250420204146.154807-1-linux@treblig.org>
 <60e77932-9be7-443d-aed9-2b54945fdce6@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <60e77932-9be7-443d-aed9-2b54945fdce6@foss.st.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 11:15:43 up 349 days, 22:29,  1 user,  load average: 0.00, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Arnaud POULIQUEN (arnaud.pouliquen@foss.st.com) wrote:
> Hello,
> 
> On 4/20/25 22:41, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > rpmsg_send_offchannel() and rpmsg_trysend_offchannel() have been
> > unused since they were added in 2011's
> > commit bcabbccabffe ("rpmsg: add virtio-based remote processor messaging
> > bus")
> > 
> > Remove them and associated docs.
> > 
> > I suspect this means the trysend_offchannel and send_offchannel
> > member function pointers and the virtio implementation of them can be
> > removed as well, but haven't yet gone that far.
> 
> It seems to me that this API is not safe as it allows an endpoint to usurp the
> identity of another one thanks to the source address.
> 
> So, +1 to remove it.
> 
> That said, to complete the remove it would be nice to also remove associated ops
> declared in rpmsg_endpoint_ops and implemented in virtio_rpmsg_bus.c.

OK, yes I was thinking that but wasn't sure - I'll cut some follow up patches

Dave

> Regards,
> Arnaud
> 
> 
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  Documentation/staging/rpmsg.rst | 46 ------------------------
> >  drivers/rpmsg/rpmsg_core.c      | 63 ---------------------------------
> >  include/linux/rpmsg.h           | 22 ------------
> >  3 files changed, 131 deletions(-)
> > 
> > diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
> > index 3713adaa1608..40282cca86ca 100644
> > --- a/Documentation/staging/rpmsg.rst
> > +++ b/Documentation/staging/rpmsg.rst
> > @@ -110,31 +110,6 @@ or a timeout of 15 seconds elapses. When the latter happens,
> >  The function can only be called from a process context (for now).
> >  Returns 0 on success and an appropriate error value on failure.
> >  
> > -::
> > -
> > -  int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > -							void *data, int len);
> > -
> > -
> > -sends a message across to the remote processor, using the src and dst
> > -addresses provided by the user.
> > -
> > -The caller should specify the endpoint, the data it wants to send,
> > -its length (in bytes), and explicit source and destination addresses.
> > -The message will then be sent to the remote processor to which the
> > -endpoint's channel belongs, but the endpoint's src and channel dst
> > -addresses will be ignored (and the user-provided addresses will
> > -be used instead).
> > -
> > -In case there are no TX buffers available, the function will block until
> > -one becomes available (i.e. until the remote processor consumes
> > -a tx buffer and puts it back on virtio's used descriptor ring),
> > -or a timeout of 15 seconds elapses. When the latter happens,
> > --ERESTARTSYS is returned.
> > -
> > -The function can only be called from a process context (for now).
> > -Returns 0 on success and an appropriate error value on failure.
> > -
> >  ::
> >  
> >    int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
> > @@ -173,27 +148,6 @@ return -ENOMEM without waiting until one becomes available.
> >  The function can only be called from a process context (for now).
> >  Returns 0 on success and an appropriate error value on failure.
> >  
> > -::
> > -
> > -  int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > -							void *data, int len);
> > -
> > -
> > -sends a message across to the remote processor, using source and
> > -destination addresses provided by the user.
> > -
> > -The user should specify the channel, the data it wants to send,
> > -its length (in bytes), and explicit source and destination addresses.
> > -The message will then be sent to the remote processor to which the
> > -channel belongs, but the channel's src and dst addresses will be
> > -ignored (and the user-provided addresses will be used instead).
> > -
> > -In case there are no TX buffers available, the function will immediately
> > -return -ENOMEM without waiting until one becomes available.
> > -
> > -The function can only be called from a process context (for now).
> > -Returns 0 on success and an appropriate error value on failure.
> > -
> >  ::
> >  
> >    struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
> > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > index 207b64c0a2fe..6ee36adcbdba 100644
> > --- a/drivers/rpmsg/rpmsg_core.c
> > +++ b/drivers/rpmsg/rpmsg_core.c
> > @@ -193,38 +193,6 @@ int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
> >  }
> >  EXPORT_SYMBOL(rpmsg_sendto);
> >  
> > -/**
> > - * rpmsg_send_offchannel() - send a message using explicit src/dst addresses
> > - * @ept: the rpmsg endpoint
> > - * @src: source address
> > - * @dst: destination address
> > - * @data: payload of message
> > - * @len: length of payload
> > - *
> > - * This function sends @data of length @len to the remote @dst address,
> > - * and uses @src as the source address.
> > - * The message will be sent to the remote processor which the @ept
> > - * endpoint belongs to.
> > - * In case there are no TX buffers available, the function will block until
> > - * one becomes available, or a timeout of 15 seconds elapses. When the latter
> > - * happens, -ERESTARTSYS is returned.
> > - *
> > - * Can only be called from process context (for now).
> > - *
> > - * Return: 0 on success and an appropriate error value on failure.
> > - */
> > -int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > -			  void *data, int len)
> > -{
> > -	if (WARN_ON(!ept))
> > -		return -EINVAL;
> > -	if (!ept->ops->send_offchannel)
> > -		return -ENXIO;
> > -
> > -	return ept->ops->send_offchannel(ept, src, dst, data, len);
> > -}
> > -EXPORT_SYMBOL(rpmsg_send_offchannel);
> > -
> >  /**
> >   * rpmsg_trysend() - send a message across to the remote processor
> >   * @ept: the rpmsg endpoint
> > @@ -301,37 +269,6 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >  }
> >  EXPORT_SYMBOL(rpmsg_poll);
> >  
> > -/**
> > - * rpmsg_trysend_offchannel() - send a message using explicit src/dst addresses
> > - * @ept: the rpmsg endpoint
> > - * @src: source address
> > - * @dst: destination address
> > - * @data: payload of message
> > - * @len: length of payload
> > - *
> > - * This function sends @data of length @len to the remote @dst address,
> > - * and uses @src as the source address.
> > - * The message will be sent to the remote processor which the @ept
> > - * endpoint belongs to.
> > - * In case there are no TX buffers available, the function will immediately
> > - * return -ENOMEM without waiting until one becomes available.
> > - *
> > - * Can only be called from process context (for now).
> > - *
> > - * Return: 0 on success and an appropriate error value on failure.
> > - */
> > -int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > -			     void *data, int len)
> > -{
> > -	if (WARN_ON(!ept))
> > -		return -EINVAL;
> > -	if (!ept->ops->trysend_offchannel)
> > -		return -ENXIO;
> > -
> > -	return ept->ops->trysend_offchannel(ept, src, dst, data, len);
> > -}
> > -EXPORT_SYMBOL(rpmsg_trysend_offchannel);
> > -
> >  /**
> >   * rpmsg_set_flow_control() - request remote to pause/resume transmission
> >   * @ept:	the rpmsg endpoint
> > diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> > index 90d8e4475f80..fb7ab9165645 100644
> > --- a/include/linux/rpmsg.h
> > +++ b/include/linux/rpmsg.h
> > @@ -184,13 +184,9 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
> >  
> >  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
> >  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> > -int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > -			  void *data, int len);
> >  
> >  int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
> >  int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> > -int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > -			     void *data, int len);
> >  
> >  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >  			poll_table *wait);
> > @@ -271,15 +267,6 @@ static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
> >  
> >  }
> >  
> > -static inline int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src,
> > -					u32 dst, void *data, int len)
> > -{
> > -	/* This shouldn't be possible */
> > -	WARN_ON(1);
> > -
> > -	return -ENXIO;
> > -}
> > -
> >  static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
> >  {
> >  	/* This shouldn't be possible */
> > @@ -297,15 +284,6 @@ static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> >  	return -ENXIO;
> >  }
> >  
> > -static inline int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
> > -					   u32 dst, void *data, int len)
> > -{
> > -	/* This shouldn't be possible */
> > -	WARN_ON(1);
> > -
> > -	return -ENXIO;
> > -}
> > -
> >  static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
> >  				      struct file *filp, poll_table *wait)
> >  {
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
