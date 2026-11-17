Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936688;
	b=Wr71UkTOfiXEkvNzyx2YQ8bLbv73VMqv6isweeNSky+WoyaoQYHO4Pyi1vlyf1BINU5t
	 iM89g58z6VUn86hdNw0hOnq286Pi6CdT9rrDpdzMmmJrUO+Eiqw7NYJZ0Z/XKJqIKNJMF
	 Ep2TV3h1lEql06zmxEzjmuVupv6ZeRCIOejtcvAANq2X35SEQcVa5kmOBm/XaEEPm8K1X
	 8q1jFvmvBZ5UErcnw0E+/JVllbEuhYnFacJbeOBPJ/bTka0nO8kXEz56OcgBD1QN3VZ7o
	 2KNz2FvD8OKrjqddXHW9HznRUtC7baQBx3dO5JcJ2L6IzuUvV9tYjbMe8J0dcv/E4IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
	b=l7HNz//u7+WjA2K/t/3zNU3Ytd6nfZbq0EIO1cY9DJ4aTZ69PefaFTIuoHRQunnKvnMx
	 BdMCbme2HVhbkJtBd/s1prLPXCIno/6qKMSfJ/SkYktlF7sVUTibpshIA/LZokPPZdbpI
	 JJ26OzsN8bjL2ou/RNBSqmNIZaQofE273sHnuiczmjsMN67sI8ninVA93eng0VUJYY3rZ
	 KbFp3A/JRO+Zr5Ij/FbkA8nEnOoCuFrfE3oMLvcF0gd2NZTAl4PjOS7tUB038IOnYxlgB
	 QW77eTpkgfbiCjtgo5yPJyujI1tDaqC3bU+lBQdxOr1euQGMi8lg7WWNcEt4ttXdVuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e5Zp8ZAy;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC977606A32F
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 17:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC977606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e5Zp8ZAy
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cddc597d062so69927a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794936687; x=1795541487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
        b=e5Zp8ZAytFfxgwA1egXYSHtX5reKgsfJ9Yi8rapzShoui1aILV3DByS1TjDMzLv4QD
         lT7xAdJd6OhO49AB3wpGJtkRzAPmLynrM3S4a8HP4r9BLCLH57FaKmub6533kkM2+vmC
         pip7BlKK6g+frBZnTZqQQa+C+9epFUILmgZNm/jyrumxPDWTO/qYUOa/u/AJX3haQPA9
         paLLOHVRuff7J5v5d34M8QcyelhR9WuHvUr4blvROXbt1pavYmgWo9VVxHVJ5qJGpDiC
         7I7qMLYH0yPJtZD80GBIJ18hbthI/+QCFL7Lf9cJWiVFnhWPUCb7Udaan5GrzXrInloi
         Y24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936687; x=1795541487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
        b=V2lSPiZtWLmNdCljJWxK8uhQ7G3DKVehWgqPtaj3a2Zatuei7/3b4kOjuUKcTFXp5e
         Qdipyjb/WnU1wHn4U/0dWgFQqFQrO3a+Qlw9Pk3kt9sV8UZGv1thGI7RGu3rnJ0+DiJp
         l9JfHzbUAZYsPtKotFgdw70ON3/Q3dgxbWTy2/e4ZYokx5SlUWhnh2BI4yVaac6vwItP
         l9QSPrd6bakxgHZgSDDPmGQRj5tk7jwy9kmTN8Td8aI+xVE8mKsHkgCNi5AZAeUGSqrM
         HnTyg7asH7VAfFZ6aWJurNaefgVuxV26gh77GBlfblwcQZKbqsy7lP+KHn2DIQQucL7P
         HW9A==
X-Forwarded-Encrypted: i=1; AL+hErFYl2cXVE24r1r0SMUswCqO4gjbmWfPR9B1PjSxussNsPkh8ku9ztIuqMtNxzPLMfuWxVQJh3lAu/ZfFjEVe3PT@vger.kernel.org
X-Gm-Message-State: APuU4Z9hj4xFSEpXhpoJ5p7O97homPJtmkRFzIh4QoM8Kcle7G6O/jyl
	NutChEzPY+Xg+L7zPGue/tW5HODfjxAcHr2Xz9MK2796Q1zhMV03HfZr95BRrf1LGAA=
X-Gm-Gg: AZFdTZcDMdQQKwQV1fz3wq+mtfVyZhMA8IrKKPuE37FX2yOgAzAEyCfnWPaSWrrXL3Q
	PrQjBS6WbVRgvd+hEcL1itxynxU8iIEh+LzlRhrG63ivb1gPFbVOeFK4pBsKQLAl4Uclw2aWPxi
	UlET+VxrtqgvhBiY7Os0HCEF6E3ybyEQOMSirlBBM7dG3HhOs4pCMIfidkggkfx3dpknk7sK0Hw
	K2DZ3NOt0K0O225ZJQfwHeXXDffXpT6dQmSSa2SSut/2oalj9/8Y6vXz1iwD6VsiPPOepus4jo3
	Qxzw8bWAn5mQGnhxgcGRykqaB66wSgZ0cJh1qGkn/tnHrfNX/PMzEOBZp3XBICfibkprVQTorQW
	8T4sEb1XE9arYvOoBSCqvhM3d2RB9sukJaf8llKwKlzcMJwfLBuOZuMbi6TF8Xz55YzZ/f66TI9
	kmG4Y2LgkMJMg3SmkBUzuCy86IFhw7zGTUdMPtrHKjGpjynLl1o9ZuooLkZzfHM//7sT+gV3CLN
	Rfd+eSrs54V/gTiKXEdgtd1Jy3cgv4J7BSzO6igVmopCMtq+hKnHyUOUVmOC0FUzHsNJc7BZo/A
	aSaKQYzGsJ5tPbSd6TdkLvCD4off9lZ1Zy051RGjXmugEuJPVpIOfA==
X-Received: by 2002:a17:90b:3892:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b3d07becb8mr123850a91.29.1794936686801;
        Tue, 17 Nov 2026 09:31:26 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:61f7:13ac:b599:b52c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abeaf532sm4936578a91.14.2026.11.17.09.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:26 -0800 (PST)
Date: Tue, 17 Nov 2026 11:31:23 -0600
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
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
Message-ID: <avyPa5rSx9rhf9yO@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:45AM +0100, Francesco Valla wrote:
> Expand the section on virtio support over remoteproc with details on
> memory allocation setup and constraints.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index c117b060e76c..4b42ed582fb4 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
>  of any type (a single remote processor can also easily support several
>  rpmsg virtio devices this way, if desired).
>  
> +Memory carveouts
> +----------------
> +
> +For a virtio device at position ``X`` among the RSC_VDEV resources declared by
> +the resource table, the remoteproc framework will search for memory carveouts
> +for:
> +
> +* all the vrings the specific virtio device requires (as ``vdevXvringY``);
> +* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
> +
> +The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
> +resources inside the resource table and/or supplied by the remoteproc driver
> +and will be indexed by their name.

The remoteproce driver doesn't supply carvouts, it gets them from the device
tree.

> +If a carveout with the same name is provided through both means, the one
> +supplied by the remote processor should be marked as dynamically allocable,
> +i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
> +

Right, as per my comment in the previous patch, carveouts at the virtio level
should be distinct from those declared at the remote processor level.  Hopefully
this will keep the remoteproc core simple and make it easy to differentiate
between code paths that handle legacy and authentic rproc-virtio devices.

> +If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
> +try to allocate it using dma_alloc_coherent(), which will resort to allocate it
> +either from the first ``restricted-dma-pool`` region associated to the virtio
> +device's parent (i.e., the remote processor device), if present, or the global
> +DMA pool.
> +
> +.. WARNING::
> +
> +    This fallback mechanism can result in a vring being allocated using a
> +    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
> +    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
> +    memory regions should be specified inside the virtio device's devicetree
> +    nodes and not attached to the parent remote processor.
> +
> +If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
> +use the memory region declared by the virtio device's own devicetree node (see
> +Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
> +Otherwise, it will try to replace it with the first memory region (of any type)
> +associated to the virtio device's parent (i.e., the remote processor device);
> +if no such memory region is present, it will be replaced with the global DMA
> +pool.
> +
> +If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
> +device's devicetree node are present, the carveout takes precedence and the
> +memory region is ignored.
> +
> +Declaring the memory region inside the virtio device's devicetree node is the
> +preferred method for ``restricted-dma-pool`` regions, since listing them among
> +the memory regions of the remote processor device would make the first of them
> +the (forced) bounce buffer for the remote processor device itself as well.
> +
> +Buffer allocation
> +-----------------
> +
> +There are different kinds of buffer allocation scenarios:
> +
> +* if the remote processor can access the whole DMA memory area of the host, no
> +  special arrangement needs to be performed, since either the drivers (in case
> +  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
> +  virtio device type) will take care of any necessary translation;
> +* if the remote processor has limited access to the host memory space, for
> +  example because of a different addressing scheme or for memory isolation
> +  constraints, the memory reserved for buffer allocation shall be selected
> +  depending on the virtio device type:
> +
> +  - for rpmsg and rproc-serial devices, a simple contiguous memory region
> +    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
> +    should be preferred, since it allows zero-copy message transmission between
> +    the host and the remote processor;
> +  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
> +    one declared in devicetree as ``restricted-dma-pool``) is required, because
> +    such devices need bounce buffering to work correctly.
> +
> +For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
> +offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
> +in the vring descriptors are the DMA addresses returned by the DMA APIs for the
> +virtio device. The virtio device inherits the DMA mask and the DMA range map
> +(i.e., the translation described by the ``dma-ranges`` devicetree property) of
> +the remote processor device, and is never attached to an IOMMU: these DMA
> +addresses are therefore host physical addresses, translated only through the
> +DMA range map. The remote processor must be able to access the buffers at
> +these addresses.
> +
> +.. WARNING::
> +
> +    For remote processors that access memory through an IOMMU managed by the
> +    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
> +    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
> +    of the resource table, at the device addresses they specify; no mapping is
> +    created for the buffers of the virtio devices. Such remote processors are
> +    supported only if all the memory that can hold virtio buffers (e.g., the
> +    ``restricted-dma-pool`` region associated to the virtio device) is mapped
> +    with its device address equal to its physical address, for example through
> +    an RSC_DEVMEM entry. The same constraint applies to any fixed address
> +    translation applied by the remote processor that is not described by the
> +    DMA range map of the remote processor device.
> +
> +Allocation of virtio devices
> +----------------------------
> +
>  Of course, RSC_VDEV resource entries are only good enough for static
>  allocation of virtio devices. Dynamic allocations will also be made possible
>  using the rpmsg bus (similar to how we already do dynamic allocations of
> -rpmsg channels; read more about it in rpmsg.txt).
> +rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).
> 
> -- 
> 2.56.0
> 
