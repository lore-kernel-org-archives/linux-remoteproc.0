Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A04EADC;
	Sun, 27 Sep 2026 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790500404; cv=pass; b=c7u2M7MNjAt4OhRMzfTTWIwhgatf4/DiUpWnX7Sf1FTCYN5u1zByrtExBZH4VAI0bhrlCTsLKRljuje+zCnlBKEbPBCcLDJ8LNb/bCZ/urTpNLNtP+wBL1fw5LwwSpXOX4qReNtBKf/UE/IzNVMqorH5cn1sjzyNaWeZbt1sfak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790500404; c=relaxed/simple;
	bh=SNKIWFNnS0VUArUn/KxmFRNssgg+dk5u3NSjSYZUIAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1fu1TcSygu/GLuEi/xshoCu6uYF0A1DwOlf2eLuo4KzryVz3UiHJcyBezLCFwNbA0/lGv9HSQn5aIstXNvvMF2mD0+i/n4i1ndVoSsXFV6Nc/gf9VDf3EFPbgA+R42hqcL4L9jj7GsV7FsZEbfwFT3ersv53/USYB7lz7w/ucc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=oqyheQuM; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=bPVhleZR; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="oqyheQuM";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="bPVhleZR"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-mnhb.prod.antispam.mailspamprotection.com; s=arckey; t=1790500402;
	 b=DoZlsWlUd7cEMQBEkc4dKK1gOUQsh19PlrNDgDSXhDqmjXPIH8auvLHiWt94O/XD6hJwO0lGgb
	  tntkbnFOw+8oXrw3Sf+Or/TzBqWXZaGQGbYrEvyYsOgK7m464CpCElBibqyUYDU/5tx0zQFOXO
	  BLnFdbnlpXStSx+Zv8cP6KVGOjAYztRBAfb/k+3KJQUsI7eN6bYvPfbFMDfF+KTwpssb/iEQlD
	  uqLQsX2eOo889GfSZ8EP0VBtO29zzE03gFMW/EPGEupcD5cd28h0V/h1+66tggAUyGHkrYTyYs
	  vgf4D/LdSK2OZ94Cq8tbIIcWFEJb9u/Clg/1fKvYzh9kGA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-mnhb.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-mnhb.prod.antispam.mailspamprotection.com; s=arckey; t=1790500402;
	bh=SNKIWFNnS0VUArUn/KxmFRNssgg+dk5u3NSjSYZUIAA=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=Qhf0YLXdJpfSwRfCoADf7FXNkdczzvlepgPkJYXExFjVIe2vVbVi1k2CghlXf30BmMQN9fle3N
	  hTUdwopEXmf/RDjJbaOughuNkeIbMxmAHLDZF2gm/rm3YzQdkSR3EHjW3iekwXSSV7l16Xqn7E
	  ZbfTgUWN7uaZCukluxnvScZgmwv0E37FvNKAOyylYdB6wW8OwMCbYL1Vi7hYGjTB3k4yfB2yPp
	  x5IKdPv5Kz6FCuRIP0bCX+0bVtdXm+OSoE+wsfBfZvDyv9wFzMZMioACfEOtjVGfJGUdCy/1Ju
	  G2a3TbVkKuHsrU4r6PmyoeDGed2T7C+O6phSt1MhwvHe/w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=9Xa2Y0pVxdUjeYg663aTlxalld9nYFpAs3kaZGjBdxU=; b=oqyheQuMcpeA/NKEsN0fvy/R7p
	N+RjdBGvSQ7j170EOLWvsvIqf7grQTF2UriNh7g6DI9v9kTDqAsV/nuKvboHW31sfCBananX94Ghj
	uGj8NgQa3Wnes2IqUJprH1woCaRk83deImxLeMf6Sp6o6TYNwy7nh8y2HsqI+Egpub3s=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-mnhb.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xAkg7-00000008fQs-0Kh7;
	Sun, 27 Sep 2026 08:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=9Xa2Y0pVxdUjeYg663aTlxalld9nYFpAs3kaZGjBdxU=; b=bPVhleZR6zP8Tkdh/9IgvBTehX
	aqu+/XEft7gHQ5OrAlgSATi7lFA8TABeibvjY3sAdVGmj9MVTViVwjeUSfyhdfP2DbGPAVZq+cFwN
	KRIGizG6NkmNVmG8lCLPhz7R/Ji27O1AUH1Waoo6Wg6Wji4L4geAajIdgB9HN3o0R9jA=;
Received: from [79.45.60.29] (port=59362 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xAkfw-00000000KIY-2epa;
	Sun, 27 Sep 2026 08:56:00 +0000
Date: Sun, 27 Sep 2026 10:55:59 +0200
From: Francesco Valla <francesco@valla.it>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, ohad@wizery.com, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: reset vdev before
 removing it
Message-ID: <arjZvftSMlG3OMHP@bywater>
References: <20260924205901.2505186-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924205901.2505186-2-tanmay.shah@amd.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: cca68de0407fe0b69c6d35b61737c22c
X-AntiAbuse: ID - cca68de0407fe0b69c6d35b61737c22c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xAkg7-00000008fQs-0Kh7-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-mnhb.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Tanmay,

On Thu, Sep 24, 2026 at 01:59:02PM -0700, Tanmay Shah wrote:
> The virtio device is removed when the remoteproc device is removed. The
> driver should issue reset on the virtio device so the remote can do
> corresponding cleanup.
> 

Shouldn't be the driver, and not the transport, the one that calls
virtio_reset_device()?

> Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index d5e9ff045a28..1cb0ee0ea656 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -469,6 +469,8 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>  {
>  	struct virtio_device *vdev = dev_to_virtio(dev);
>  
> +	virtio_reset_device(vdev);
> +
>  	unregister_virtio_device(vdev);
>  	return 0;
>  }
> 
> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
> -- 
> 2.43.0
> 
