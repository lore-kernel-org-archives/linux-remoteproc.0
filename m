Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795355839;
	b=Uf7ECexuQoXbMthlhmenVA+6XS8AGTpCjTKuhvT00lRLKcJDDPZDoOeOoRjPaT5aP4Uw
	 16HMaT/PMtx93+bu4R/Adv+DK6lgX9bef1qGg6bTrIf7nd8kPuzSqWXhNP6YcRZz8TBZi
	 +EZT6LDg7Pi3DsxE2jklvuN9B+zBj06mVACnbN0fO9muojmNfvra4/sADRYbwI/580A2b
	 RILjL/EUTUafyRYwFFsTO5FTv0/oXSxN92uZlnZbrYeUmhz9EjmgTIbBfhFzdE5dZVYr/
	 6S9QgjvP6Kc+Sjqe9cWvc32lxvO/hSiv23AyqgSSFZ9mIQOjYZleF1fFE149UnIAB+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355839;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=4fF2AdPLovlTgrv05trEI+vu3qJWwMCKLq0FCu8Va2U=;
	b=baq5iHz9ejyG3FxwA/IFVHShEx+LUtwYd5QnwyilM0+ugx0IlNWIQ3K4yAjAdsABrM/a
	 yRLhyNLhF7RzT32bjSACijLWEKe6GLM8th97U6wAoN1ZebpYV9av6wJZ2glBbIqFccw+Y
	 X1Zq/7IkNoNmEJnRvaZVFcuikGecOHaNcRAcrDaY59E2hEjIEdyG2iKsv0MyxYDqA8Q3e
	 Q2k5S3PrQ+u2UysH/c+1BIdp0X8+mUolZ1UWOkvQSyO0to4nVyTxYLdoKp59qoADkUvrC
	 1s2coqX5ZotnepnayaLCxoWWQak/OSMg01q76XU/HDtrESWKo79EORyp/QL8I8KZMCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=y2XebCiq;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=WMNkyZZH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1FB606A32A;
	Sun, 22 Nov 2026 13:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1FB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=y2XebCiq;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=WMNkyZZH
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; s=arckey; t=1795355838;
	 b=AmEItTvXS4+KrNMIOjISqmNlGG7hF+8yg6a/TRGqrPXQeRJc2UGvtncyHi0w9ilqB2i72J0qWa
	  U6kob6OdBxKHfAOcd+LwbE71RJhkBcEG4iIyLfHHJ2/ZMyw6zh12x5YA2qFg+y3l5jzmkpfyur
	  R5ZXfgpsZYXrG6RCqaERzibGL2fbfN28DbZWTmKpKYl7HEbPsv2a2/q07YmBRp4W/xgwKePdyw
	  BHvJ+phU3HC+xdrwAuvtADbqO7+FUT8hpCpGOkE++HbLaSX29CqFWuUkYMY4iNZGrLYhyifXeR
	  4jfpouJeohH/aW72+T+jTo9xaryuKRr8IFFFO/dBe/MKug==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; s=arckey; t=1795355838;
	bh=0tt+1GrW3Cr3vSd9mkATI6vv0PXUTsO59asYsLZbmig=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=sXn3exswb/fUBSx55AeVx2L352+JeRk8sN+YAXWISAanzlCc7PE+p8421+VbDkUMhrzw2zZRAH
	  PXDqetb5P38KTKhzSsiRoQN4qYi8BqTFuFIM2Ii9PGlyc3h8gRBXMz0hCyqd0IFiadEpkdtnOQ
	  AmBxhP9Z0XCMpQA5XIKfGG47r9WyA/FfCVbQGHOubQ87t3yfoiip4eakorYpzijJR+oYJ0oMsE
	  +KVPYuvZ4V59W9ylbE/5RUaG2WKb0UH9TO3pb6rHo4T0YePjZBDvvtgDkTFrOlAIserZag2vi8
	  j/qiPEHHMP7vDIv6feqHZi2t3kDBcp5l7V4TbFXqT2j58w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=4fF2AdPLovlTgrv05trEI+vu3qJWwMCKLq0FCu8Va2U=; b=y2XebCiqjUwsMTth3h7VOWsSC0
	nKkgH6fKLuU70pxFZq6d3gpHky2NbsaIgxSgdtXvaaKcNTl2D+7cCXVqwS6jsxVmUWRcpTYuBl9yA
	UM83zQY+t8kPoL44Q6lrdJSb+f+h0uei3vdJSPVB7WmQa+IebexZijN92GkNRLYRSRG8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xV846-00000003O8S-2pDi;
	Sun, 22 Nov 2026 13:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=4fF2AdPLovlTgrv05trEI+vu3qJWwMCKLq0FCu8Va2U=; b=WMNkyZZH9YrP14Drz/T+oZ78tY
	ik2ECOgkZCWiIrZuZfdSCNDrLUGAEpLv8pY+wnlrsYRRBUBay6+DOXWrGdRzRJxcQ1VLjcbk70naH
	CUtLKB89cMvfg/TJ+ciFW+a1ovu5aFX3tH5+rhFSgqh4VfckXaH3uBCUh5J4aX5kVqak=;
Received: from [95.251.96.187] (port=62753 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xV841-00000000HFI-3yXI;
	Sun, 22 Nov 2026 13:57:06 +0000
Date: Sun, 22 Nov 2026 14:57:04 +0100
From: Francesco Valla <francesco@valla.it>
To: Chrispine Tinega <dev@chrispinetinega.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: k3: Report a remote crash to the
 remoteproc core
Message-ID: <awL0dXRy62aSnEEt@bywater>
References: <20261116184146.1897281-1-dev@chrispinetinega.com>
 <20261116184146.1897281-2-dev@chrispinetinega.com>
 <av3YQ1tKSABEha9o@bywater>
 <20261118194415.1757945-1-dev@chrispinetinega.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118194415.1757945-1-dev@chrispinetinega.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0c955b43a78436a3441504e7b26b9c53
X-AntiAbuse: ID - 0c955b43a78436a3441504e7b26b9c53
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xV846-00000003O8S-2pDi-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Chrispine,

On Wed, Nov 18, 2026 at 10:44:03PM +0300, Chrispine Tinega wrote:
> Hi Francesco,
> 
> On Wed, Nov 18, 2026 at 05:57:10PM +0100, Francesco Valla wrote:
> > Did you have the chance to take a look at the review sashiko did?
> > I think the points about the leaks in IPC mode make sense and are worth
> > an investigation, both for the M4 and R5F cases.
> 
> I had not, thanks. Both of its points on patch 1 hold, and they have
> one cause: v2 reports a crash for a core that Linux did not boot.
> 
> 1. IPC-only mode. Once a DETACHED or ATTACHED core is RPROC_CRASHED,
>    rproc_detach() refuses it with -EINVAL. The DSP and R5F remove paths
>    only detach an RPROC_ATTACHED core, so they skip it and leak its
>    carveouts and subdevices. The R5F also has no start or stop ops in
>    this mode. On the M4F and DSP, a shutdown would reset a core that
>    Linux never started.
> 
> 2. Probe. All three drivers request the mailbox before
>    devm_rproc_add(), so a crash queued during probe is never cancelled
>    if probe then fails. In IPC-only mode the crash work can itself
>    cause the failure, by setting RPROC_CRASHED before rproc_validate()
>    runs. A crash the core sent before Linux probed is enough, since it
>    waits in the mailbox until the channel is opened.
> 
> For v3 I report the crash only when the core is RPROC_RUNNING, and keep
> the log line otherwise:
> 
> 	case RP_MBOX_CRASH:
> 		if (rproc->state == RPROC_RUNNING)
> 			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> 		else
> 			dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
> 		break;
> 
> An IPC-only core is never RPROC_RUNNING, and no core is before
> devm_rproc_add(). A core that Linux booted takes the same path as in
> v2, so your stress test still covers it. Patch 2 is unchanged.
> 
> Recovering an IPC-only core needs the core to handle a crashed attached
> core, for instance as RPROC_FEAT_ATTACH_ON_RECOVERY does. I would leave
> that for a separate series.
> 
> The review also points at an unbalanced put_device() in
> k3_rproc_unprepare(). I think that one is older than this series:
> stopping an attached M4F or DSP through sysfs reaches it with no crash
> at all. I will check it on a board and send it separately.
> 
> v3 builds with W=1 and checkpatch is clean. I will post it once your
> stress test is done, unless you would rather have it now.
> 

I'd prefer not to declare a Tested-by against a known buggy patch.
Please send a V3, and I'll reply there.

> Regards,
> Chrispine
> 

Reagrds,
Francesco

