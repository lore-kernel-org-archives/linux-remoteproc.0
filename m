Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641380;
	b=v9YDOLAwHDnenZU1+eoT2hVeEd8b1H4LGD9rnkAK7e7t8MFngLFNlilbydKh8+a9TX1F
	 R9PHjdNoZmZKhxt304nCVELZmbQLjX3/FGzsxTshR4YAJO7U+BpSLm0JUCk44INNJKtXT
	 htGauJ1UQKWeVZOaG0KRpO97FW2RR3V52vysgTo5FErdnvgWsMavs+DPhjjakalkfBd+d
	 Yvk5f7qEDDsZ6ozGrzo9tmdceNWy9stErIoFbG8yJfvoCKaD96fe0IbZQLbQQq6ScuxBW
	 VLCY4+8a/oCrWgsqVI7BIiha086CpuCE+sYpG1iWZlkN8upHlIIQruWC+I1vossBU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IF3QP6AWqoRpGnQgFgZF37K62udADGWdf9OtCoGHGQU=;
	b=zwU5HT6xMpccNJTf2nUNPdM/rg5VXGw/7GtN3pZbtvTqqomIOo7Q9iZZ05zRaDUtF3Wx
	 NSP8mP4GmbZ1GHS+QRV9vzzqDO29pxYLiLu9VaHCJsZpg8i1sgKFxD8C/cTp65nVmHQYH
	 pb7s2DQngrIX9Y7j0EfIfiHaIpdKDq0ii0Bmsbafh+yQnM77aRoVoTw9rP+yFP9WtxKqP
	 4vxp9OmfVE2bI8SWrfmQM3R7ULI88uoD/rYobTUUhvLuc11uF0j4DDndsmxPPGYxZDPV3
	 rvQ0FLhygr3xX7Zh7Vj2P0l2/HQpmW4E5v9jRpPKeM1U60zY2DvfTI7XbfnKXxq9B+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Nn5h5T8C;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370C606CEC9
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Nov 2026 17:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1370C606CEC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Nn5h5T8C
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e831e86ebfso20106185ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 09:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793641379; x=1794246179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IF3QP6AWqoRpGnQgFgZF37K62udADGWdf9OtCoGHGQU=;
        b=Nn5h5T8CygzT1p+tLFGcKmhOOj3W0DDg8JCietGAgyWnlceLiS0/W62fWd5k5HWEyv
         OXPG1uEI+vKBn39A0tG1AuIMNO9H8WuEKAl413hRUu5bgEh9pqLMctDFuyz8vf+nr6L8
         qVofI7MolrkgpOmFPwIwzRN2eWe399mCVA03hotlY4uJbT7PrCz1uO/kR6ExK+EFj96M
         m8E8YS6JHotcy2tRP81R3V6Q3/Qgs4za3WoiYLo5hvKdUuYHozaAi69qDJ7Co3EEFiu9
         jC1cf6d4I2TeYSlAoivn1jMufxTz5WsMi1RT1Ym6TlZd9f4KhQogaZq7FP7U0rAmEN6K
         B/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641379; x=1794246179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IF3QP6AWqoRpGnQgFgZF37K62udADGWdf9OtCoGHGQU=;
        b=Mp6hMWiNPGFin/F+Zs/l0yLPb/6emziW4HmzoIxCyvjSk0lW3ICRbt1ZMpoG/dtzD2
         8IEH1tFU8MRZmAzDJXiQe5f4hoP9v/Re9eDPHccfu+2pN0HIGJ7ywXIceqwGOh721NLX
         KdzqwHlVFcHAfF8a8m9A+DS56nDdEyHS6+c49pP9/CmQFnhCxrKljSGyZ3+LupxJe+ij
         4oDIDFgC5bVh2LK2377VqUrdKvVti4MVoKIEDZ/gigs5TZp6H1v2C6NKWiTX1UYXTjsQ
         sml1rRS9/VZG9qKslQl5WoifgvUvQ444EKVG1kKZ1cL011NVGFAcPmpAFfDbDNs3qEOU
         zQrw==
X-Forwarded-Encrypted: i=1; AKwUvBwlBXFY2U+MY1m2ErPmJvIhwqcnqVaGDyOK+40EKpxNnpyIatZXoLZmpqsOBaJ5AuCPbShr0YnIxc1cTp0+m9ao@vger.kernel.org
X-Gm-Message-State: APuU4Z+0ztHiKNh4G2jgiU59f6EUKu0J2eS7CY0ePa6dkzT1ld3WSO7r
	zo5RhsU22S3oE1AgoAcCNipj0gAANZH0KMl2hvmtMOsrAFEO9ESg72oxWzSp/PAqppA=
X-Gm-Gg: AYBFou3cV0xB8ng+K9JC5+7v8klQybse7kLIdg7qDx5imev0tB3Sr/bD7OTK82GL+rF
	0fMFL80L7Z05J0Bz/Tab7spEq7XPPacn57or83ezMJiKB6v+ZbNxLVcfqIzoxRtsw9fltJKou64
	M58ALFqWBli9aSn2CaNmbys4BrwxIUyK+UACPlFeag0CSoKAZQexjyNhb2l4OO57HohxBTpINLP
	PYDe+858XppwjhTk606NGpydZrJ5Sh8+znem3jxifXPGRT5DV/hkva99kBlngqoUtd9arUy9PeJ
	kCLzPMTWu6gTsWw3z/sCVMHcs3+Apunh3147K4quSRlY/izYU4sBG2akqAy8kgeP0Jw2GkwwKIx
	xuq0OOmoJgbEzecv6ruGsO3txPjQIS7RxNw61JO0h94D0hf2cBSnUCWnIDlZr1lIgrv7Y/QV4wI
	4Ih5DD9u8ZMzpsDNo1dxwSlaYIoLQpeC9xpmzQnd9jFOdB6SsrFKE+vFf+cM+E93qqH8CsOaVbX
	zwbtKeTT4ol77sqNJK9T0wOXp/zzr1vXMKDgCG7vNzHUdamn77FeOhOnyvrcLezcpYGSSp8YFlQ
	H1gqU+XvhWpyva26EbRgyCYi0cpdCW0=
X-Received: by 2002:a17:903:3c4e:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2eb364e56d1mr106517765ad.50.1793641379335;
        Mon, 02 Nov 2026 09:42:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:810a:982d:b93e:e497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f56bsm31097845ad.16.2026.11.02.09.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:42:58 -0800 (PST)
Date: Mon, 2 Nov 2026 11:42:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lianjie Wang <karin0.zst@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: virtio: bound the buffer sizes read from config
 space
Message-ID: <aujLoEtfDfXfh2t9@p14s>
References: <20261022194129.2233880-1-karin0.zst@gmail.com>
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
In-Reply-To: <20261022194129.2233880-1-karin0.zst@gmail.com>

On Fri, Oct 23, 2026 at 04:41:29AM +0900, Lianjie Wang wrote:
> With VIRTIO_RPMSG_F_BUFSZ, rpmsg_virtio_get_buf_size() reads the rx and
> tx buffer sizes from the config space as u32 values and checks only that
> each can hold the message header. The probe multiplies them by the
> buffer counts in unsigned int arithmetic to size the buffer area. An rx
> buffer size of 0x1000000 with 256 rx buffers wraps the rx part to zero,
> so the allocation covers only the tx buffers, and the driver posts the
> rx buffers at offsets up to 4 GiB past its start for the device to
> write.
> 
> Reject a buffer larger than the header plus U16_MAX, since the 16-bit
> msg->len cannot describe a longer payload. With at most 256 buffers in
> each direction, this bound also keeps the size of the buffer area from
> wrapping.
> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> Signed-off-by: Lianjie Wang <karin0.zst@gmail.com>
> ---
> The patch is tested against a virtio-rpmsg device added to QEMU. With
> buffer sizes in config space that wrap the size of the buffer area, the
> unpatched driver probes and warns in rpmsg_sg_init() while posting
> buffers past its allocation. With the patch, the probe fails with "bad
> vdev config".
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20b..de4af75ee1620 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -91,6 +91,7 @@ struct rpmsg_hdr {
>  	u8 data[];
>  } __packed;
>  
> +#define MAX_RPMSG_BUF_SIZE	(sizeof(struct rpmsg_hdr) + U16_MAX)
>  
>  /**
>   * struct virtio_rpmsg_channel - rpmsg channel descriptor
> @@ -851,9 +852,14 @@ static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
>  		virtio_cread(vdev, struct virtio_rpmsg_config,
>  			     rxbuf_size, &vrp->tx_buf_size);
>  
> -		/* The buffers must hold at least the rpmsg header */
> +		/*
> +		 * The buffers must hold at least the rpmsg header, and at most
> +		 * the header and the largest payload its 16-bit len describes.
> +		 */
>  		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> -		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr) ||
> +		    vrp->rx_buf_size > MAX_RPMSG_BUF_SIZE ||
> +		    vrp->tx_buf_size > MAX_RPMSG_BUF_SIZE) {
>  			dev_err(&vdev->dev,
>  				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
>  				vrp->rx_buf_size, vrp->tx_buf_size);
> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> -- 
> 2.56.0
> 
