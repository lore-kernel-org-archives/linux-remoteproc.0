Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476978;
	b=rxmMqstK6kv60k77i54/dwL8urtMGbL1V3MHwx5SEzWTyM0oXY8n21iwCaVl7WIwQYPx
	 FreDJJAvuxwvormEOz4+E1tkt8IxwZM4+tDtHHLYQcaCrDjljV8QiwxQZoS9B/7lerjPO
	 M4/kqshMuHM/56D2oUVaUdJZg4rTWjySFjparSoPIAejFm/bLvwri0mNE7edkNjTo1tNT
	 KOqTDMB1AXZA5kL2gGp9ioS6C+8xYmUADNyZchJstVIX5O94pgsarU2jp43dSB1b2WGuQ
	 4kokmz1UWtmgvWyx3ZYyHzE1AlYmG5BmPJK9NLXWfrWU6wlh1eov6pRQsPg/euuktiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476978;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=FiokM/79h1GYgap34qtlLMjptwz7coupGukI0mSa3DI=;
	b=iHKw9BaqEm9AjikXTgwyk2dDAZUMJw/OATCZeUwNiqQND8pT3frjl/8TW0g1WDRVNPNT
	 89jDj2+NnUT/Xr+LDeybDyH+5Z5C9Dgwgv/t52ErZ4IhFpYQaT3pvkFKWnsirv/8emqmw
	 v2ozYXVgo2IA2ZsNRVlqAFBpO0WVF8NQvLjl2Ba8e919NF0bpqx0u/6e9D956/J+VwwpB
	 EB/fWtSQpQtOLEgBLINrRs7kk4drUGtbnX16uVVRPfObhNi5KsOXymfTGjkrD4NSOHTPB
	 3XuHijDZmALIDZbr3YdLHeCvz8tXpgBmuM3DJoFWIkGKtRulgqG8Fyuz1glTZ5DAYUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=W3lFkIpU;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=kPX5RPme;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119D7606A326;
	Mon, 23 Nov 2026 23:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=W3lFkIpU;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=kPX5RPme
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795476976;
	 b=YaJq2CmAaLfIrCijVpb48W/PnMqpUNOpSe7DJNm8j1/2JDvERkxCO05e2Fg8MEChcNmZ/gZ7dm
	  ABVn4uaKuoDoZJ9ZIXlsLlndiJOO5F1KsA0zxvOInHkcgntCjembr9vuCRsFGlMr47qiXpKLGO
	  o7YqQQAFQGJoQgODDEdZ2PmrVWKbt0MrcZ+yyb3ZBjk6yTzetIotV5Aixhf+TmtRc9iuXUtQ2N
	  TROh33JGbCT8+qH5cxhKX5C+fb+JN46Ulx4ItkmWEyspCgjxzgysbhkgOMqcrnAivDXBKR+L85
	  FU0e/YrEoIMdBjvv75ek0dLTcAEGvNVwMwd2zgTWktmCHQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795476976;
	bh=LtMDB5rX/qANEMMsA6sWFEp9CxUv+z596gASJTuT+E0=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=qluWSMDs4KjDh94sReP64lToTEoJodr6BQ6NS/BEgH2bfviobVT3VhdsOiprCeCv1ZOiT6Htjn
	  YPHR54AbnqH+WacPpeXzmdOORMQFBXrYvaf+FDdt0T/sZHqYmhSsEmC1/eNd1q4esR0UU2OGUR
	  b0EVpPRZQTevbXQEx+LG6kLU0JVDXzLaU/U6t9nY8eyWaiqQVFrBTGx7MBC5SAl3riXEb8W4XX
	  qsfCL+ALRFR0Q2k7rAdXr/p9RDkQUArGa185zNnD44Bx5HAWesnfHg//jbwBSpWwzx2RoC1h/R
	  7FWNyGeE+7p4lzTkKkFAjIuyq2YR7SErtGhZadiCd/7LpA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=FiokM/79h1GYgap34qtlLMjptwz7coupGukI0mSa3DI=; b=W3lFkIpUpMfOdE3JZIUUWQ89WK
	khCAgWD5Ht1tTfBB+cBhQM7rmZl9IovxkV7+nRNSJpzRJDuv4xJcfz1DOcRJjqi24oQ9DjzJ2Dxwo
	7WJnRs30JkUXqduomeQAerNF9DEjs0K0t9UeiQzlyPwBesqRVLdC8WKPxTN+7Z+43rNM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h034.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xVdZw-0000000CNYl-38x6;
	Mon, 23 Nov 2026 23:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=FiokM/79h1GYgap34qtlLMjptwz7coupGukI0mSa3DI=; b=kPX5RPmeVBZzuw5txO1cBQKxFP
	WjMdh6pKPiFSkFqjW4DZYvlgdSWw6mxr6RgPieU39uF+54JIvcmVxziS6dSf+0j2HN7BKLMytg8zZ
	eabtmXDLfG/udH/XUXvsRW32o2uLzJ7o4JYsLJ9aI+6z26yclclS0Q/8N4fHBRRzqKsc=;
Received: from [79.28.115.6] (port=61238 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xVdZr-00000000HoY-3Mhq;
	Mon, 23 Nov 2026 23:36:03 +0000
Date: Tue, 24 Nov 2026 00:36:02 +0100
From: Francesco Valla <francesco@valla.it>
To: Chrispine Tinega <dev@chrispinetinega.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: k3: Report a remote crash to the
 remoteproc core
Message-ID: <awTNPgXzzoIsUJtc@bywater>
References: <20261122221755.88160-1-dev@chrispinetinega.com>
 <20261122221755.88160-2-dev@chrispinetinega.com>
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
In-Reply-To: <20261122221755.88160-2-dev@chrispinetinega.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: b07f524d4c50074e27d4ce78416c59d4
X-AntiAbuse: ID - b07f524d4c50074e27d4ce78416c59d4
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xVdZw-0000000CNYl-38x6-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Mon, Nov 23, 2026 at 01:17:53AM +0300, Chrispine Tinega wrote:
> A K3 remote core that faults can send RP_MBOX_CRASH over the mailbox,
> but k3_rproc_mbox_callback() only logs it. The remoteproc core never
> learns of the crash, so its recovery never runs, the crash is not
> counted, and the core stays halted with every rpmsg channel to it dead.
> 
> Call rproc_report_crash(), which may be called from atomic context, when
> the core is RPROC_RUNNING, that is when Linux booted it. The core then
> moves to RPROC_CRASHED and the crash is counted. Where the driver leaves
> recovery enabled, recovery stops the core and boots it again. Where
> recovery is disabled, the core can still be stopped and started again
> through sysfs.
> 
> In any other state, keep only logging the crash:
> 
> - An IPC-only core, RPROC_DETACHED or RPROC_ATTACHED, was not booted
>   by Linux. Once marked crashed, rproc_detach() refuses it, and the
>   drivers' remove paths skip the detach and leak its resources. The R5F
>   has no start or stop ops in this mode at all.
> - Each K3 driver requests its mailbox before devm_rproc_add(). A crash
>   queued then would not be cancelled if probe failed, and the work
>   would run on a freed rproc. The state is never RPROC_RUNNING there.
> 
> Recovery on its own cannot yet restart an R5F: the reset the R5F needs
> before it starts again is applied in its unprepare() op, which sysfs
> stop calls and recovery does not. The R5F driver keeps recovery
> disabled, so this does not change what happens there.
> 
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
> ---
> Changes in v3:
> - Guard rproc_report_crash() with rproc->state == RPROC_RUNNING and keep
>   the dev_err() print in other states, so IPC-only cores do not lose
>   detach and a crash queued before devm_rproc_add() cannot run after a
>   failed probe. (Sashiko review, pointed out by Francesco)
> 
> Changes in v2:
> - Drop the dev_err(). rproc_report_crash() already logs the crash
>   and names the core. (Francesco)
> - Say in the commit message that recovery cannot yet restart an R5F.
>   (Francesco)
> 
>  drivers/remoteproc/ti_k3_common.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 4b6da3363..29ca51861 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -61,10 +61,16 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>  	switch (msg) {
>  	case RP_MBOX_CRASH:
>  		/*
> -		 * remoteproc detected an exception, but error recovery is not
> -		 * supported. So, just log this for now
> +		 * Report only a crash of a core that Linux booted. Once the
> +		 * remoteproc core marks an IPC-only core crashed, it can no
> +		 * longer detach from it. The state is never RPROC_RUNNING
> +		 * before devm_rproc_add(), so a failed probe cannot leave
> +		 * crash work queued.
>  		 */
> -		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
> +		if (rproc->state == RPROC_RUNNING)
> +			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		else
> +			dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
>  		break;
>  	case RP_MBOX_ECHO_REPLY:
>  		dev_info(dev, "received echo reply from %s\n", rproc->name);
> -- 
> 2.53.0
>

Tested-by: Francesco Valla <francesco@valla.it> # AM67A R5F recovery off

