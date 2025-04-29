Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A04B644;
	Tue, 29 Apr 2025 20:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957760; cv=none; b=XsVd1LE86ZVXiT8TiMZB+7M9+q5B7n0WIx+6p399LsQwPp7Awj0e775Xew2Yi8JPxEiWooldfGAslOl+kwgFxgXPlZhhx4ckxakebMGqZ5Ozu1X8O20hDOdbtNEzDlUQReAtTTVfN4h01eHJkWhieyt1K6Jesdm6yt6aKoqkj/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957760; c=relaxed/simple;
	bh=VH5bqNnxbRwn1KCKaxLA1QciQh8Of9tAtyhjhCb7GBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZrIZOh0bZqP7a8TqxRwUecVwUUR5cmiDYTCHR7CiCZSskXZgHw3HQ7Cs+/lQOsW7JUk72m+o5aivnpyiQMbfx8+4an8TVvTs8xR8S9xFd2++BsZD1p9doyreLhbAtsQ7sSqEwcPsXoJl+jCS6kc5fFZNfjWrT2HYU3VTamxj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Lr+pTg3g; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Lr+pTg3g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=FFPt3vKpNRH+NXTr58vcBSNwd1IRmCG1j01T3N+19s8=; b=Lr+pTg3gWGP5w0PI
	H22T6gXs3mgcaZUcPbqezd8DWsIymbic+jzZe9RTC/zc8/SQ0zbIdrz4uHxVc5IXCtaq/MTZKq5qT
	FOigu1RN/r2MPart6jYeHD1t8r31n8IHxvRj1ZAeywQiQHfF0BLtXtD2z4AwyotjFigsQmWth75Uv
	/NMrU+F7FuxXkdAFaT23XluXo50SdPMsQ/S8YTdg9FysFYXF/Y022jTKuoopZeEwUPIY/nt4TZiDp
	86WRYAQLyqZvjbxdnxRmDR6bUngVklV/wr1//+0fGymCj1dO4P7yDMd3nMttamC33eDClQrdZc0Aa
	jX1uZjP+pvNzuetIDg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u9rMn-000U2L-0W;
	Tue, 29 Apr 2025 20:15:45 +0000
Date: Tue, 29 Apr 2025 20:15:45 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rpmsg: Remove unused method pointers
 *send_offchannel
Message-ID: <aBEzcYaw63e93fFw@gallifrey>
References: <20250424142746.79062-1-linux@treblig.org>
 <20250424142746.79062-4-linux@treblig.org>
 <aBEh85gDlaEywWtX@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aBEh85gDlaEywWtX@p14s>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 20:15:15 up 2 days,  4:28,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Mathieu Poirier (mathieu.poirier@linaro.org) wrote:
> Hi,
> 
> On Thu, Apr 24, 2025 at 03:27:46PM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > After the previous patch, there are no implementers of the
> > send_offchannel() and trysend_offchannel() methods.
> > 
> > Remove them.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/rpmsg/rpmsg_internal.h | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> > index 42c7007be1b5..397e4926bd02 100644
> > --- a/drivers/rpmsg/rpmsg_internal.h
> > +++ b/drivers/rpmsg/rpmsg_internal.h
> > @@ -50,10 +50,8 @@ struct rpmsg_device_ops {
> >   * @destroy_ept:	see @rpmsg_destroy_ept(), required
> >   * @send:		see @rpmsg_send(), required
> >   * @sendto:		see @rpmsg_sendto(), optional
> > - * @send_offchannel:	see @rpmsg_send_offchannel(), optional
> >   * @trysend:		see @rpmsg_trysend(), required
> >   * @trysendto:		see @rpmsg_trysendto(), optional
> > - * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
> >   * @poll:		see @rpmsg_poll(), optional
> >   * @set_flow_control:	see @rpmsg_set_flow_control(), optional
> >   * @get_mtu:		see @rpmsg_get_mtu(), optional
> > @@ -67,13 +65,9 @@ struct rpmsg_endpoint_ops {
> >  
> >  	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
> >  	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> > -	int (*send_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > -				  void *data, int len);
> >  
> >  	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
> >  	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> > -	int (*trysend_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> > -			     void *data, int len);
> >  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
> >  			     poll_table *wait);
> >  	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);
> 
> I'm good with this patchset.  Can you fix the last paragraph in the comment for
> function rpmsg_send_offchannel_raw() and remove the reference to "_offchannel"?

Sure.  I'll cut a v3 with that as an extra patch at the end.

Dave

> Thanks,
> Mathieu
> 
> > -- 
> > 2.49.0
> > 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
