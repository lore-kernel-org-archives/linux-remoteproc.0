Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794643103;
	b=RchwSB/sgm+XY7zPx7bbQY2qNiHMZgOJ5lOK3kf2tGW7kQV53Vwm9CTsWTIQm40nEbiu
	 /hm+Ogh0r1821sF4sx1DmuiwfCBNAj/X5y1T/cKLbTPA1TzN84R/D3hlOCcgzLrrun3a9
	 HdMsfmcGA83AAKTEDPKUOmiGy6IUL30XdGN+D8LCrG64Mbjn/4VDElKUxfy1HpiZbt/SV
	 wUYjcVY5gwCW7cwS2wiVbxegRDTuiPhWjEDaI2MdVyFBzQtJmgHqEGtL172fWqbmPjqFQ
	 HPuhHKqDVuhR5waHc+UbLV8q7/l13Txa2xNclQLoddq7GMN7sVWxQv80zAlFt3akKdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643103;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=jA+sLX6FuAJLOpO1NCKwUHJ+bXZyD4SXvSbfSoXOmV4=;
	b=bcQ0c4lGeZl/DijDpJKUH8SfActGhMRV8tZb/Lf/SQHX8O1umCIEflu867Jvum+0ut/s
	 OOeZYiiL9U3OjZdO6o5luO1gbXtMsEuVKUMlwwfbdhPaugmVVuCN+EkeMS66wzlTDB5gn
	 /GSeQ2LwEN0WwtySUFPui2U20fiKXWmuF45Fn8NGTI/mKKV4Ucx3WVFFeeqV9Ta5cLDoj
	 BQnEPioFTiwwzCgu+scx429t1WubtmBCZR9/1rgLzFVXonm0kEZmqsDmAJT1pNVwXzMIp
	 ggaaAgPYxVz0c004hHYIvdFXYdnZpi+84wjK2fxN1F4cTK4G4h4NKAokCngrdf23Kzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Jw821QTM;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=sEN3M3QT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7585E606A329;
	Sat, 14 Nov 2026 07:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7585E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Jw821QTM;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=sEN3M3QT
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1794643103;
	 b=j18T7P8OLz23F4O0dbuMkx7PEuhUq834qn3zKSMBrKrT2Jwfin8Nf5U4VN/G17J7WTWOd3PFTb
	  4xuk3iTeBQBzs3E2XpkTgC8fEwu0uLPWm2TOWmNCfB5pPMbW7OgRZ1AryYBoxyx3DdewVecVkH
	  X1sd2lJwDTsLivuJk3py8LCphNA9hg+qw/fbHcc93esqLdVK67Y03BPrOXwRkkyQbqYnO1ARSm
	  EBRgNDHRliZ7owOoVjEquWZHK7dt9G6z65fOc2qJ/BZzlD+O9waYxNpZ0PgbPfd6DcF4sxUNmT
	  PrSOgPjNFm4ZCDuCsRran2ApiTsIvEHjRYFdX6UWvAh9yA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1794643103;
	bh=8IWj/0VY0T5tZdfo4gxNmRXp9p/VjborN97vhgdYfz4=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=Iti61JCNJEmNvvEbo/WXhKfpwitt/kuzuitX11Q+dm32AOTo+cKBqRCt8ctNEFURg4ojN82klz
	  KWoufIb2KtkcgxA2cUuVYbDYDOephagddCcVS0AM4A+NrbBECjPiff7Si97N3yo5WgDYbdOUmx
	  Jg6E0kTmVcBpuvpy/WInIhqtvwykmisdKeB2LAl4dMegHedyys8Q5WV4d+PROIoe9aoJbJugRT
	  02K0v8vA+Y4lu2uuVK2ct5e13Sey1tQWk+C6RojHgngoC3BRrtPImNFzuiTlbugvcmbVc6YkDY
	  KHkS6UeUgqC5rxPYU+Er9S9hu3zPLy8lHdpjbpYFa9evbw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=jA+sLX6FuAJLOpO1NCKwUHJ+bXZyD4SXvSbfSoXOmV4=; b=Jw821QTMKKOaj7xHKWpob8aYyw
	O7HnQoQay01yk38W1E7fizlbf+mV9BeV4WMRuGYca1sgYN9Yp28qtqfvCJ0mbf2dL8UlnGK9VG9Lv
	cM+pAeZIJQ9BPmclX3RYhVgRpPmWEHH2rc7tYJ6TOf0tcRrD0ie5+kwjVwtVEdJDVzM4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8eN-00000009kGY-1VZO;
	Sat, 14 Nov 2026 07:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=jA+sLX6FuAJLOpO1NCKwUHJ+bXZyD4SXvSbfSoXOmV4=; b=sEN3M3QTXDHOH2KkWCqKKNKp2r
	1ooxvN2B2ME9NDt15AUqxezXl9/UAtaoRxDDZgA8kFXll/hUNN8ACcXIHwGkJvCrLmQBjLvel98p+
	izoR2TSwC5nxcK6MIKKpb7gIoh8O8l9KVHUaj3bL/tPaA4EYnuUx5GiaqpUSEBcSGI2E=;
Received: from [95.75.15.255] (port=5081 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8e5-000000002dU-2bF5;
	Sat, 14 Nov 2026 07:57:57 +0000
Date: Sat, 14 Nov 2026 08:57:55 +0100
From: Francesco Valla <francesco@valla.it>
To: Stjepan Poljak <stjepan.poljak@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andy Lutomirski <luto@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] virtio_ring: reject a split ring size that is not
 a power of two again
Message-ID: <avgUMQjBDIGskHBK@bywater>
References: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
 <20261112154927.4004184-2-stjepan.poljak@gmail.com>
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
In-Reply-To: <20261112154927.4004184-2-stjepan.poljak@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: d007c9255e1dc8e1719b5f0a439717f7
X-AntiAbuse: ID - d007c9255e1dc8e1719b5f0a439717f7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xS8eN-00000009kGY-1VZO-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Thu, Nov 12, 2026 at 04:49:16PM +0100, Stjepan Poljak wrote:
> The split ring indexes its avail and used rings with num - 1 as a mask,
> so its size must be a power of two. Commit 2a2d1382fe9d ("virtio: Add
> improved queue allocation API") moved that check from
> vring_new_virtqueue() into the new allocation path, which
> vring_new_virtqueue() does not use.
> 
> remoteproc calls vring_new_virtqueue() with a ring size from the
> firmware, checked only to be non-zero. With 100 entries, for example,
> the driver would put buffers 4 and 8 in avail slot 0. The device would
> look for them at slots 4 and 8, possibly reading the wrong data.
> 
> Put the check back for the split ring; the packed ring has no such
> restriction.
> 
> Fixes: 2a2d1382fe9d ("virtio: Add improved queue allocation API")
> Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
> ---
> remoteproc still reports this as -ENOMEM, although the "Bad virtqueue
> length" error names the cause. Returning an error pointer from
> vring_new_virtqueue() is left for later; the same change for
> vring_create_virtqueue() is here:
> https://lore.kernel.org/r/20261106055635.3019889-1-stjepan.poljak@gmail.com
> 
> v2:
> - Log with dev_err() rather than dev_warn(), and say in the message why
>   the length is bad (Francesco)
> ---
>  drivers/virtio/virtio_ring.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index f683a2d6a200..f855b8d41575 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -3513,6 +3513,13 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
>  						    name, map);
>  	}
>  
> +	/* The split ring indexes its rings with num - 1 as a mask. */
> +	if (!is_power_of_2(num)) {
> +		dev_err(&vdev->dev,
> +			"Bad virtqueue length %u (not a power of two)\n", num);
> +		return NULL;
> +	}
> +
>  	vring_init(&vring_split.vring, num, pages, vring_align);
>  	return __vring_new_virtqueue_split(index, &vring_split, vdev, weak_barriers,
>  				     context, notify, callback, name,
> -- 
> 2.53.0
>

Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it> # AM67A, rpmsg with R5F

