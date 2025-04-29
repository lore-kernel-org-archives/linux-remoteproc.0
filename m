Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D5C246762;
	Tue, 29 Apr 2025 23:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970463; cv=none; b=ftI5GpX2+C0C+v3cU6vJ9ZiAW/IblbaL/YrHaIccMmwNnTJoxV8rwlY7sXLLuCdIqcGp1zgu7YB/OuVF7X9bsX4M0TKqr65w2O1DGT4LC0pkjVIHENrHHlz9L72Sp6bSIns+qE4D2mstONi4K2hkhr4ymg29jG5FOXswJNxfylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970463; c=relaxed/simple;
	bh=XkiAREM0que9989LTPRy0Ga/JqzoNw/ix1/Y2kzR1Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUl3wIgm9aLbBz8MvLbhKbrNzo/nuc7VBQPJC6QMguYf5xrPpfoPRDNMOHapyk5kE8U15AK+a609Liz8zTeoFktz73ZKh0P6kbNWnDa80HJAY6Dc9K23jKcXCSI0MieSePV/uxLD5CyYJIPiB/5SeX9UihMAi5rPEfoHPn8KkRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=oj1lLeZD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="oj1lLeZD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=U0saWugJmx2Vge5QQBUQ8pQdCUNf2tXtPiln6IpxNQc=; b=oj1lLeZDB0X6Upyb
	ihEqvpUuNnq00BpLydvh3AIOPIxHi0LTMEiQie/y6wMerIY242+rs0UlhGDtP6ErUNgPHZuTWpqEE
	mH0OMG/xN2NNQDqUI9StoV6yH4pr7CBQVt/0SBt2fFZdr/W1qFi9DJkgjmVO77Xw/YppLrRzHEP/c
	pNeXjd44khC1CjzAMmSfaYf/AfBhJe69cC2f4MqvobyBTnDe5OmoxONL55e1nCtXlUamTWCiRx4Z6
	80gHrWAl0tNGIufEy93h5OGeyGyQsTA2MAO31CsSmds2gQVV255t2PO5un2oNE5Q2bpmswG9Avjbz
	NNZK8Llz/0yguXJXYw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u9ufp-000WJY-18;
	Tue, 29 Apr 2025 23:47:37 +0000
Date: Tue, 29 Apr 2025 23:47:37 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rpmsg: Remove unused method pointers
 *send_offchannel
Message-ID: <aBFlGWI9usTpjQIU@gallifrey>
References: <20250424142746.79062-1-linux@treblig.org>
 <20250424142746.79062-4-linux@treblig.org>
 <aBEh85gDlaEywWtX@p14s>
 <aBEzcYaw63e93fFw@gallifrey>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aBEzcYaw63e93fFw@gallifrey>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 23:46:27 up 2 days,  8:00,  1 user,  load average: 0.06, 0.04, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Dr. David Alan Gilbert (linux@treblig.org) wrote:
> * Mathieu Poirier (mathieu.poirier@linaro.org) wrote:
> > Hi,
> > 
> > On Thu, Apr 24, 2025 at 03:27:46PM +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > After the previous patch, there are no implementers of the
> > > send_offchannel() and trysend_offchannel() methods.
> > > 
> > > Remove them.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >  drivers/rpmsg/rpmsg_internal.h | 6 ------
> > >  1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> > > index 42c7007be1b5..397e4926bd02 100644
> > > --- a/drivers/rpmsg/rpmsg_internal.h
> > > +++ b/drivers/rpmsg/rpmsg_internal.h
> > > @@ -50,10 +50,8 @@ struct rpmsg_device_ops {
> > >   * @destroy_ept:	see @rpmsg_destroy_ept(), required
> > >   * @send:		see @rpmsg_send(), required
> > >   * @sendto:		see @rpmsg_sendto(), optional
> > > - * @send_offchannel:	see @rpmsg_send_offchannel(), optional
> > >   * @trysend:		see @rpmsg_trysend(), required
> > >   * @trysendto:		see @rpmsg_trysendto(), optional
> > > - * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
> > >   * @poll:		see @rpmsg_poll(), optional
> > >   * @set_flow_control:	see @rpmsg_set_flow_control(), optional
> > >   * @get_mtu:		see @rpmsg_get_mtu(), optional
> > > @@ -67,13 +65,9 @@ struct rpmsg_endpoint_ops {
> > >  
> > >  	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
> > >  	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> > > -	int (*send_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > > -				  void *data, int len);
> > >  
> > >  	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
> > >  	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> > > -	int (*trysend_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > > -			     void *data, int len);
> > >  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
> > >  			     poll_table *wait);
> > >  	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);
> > 
> > I'm good with this patchset.  Can you fix the last paragraph in the comment for
> > function rpmsg_send_offchannel_raw() and remove the reference to "_offchannel"?
> 
> Sure.  I'll cut a v3 with that as an extra patch at the end.

Actually I rolled it in, see v3 series starting with message:
  20250429234600.301083-1-linux@treblig.org

that I just sent.

Dave
  
> Dave
> 
> > Thanks,
> > Mathieu
> > 
> > > -- 
> > > 2.49.0
> > > 
> > 
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
