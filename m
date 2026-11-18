Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795021044;
	b=BPPfyp8Klk3HRHOu3B+l1SRHU+EMiZksquH03DTwHMvZVxzfgyQcrDyN3XaffZSLHNiM
	 0udFnYc1nwpkWbUpHq2yVVZ6xi2PmpQkPP1qGwn4siRdBWmdlZTh9/8o30ppSqmg2dwC/
	 f/lPJJqG1nbPNF63P+RP2/nkPFi3ZNIe8cDpv1D0Dm0NsmDYrE+6qS/IF1d/uEO2TKcqc
	 3/SOOFsfb3OofDsYp5NgMC6VpGFBU/ZWrgl/fvvGlwIt89qoTvJiLyJKddJhaxHBgw//p
	 WJtMEhXzYrDuTLMCHXJ1zcOb+qvR9w1lyYjchNE1ZztrUYjOc4Y0RNFd5CD6y1djWMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021044;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=E9FhdOzP5ZynSSk5St9mPIowx9IFUjg5i6MpN0Fa1Pc=;
	b=ykfK7lgWlJHBhDoeB2VyJAIctUy2XFAVBn/psK2YjjZOLwSAjzi3f52S+JIXgKw6h6P8
	 yzBRUgKK8f/XWiDSNzlsjpU/cSZ+5s3yeZ3+F2IDuZAODmAbtAfUq/R1c0yPiNIw/yAbt
	 q06kYq7XM706ZJTqET7zM3v8ZA3gIwhuxpZv6oba4+Fv5SIg1cM/mH4IXEigCYEqSs3br
	 Grp42hSplP4Dq/PXM+B0tgqRqRcZ4coC6aYURwoWdko2onRmG1vFS8uWTryC/nCJh2txf
	 6lM44jLbqYDlmNAWk9FtOtGmcTCHYUYT36+we2K4526/NfTvO7jtvW/aBWA0zT28bVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=CyXo2gaR;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b="uLDs+Y/h";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.0
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F55606A31C;
	Wed, 18 Nov 2026 16:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=CyXo2gaR;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=uLDs+Y/h
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795021043;
	 b=ir5Y+kvHP3hWJBSd6dcHX3eMb13s1c5eUFqJayeFhuo314FOVCjAB4pxi7wAYVVcTkK70WrWQs
	  sbjWV4fVwbAvS3p8V7z5mlTKavpfqpAe0aI48wpO4YNu/ZnoSjYEFAlvweTJ/pQYiKNvneL9c+
	  7m9y9bCa/RVCFZWcjV8l2nbQ+9e2KvJoj0L8Df9ZaQOptIo7sPzLjxtBtTytf6x9hbTxfIxFYp
	  mSte7Nmc1yCJX3XolCr/rFQwqa5NPdGRSQxfD+uhyv1queSOPXHlCFixrHH3iCUM+lj+Oss/HM
	  8v415hMiwkPVEeBuPfy3j5IN2tsaubEsMl+dyfu5awXe2g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795021043;
	bh=aRauEzEm9KJvgMxZfWxX9RLzk5cqBlZBzRacW5B5VF4=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=C/U12eqIV6Eil8Pqud7j3X3KcrLsDGYnTdO0Sqk0nZKnqUEsH2RSd5JOvVLuQSdFIeWkoHOWb9
	  kcoy11iCiRhqhppR8tBqZQKWUxxuEUkmOjGcw34aB4fk7TstVc90y3ClmC01MEyojgBeZt2AQq
	  Cwokpe8M6NOJ5DdFvCBg85ajzXdwaeMsjcBDIxeXxyLvs7znFuXUCLhCR0FVOpUn/bYZuK2piW
	  Rr4K8SsfSgxm9cFEzB8z7FFU94ip+t1pLA8phaUBh7+3YxQiJJjOat6p+vanRkcUvfAiNAXlBq
	  o49WfNDFAConlGSv9YPZd74t78wvJ370TaKpvbizp6ixwQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=E9FhdOzP5ZynSSk5St9mPIowx9IFUjg5i6MpN0Fa1Pc=; b=CyXo2gaRGNAAaZuXXpAzf4ImSG
	Qaxl4tOXxKRpne1I7muoM+Gx3kcGAN1onYnwDXZFRLhaNP29Ec26NDTX7398+eJKEojdhOJd+HLTH
	TVFvlINqafvpvsJq0xTKOWUMRFhxIxiFcNJHTy67fouMIet9PeEv8iKyhWUiz05cmtkY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiyC-000000012Zu-1T28;
	Wed, 18 Nov 2026 16:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=E9FhdOzP5ZynSSk5St9mPIowx9IFUjg5i6MpN0Fa1Pc=; b=uLDs+Y/hRV36+mTdYceAsGnoEt
	YIRfu+D0cLnE4TGNgnlWDiqk1yPsdro8Z7AwtIfkGHRiWn6l5N6rfyjUp5z5xttPEZqSj+XgnyCsZ
	lhjn2Gf9c9/b5zIiuCclja1adyCmyUHvKFBPnxa4sg+UsfT4qck+TLEPzHUsUdo7xLpk=;
Received: from [95.251.96.187] (port=63048 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiy7-000000001Wr-2omQ;
	Wed, 18 Nov 2026 16:57:11 +0000
Date: Wed, 18 Nov 2026 17:57:10 +0100
From: Francesco Valla <francesco@valla.it>
To: Chrispine Tinega <dev@chrispinetinega.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: k3: Report a remote crash to the
 remoteproc core
Message-ID: <av3YQ1tKSABEha9o@bywater>
References: <20261116184146.1897281-1-dev@chrispinetinega.com>
 <20261116184146.1897281-2-dev@chrispinetinega.com>
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
In-Reply-To: <20261116184146.1897281-2-dev@chrispinetinega.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 63f6338b6d20d07c2316917f232833b1
X-AntiAbuse: ID - 63f6338b6d20d07c2316917f232833b1
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTiyC-000000012Zu-1T28-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Chrispine,

On Mon, Nov 16, 2026 at 09:41:44PM +0300, Chrispine Tinega wrote:
> A K3 remote core that faults can send RP_MBOX_CRASH over the mailbox,
> but k3_rproc_mbox_callback() only logs it. The remoteproc core never
> learns of the crash, so its recovery never runs, the crash is not
> counted, and the core stays halted with every rpmsg channel to it dead.
> 
> Call rproc_report_crash(), which may be called from atomic context. The
> core then moves to RPROC_CRASHED and the crash is counted. Where the
> driver leaves recovery enabled, recovery stops the core and boots it
> again. Where recovery is disabled, the core can still be stopped and
> started again through sysfs.
> 
> Recovery on its own cannot yet restart an R5F: the reset the R5F needs
> before it starts again is applied in its unprepare() op, which sysfs
> stop calls and recovery does not. The R5F driver keeps recovery
> disabled, so this does not change what happens there.
> 

Did you have the chance to take a look at the review sashiko did [1]?
I think the points about the leaks in IPC mode make sense and are worth
an investigation, both for the M4 and R5F cases. 

> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
> ---
> Changes in v2:
> - Drop the dev_err(). rproc_report_crash() already logs the crash
>   and names the core. (Francesco)
> - Say in the commit message that recovery cannot yet restart an R5F.
>   (Francesco)
> 
>  drivers/remoteproc/ti_k3_common.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 4b6da3363..43a7a21fd 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -60,11 +60,7 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>  
>  	switch (msg) {
>  	case RP_MBOX_CRASH:
> -		/*
> -		 * remoteproc detected an exception, but error recovery is not
> -		 * supported. So, just log this for now
> -		 */
> -		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>  		break;
>  	case RP_MBOX_ECHO_REPLY:
>  		dev_info(dev, "received echo reply from %s\n", rproc->name);
> -- 
> 2.53.0
> 
> 

Regards,
Francesco

[1] https://sashiko.dev/#/patchset/20261116184146.1897281-1-dev%40chrispinetinega.com

