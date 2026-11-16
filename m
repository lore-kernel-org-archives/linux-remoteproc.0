Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849377;
	b=tIs1Cnz9aUuf88erJ1lx6icHVGqjaNbX82ZdOR0Q4u4I96fLtS93zPzWCNFC9U7msIlW
	 5ACwWQpCPhhzYHHc8oKIXNv2f0kpoUA71h2zoa/unUdtsMqhZD/okfQuwXrl5515JD9V9
	 bDIZK/z8VXrTGrsfdkthTJ+jptJRznWs9Kqc7h7IqyDLYA8UwFqjBaTIfqQQIbySlGrA/
	 Ri2uYySHDQeL7LEMmCd3pkeYiRPGwGnHTxrz9BnqOLU6K5OjWa0xua1prWIejSLVkuC1c
	 +LYFNMhoXw92dL0vJ8v8gRKenOSkVL8yKpaZ+Xapb1vWl9luFJld5zyGi2cZbLx+qqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
	b=3NcHqK2x3GlayzdOMOpyBSVKXEXtFWsjZXpYFNW7ucAmINsSB2k4jd3xfQ+RiVJWwril
	 4hN5LmDtHySYL/TQ59f/27eR/CRFMLqPR8npuJWAH7+NR+HcM/+VHMpQSaTvhfOd6PjjA
	 K/72muMWM32ufq6V0hVPMDuyXrOOaFvRchaammO/o32B8xFfxxe3sKOUgzan2VwAri04L
	 px9/+QhULqXlYWMNHisidZ9bPU64OhxDhKHO3cUUt9GWySAJyP12XYHGL7ul/ZYCHxeer
	 ZtfRdB4HRmeAsE5P1+l9Gxyu4shWYSNvrD2LJoAnBAOSaKH6ouAjiSh837qw14Pyomw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HkMSiR+d;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B218606A32C
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 17:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B218606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HkMSiR+d
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5efadd183so27199b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794849376; x=1795454176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=HkMSiR+dksGlcwGZWXhn8RdtxqBYdJQtbxVMvbLI96Ikx2BxI3kJdM8SEHvcYMuweq
         Mg3EHEZsItCRb824lZUmdTkkxwc2OpLow4+0NsHeKkxKzP6xOXIY59In7u3SCoBtPfqY
         BJZM4/S1UARezX28Zhx/rN944CAeFFzwvXAXf0YdLsW6fmthJG+3kSv7zhsrNw6xnVr7
         IJsBWKe+bcNa1RisuddA3+9M9p14aEOUNjmYrYHbT3epecNIi+eb132pbV75ve6d780Q
         PSoRo+KCZDtD9ZU+3rUiMM71agE0dNDUtfWgY4kZCgotc3BWLs8iYy3Abq959FUkwprJ
         9vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849376; x=1795454176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=zvEixaXANaP9bwQAPvKKorR8JxRDYm5Z4QLpzW2dewu85+8FsK9CxHuCCgy+Gb3yQM
         cyCyjzITdU9KsEmBNadYF+5++SvQsgiC7zoVKiI7gZW5CbHlnYKwoRGP5JjgOwjYJQPq
         gPnqMXICs2gUZJvCR/jSbwPMCcQH0ZWe+Ugnp3v/fE18V991MJO6q4IxTV/SRhcJkpC7
         uWW5cvn6x5VNcXWrSe/Elzm+Dxpp59guQ4YVJoV+QEa5Cb+bo5Rxx0dKBSKojTrq4P12
         gtBTvhTRypDRxqY7kHdDCacpSCfE53HUq5jFsGD2peRrakxxRE3aUh8H2F4L6stpHCT0
         9ITg==
X-Forwarded-Encrypted: i=1; AL+hErHM3y4y133g83aXD8QM8waogJw8GUY9NICbCEIH/hBHecHjs4BVLDiEW0wJgpVcOMpjFZOkMBZmSvmungI5ZyeF@vger.kernel.org
X-Gm-Message-State: APuU4Z+PgbMzst32isi0y48aGKdyJTIdbU3C8wVBtCdmuyXwJIlrxL/h
	wUlZA73MGLeP4SXEbnZP/WainGzFJtSKiuOc8QLSVIA86yBVrUigM30c55viouNitP4=
X-Gm-Gg: AYBFou0bIR3mflL5NFqEjzWua2l2UQe7ECO00N50p6itOZwXH3+WmDwk/LmCz9janTN
	ExhMSa/8gMpMsJhsmQQTwRKxiZbHIP5TBwEjGsgrnBtvpdZIvcc0EQFJCIsskHZFIEY9IW59hqA
	Xuu2hQxizF4z9FE9kzcvmwLEZ3oamhXCJIDT+AwaWB2kPNxnNkUkRUHVW5lPFOWjntNPsMsQIzL
	aX8Mt8bUdT6osVA3sWAyhCiqWm20bJVgeVxOaOWD4ejItOTpaJ4iMTAp9f7qhFf5veAFTP/eP31
	Sm2bqnYkrDhSKZhGUaNl+GefbmQciMoTVqj5wzej5mO4UVU6/QZKl29mikO6DfPHTU/VsBqoV+8
	iff2KnuZUnSsZPx5yTcRdKk4vN8r6hwa1Ek1YXVM18ByQgMxPzqlXcMPdW2BBBEyg+m7A9A3nPy
	qUutwxq3miTIW3qT68s3nW42CFm+iEqeqP2RKXIyj6QAkIELyLwsrOgY8sPT8YcgJXmxXqSli3m
	PLWBGwKUNZYiCnZTcjEvEA6hwvwlBJwYUhCFlAGmCdk531MSL9La76veKz6JBOI7gRnaZyZMQTR
	ASoRcrAKI7nfFzKFsP9P6TEMWmTCz62W
X-Received: by 2002:a05:6a21:7a46:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3fd29c153b2mr84093637.1.1794849376336;
        Mon, 16 Nov 2026 09:16:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ea6f:45e1:c614:f10f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a97f9sm3778408b3a.14.2026.11.16.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:16:15 -0800 (PST)
Date: Mon, 16 Nov 2026 11:16:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <avs6XQpoQmY_MNYx@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> Depending on the driver originating them, data buffers used for virtio
> communication can either:
> 
>   - already be allocated from the coherent memory area that is
>     accessible by the remote processor; this is the case of
>     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
>   - be allocated from generic kmem, and thus not necessarily accessible
>     directly by the remote processor.
> 
> In the second case, the DMA APIs can be exploited to obtain a
> functional communication, since they will take care of cache maintenance
> and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> feature flag can be used for this purpose: with it set, the virtio
> framework will use the aforementioned DMA APIs to map and unmap buffers.
> 
> Bounce buffering will be transparently used in two cases:
> 
>   - if the buffer address supplied by the virtio driver is not suitable
>     for DMA transfers, or
>   - if the reserved memory associated to the vdev is a
>     restricted-dma-pool; in this case, *all* buffers will be bounced to
>     and from this pool.
> 
> With this support in place, any kind of virtio device can be supported
> through the remoteproc-virtio transport, at least from a data exchange
> standpoint.
> 
> Note that remote processors behind an IOMMU need da == pa for the memory
> region(s) the buffers are allocated from.

I'm not sure to understand the da == pa requirement - can you expand more on
that?

> 
> Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> they are explicitly excluded.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index f1b362158a9c..1496659ddff9 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  	 * All non-remoteproc-specific virtio devices are assumed to be
>  	 * compliant with virtio specifications 1.x; there is no other method
>  	 * to transmit this capability from the remote processor to the host.
> +	 *
> +	 * Virtio devices that are specific for remoteproc usage take care on
> +	 * their own to allocate memory from the device's coherent pool; use
> +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
>  	 */
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features |= (1ULL << VIRTIO_F_VERSION_1);
> +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	return features;
>  }
> @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	features = vdev->features;
>  
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	if (WARN_ON((u32)vdev->features != features))
>  		return -EINVAL;
> 
> -- 
> 2.56.0
> 
