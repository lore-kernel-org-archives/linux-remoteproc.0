Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EEE1E47AD;
	Tue,  6 May 2025 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554279; cv=none; b=JDH/5bjc3c9kS0HjJzX2z73zGzY4BAzNHjVYNm/cYN5ZqZAud/RMqTFiinv7Ck1+eKLopJHGNW2BM7BglV4ZswVq0PvbTzuv1AkiCEQzNUO7ppQ2n91m2O9keJY1MW4pbAHcPLA6ipY4+2NCXyi0wG3sGSMACjPbkW+PK2u04X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554279; c=relaxed/simple;
	bh=L/YmMn9E+CB+W2CvCy6vz77kL1Lfu3TyH3ZZiq9pzbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Th8Hg3vfhMsQBBvBZafDgPtAQHC8/TMi5GSTEmjYfVnR2b1rIIrAVinakQF8AFqvK/kKyGwOr+JeY1zpI908CqkVNi5Ub9InGWSaiSHWzuPSXFFmdErBJQwg1QxeT2duyPbdqpoNeES+5vpRzwC89R/OcuyzM8wqqyCtauyzQbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=nkd/txvX; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="nkd/txvX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=g/TYZFc3o3bXnnvZ1aJqqoE2EVfGr9X4O+HVOwbXN7Q=; b=nkd/txvXPSKBvWhV
	IjskR4N/oz9pSZsl55gGCRP7WkgtykELIENQAeIE7+pNdAvGbrgf9rkOZDC3vQsRhRWPLAzQnkEXq
	5/KIqsQ/zM5nbS+SyycjsLmsaKjEobDQixIsKboLC2EC3M9LS7400lAyt10cg1GWdtrblJz5GtLXc
	1L3xbMAaOzvy2Galdf5jWWw+QUQhVeWSIZ7M7JRgeT9so0FMizo1R2GWGk+Hie+InvI3T77dfW288
	yjH02K/v56H+8H9PAnpuD1dXF1ERfKP/psQEC028y2YPqG/QXOzzYy7J1NS/TqsWLF6PTkst0BSq+
	W1vkoPAKIxh1TgI3RA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uCMY2-001xl5-0l;
	Tue, 06 May 2025 17:57:42 +0000
Date: Tue, 6 May 2025 17:57:42 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] rpmsg offchannel deadcoding
Message-ID: <aBpNlgCJ8zj78kYr@gallifrey>
References: <20250429234600.301083-1-linux@treblig.org>
 <aBpGj35VsjvAjNmL@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aBpGj35VsjvAjNmL@p14s>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 17:57:32 up 9 days,  2:11,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Mathieu Poirier (mathieu.poirier@linaro.org) wrote:
> On Wed, Apr 30, 2025 at 12:45:56AM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > Hi,
> >   This removes a couple of unused functions in rpmsg,
> > and (v2) after discussions with Arnaud, follows the thread
> > and removes code that they would call.
> > 
> > (Build tested only)
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > 
> > V3
> >   Fixup comment on rpmsg_send_offchannel_raw(),
> >   removing the reference to "_offchannel" - as per Mathieu's
> >   review
> > 
> > Dr. David Alan Gilbert (3):
> >   rpmsg: core:  Remove deadcode
> >   rpmsg: virtio: Remove uncallable offchannel functions
> >   rpmsg: Remove unused method pointers *send_offchannel
> > 
> >  Documentation/staging/rpmsg.rst  | 46 -----------------------
> >  drivers/rpmsg/rpmsg_core.c       | 63 --------------------------------
> >  drivers/rpmsg/rpmsg_internal.h   |  6 ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 24 +-----------
> >  include/linux/rpmsg.h            | 22 -----------
> >  5 files changed, 1 insertion(+), 160 deletions(-)
> 
> I have applied this patchet.

Thanks!

Dave

> Thanks,
> Mathieu
> 
> > 
> > -- 
> > 2.49.0
> > 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
