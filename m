Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794433912;
	b=iZgany+DmRTkRuiKuWaFnO1cCIZCPBG2OcL6QFcQqgk34fAD0Qr8VIaRdmdqaXKmi9G0
	 5YgNw9lpHzbPsfyHLP/feoddDrxRAs+96oDFNIN8hIBczRHW4XoN1VqWHxrcUoA9L6uid
	 OrS+3l7evtzUWMXoYhuMUBYjJkGUfPGMyjteK45kW4sWxOW+uhhk1gnCUtrsvHGEo22j/
	 wTXjHnUGV4XNiffzGrp2++AaNcnvtK2VyDxY6LvkO/2Ucrk8qUvvz3l6aBN5ahoLBBJ0Q
	 BCftBA0TJBar4x1fHdYdaBdBA6H8AAHAOuDoRgT9tlGw3HwREI6NE5GpveyzUeU6WCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433912;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=Vbx0Meut0QWhwLY5JReWROPpzdfMrBn/4+QeVAVvMPI=;
	b=q2IHGIzht3adCg3KwKzLQ8iW0VFDgTOfmjPkHLCgcnSgpXiLzaHkObRm+pdFHGSiHkX6
	 InrbPPcPtHLSkXh84258Aa4KryqjGx/v8g6FQKcvB12eSiMlgp8G/pQ7mpAzuFCzRPAf0
	 n68PXSx8+8kKy1BcOKR6WiSTGoS01JLV3Q8WMW+vDzWGP8cAzGTLvLxrude2VyQLsABnP
	 v4rCYCy88a0QDT/rW5F/oTQvUl/1iOMIdZ9kDrHXOoMRjGySgVIUW5ohQyKV3xb8PcBxQ
	 EcSwRZ6QMNc8es2L8JKkcQpVREdHtUPNvdpl5533zJMfGz9Ixw6aesH/1ZA2y9htVCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=NnTwU6tZ;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Aq6+g+6A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.3
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38304606A33E;
	Wed, 11 Nov 2026 21:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38304606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=NnTwU6tZ;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Aq6+g+6A
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794433911;
	 b=ND3F96GMx5xmysbEZscOWD0/8W7AFT/P9E8kCj7tsTBUQmuR2xdX/Pix5n5eAQwQHjRwcdWTeC
	  0vyqpQz0hswSAoHaq/QVDpLgVhHGyA0w3CRiLE+zLWASVnZfIlJEE3xOU1YBs2tIABB4hal/Sg
	  U7OXd79oiqnAGaNObUXt2+J4pY33CVu4/M7GdpwtMz2vv94NSsAysvyHn9bFcLmfne15U9dIQn
	  amYxnQwP5FjE6Q7TTVpEH4FtWb1lHtYjraNnZ31RgKtzV1jPpeurT/r08zgXPOiD0641y1IfSI
	  6YsCp3VAYyvlgnjsLWZzzCJwu3h5FUBBnErrnsFtAGhwuQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794433911;
	bh=wE06SBMMCgOMrEf8HNYFL5BLe2cwoz+SLDUxZoCq3sc=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=BgMDhKQVeHeXnEGqrEZ+aBVH8nHuE672uhga3gYvzFV3SWktbBbfFn9JjVi3rYu3ljiATt1+os
	  eMhwy50i8JGQz3ot7B0rXjSoHIhBrS/orNniAMfyolZNur2WDtAJRWf37dStMcRlhCIc/abBN3
	  v/2cOk3Sp/WHUe7aEqJY1gUX2TaWO8xJVdz4m5MWFPXPOxHaMw9oY9LAbo8JZ6VP0Rk+tf4BKW
	  FQ9u76veX0dtsWk3jdpbVjkqIbJ80/Bw49VT1Tz2WLRK7Wiwo+h294KADEG4ESo54wA5pBtk4B
	  5cGAPEAUnSQO2lOhP8doTfmHKS0V8MC7H0I8elH39Gwebw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=Vbx0Meut0QWhwLY5JReWROPpzdfMrBn/4+QeVAVvMPI=; b=NnTwU6tZD2FQ6NgwDw+kPzt4+C
	D9d67nzVI5936as4qcfZzsa7XY37kYjI0cCAOyDjOmYDvPcLJxjR4M5RbdCyf771n66TfyZijZArX
	aGP8YYIEvt910s0xIcj7hyW1dGGVLHlfRDS/IQCusaHkt5OU5LCtR4xNXuPlMs7DzbNE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xRGEJ-0000000H70W-3Ydg;
	Wed, 11 Nov 2026 21:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=Vbx0Meut0QWhwLY5JReWROPpzdfMrBn/4+QeVAVvMPI=; b=Aq6+g+6AcHy0QLhEQnG/yUlCbN
	CN0yTZsZx+Zj6ueBMau198JKdMwt1qNMDLPZa8wVpCgFLb6/3vxBsGUp82I0GXJKh6jC695S/sZC7
	2fnHDs2IBrpXpoUzinQ4bDzc9c2KQd0cn0zP9fc23wgnB0h/ULmL5PsxnPAZBeVCu8yw=;
Received: from [79.17.15.196] (port=62469 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xRGE6-00000000FIH-21LM;
	Wed, 11 Nov 2026 21:51:30 +0000
Date: Wed, 11 Nov 2026 22:51:28 +0100
From: Francesco Valla <francesco@valla.it>
To: Stjepan Poljak <stjepan.poljak@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andy Lutomirski <luto@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] virtio_ring: reject a split ring size that is not a
 power of two again
Message-ID: <avThD0u2WQx8drWl@bywater>
References: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
 <20261111172947.3579982-2-stjepan.poljak@gmail.com>
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
In-Reply-To: <20261111172947.3579982-2-stjepan.poljak@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 23af6812239809e8880aa5e2f221d74f
X-AntiAbuse: ID - 23af6812239809e8880aa5e2f221d74f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xRGEJ-0000000H70W-3Ydg-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Stjepan,

On Wed, Nov 11, 2026 at 06:29:37PM +0100, Stjepan Poljak wrote:
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

Good catch - I think I encountered something like this during my
experiments with virtio-over-remoteproc and ascribed it to a different
cause.

> Put the check back for the split ring; the packed ring has no such
> restriction.
> 
> Fixes: 2a2d1382fe9d ("virtio: Add improved queue allocation API")
> Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
> ---
> remoteproc still reports this as -ENOMEM, although the "Bad virtqueue
> length" warning names the cause. Returning an error pointer from
> vring_new_virtqueue() is left for later; the same change for
> vring_create_virtqueue() is here:
> https://lore.kernel.org/r/20261106055635.3019889-1-stjepan.poljak@gmail.com
> ---
>  drivers/virtio/virtio_ring.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index f683a2d6a200..8da9bd0e70f4 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -3513,6 +3513,12 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
>  						    name, map);
>  	}
>  
> +	/* The split ring indexes its rings with num - 1 as a mask. */
> +	if (!is_power_of_2(num)) {
> +		dev_warn(&vdev->dev, "Bad virtqueue length %u\n", num);

This is definitely and error, and should be logged as such (I know, the
same message is printed as a warn in vring_alloc_queue_split(), but we
have no ABI to align to here).

Also, consider to adopt a message a bit more descriptive; maybe
something like this is sufficient:

   "Bad virtqueue length %u (not a power of two)\n"

> +		return NULL;
> +	}
> +
>  	vring_init(&vring_split.vring, num, pages, vring_align);
>  	return __vring_new_virtqueue_split(index, &vring_split, vdev, weak_barriers,
>  				     context, notify, callback, name,
> 
> base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
> -- 
> 2.53.0
> 
> 

Thank you!

Regards,
Francesco

