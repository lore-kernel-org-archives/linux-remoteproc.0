Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4115172D7
	for <linux-remoteproc@vger.kernel.org>; Fri, 18 Sep 2026 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750441; cv=none; b=GTNZfnYBv028hbhWRfveVZYQDEmNXm0/MYgnjc3TA5I6WDVC1lebFxWfejxdx4BrP/0/wFtcjgCxURnL4EdHqoNqnFZXY1kPzxH3E4gzEMnQ3KuaTGUxNxcVIamQSW6ae/bpubujBb+ECy3t5AQ7VXH5AEOb6HTSGnUyBLlOZ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750441; c=relaxed/simple;
	bh=2EvlZasgpZ/lIxySBiQPHv2EmQ3k7uR84drJbmi41ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvzl0Z/0esneHpdj1WQvELPFFmroim0KePgRdvtKP7dUAVVZJW4yqIKGtIqeZqmRjqgeyxlY4NKPTCXp0RHpBM4gIHIooF7N3arUwkAa3munLbP/LEKkzG8TXm1NgNHGQPfpBqN/tzZgxKA5zB+Y8hZd8WG9sACWjyfy43OzJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rO2FDqr+; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rO2FDqr+"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34908so990844b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Sep 2026 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789750438; x=1790355238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVUde7IRkQCiapOxCzvLvGC5LfRJvKccbFMpxGxukJw=;
        b=rO2FDqr+WMGKjqdk+GJOwWHkkdft0iGMS8+ehkD0wIyz2Tm7/pee5z1MikzxK3FTXY
         zxUXoSOw758mdiQTVQwS7IvizwHTV5skYtv+p3GCE0KteVMNXVdGwo5Lxxe5jo/wow8T
         PiCk2O/SgaflJOvnhdXcvl3MFRVIsaTWqsYSKVZAI8oGr6NLbXfjvyRXSJZiu3YujClN
         n7bA9mTeNAj/8b9AiwW5ewOaRLWFFmduaByQzh8I1TVIfptN23k6/rxpDVk+fVb4ZYch
         qKH/3zvMSWT906NVKXusD3E337GPwTLP6jPJjcvHIB4z/3l4+z3m+6qxuiodADTXBkeU
         +4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750438; x=1790355238;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVUde7IRkQCiapOxCzvLvGC5LfRJvKccbFMpxGxukJw=;
        b=kqnb/uxM2JgdCaS5/bkDRLS+8ZVpei2baI3N15q171rlOWVJDEcwPchh3eRI2drB9y
         Rx2ZhE/DTIiPeoxpS+V/uyY4aTgM1HT5lXtzN0GnVsE6UbiXU6tJ+ITEM3mHYrYzg1Z5
         7PWIEjQ6p8AXPZzphk8YBVNEI9IFvcHKARJ73/mRngjo6F+GLRGqxvmj5rNvm438hkWk
         unst525NJWQwCAI1SuVGskyVmY4jleqQSflW9pNoZCWhjfYgm9G9VWbz134Yde05IgF4
         J7LY80KPKd30g0R/Ka7Hlm7lszdxG9dEbKYBTmtwguYD0J4/quB6+lwGGCEplPzVhQdt
         JPMQ==
X-Forwarded-Encrypted: i=1; AKwUvByb8EShlxdEAroFLqq0K+yG+6xrCzOdXFFwl5XsQm2arULXkYb0JP+xtzSvmJK29cR43rH7tjU6bILoASeiJmHY@vger.kernel.org
X-Gm-Message-State: AFuF++kOTohMYZ6C+ABzKobuHY5H67v8HKzb7/R3bpisUAVtdcdRI7gi
	B8t7guiC96EYkTwcyh9qEIREjYg9FrMiVPKDR3qvmiNJdSMYIVNQV7pOiY52WM7S0oQ=
X-Gm-Gg: AYBFou0R/l56vOwjTIoMsf6RraeOevu9biAJ5f11l/INGbTdJ0uADBrqYMjsU0P+9bn
	5WJr8Yol/ar1mDYJtgbXNNywhBT/RPf3jNBsN59OjNsxLXK0JS8ZTIRaziyQUVF6MqpjpDGpm6c
	3yYw1CLNJLmc1Bs+aCHTYqYwmWGKc4Cc+FMsKhMpDd68QfeKb5nClOTgk4WI9oZ7OVc9S65pQMQ
	DrKzQUGEwfrVUlcUbCYhSbjrByWDEgUW758XAqNNtAcadf93dWb0OskUd5wr+soMjqYv5pfEKyk
	r9fDreCdMtWVoB4LG2Ao8dZw0pu5mgOrGhIZXdQ/jbe/abM8ILUVb6dyk1JXdqGLyvzgZGeMfF5
	SR2Kpls7FLuh8i427Z8sxAwYZm+MHbyH7jl4CDIitgIL3iPw918wIcK3QkPDCFTily7d/jxAx2F
	nCea7aj/RKnNEG/lA8+chVvh7a8grfzPn6K1bFz6i6X7dKNLt2B7TUzN5oBh6XwDjEO47NDlRF4
	JY=
X-Received: by 2002:a05:6a00:ad89:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-874dc3f65a8mr6351046b3a.13.1789750438072;
        Fri, 18 Sep 2026 09:53:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff7b:49b4:123e:4989])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6bec901sm69019b3a.4.2026.09.18.09.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:53:57 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:53:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
Message-ID: <aq1sooGCYUiWbhMH@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>

Hi Francesco,

I have started reviewing this set but given the size and implications, it will
take me a few days to get through.

Thanks,
Mathieu


On Wed, Sep 16, 2026 at 11:10:45PM +0200, Francesco Valla wrote:
> Hello,
> 
> this patch series introduces the possibility to support generic virtio
> devices over the remotepoc transport, whereas today only rpmsg and
> virtio-console are supported.
> 
> == Introduction ==
> 
> Support for devices other than rpmsg was originally planned [1] and is
> declared inside the documentation [2], but is in practice not there for
> the majority of (if not all) the platforms that provide remoteproc
> capabilities due to memory allocation.
> 
> While vrings are pre-allocated in an area that is reachable by both the
> local (i.e.; Linux) and remote processors, buffers produced by virtio
> drivers aren't, since they typically get allocated through kmalloc.
> The aforementioned rpmsg and virtio-console drivers instead use a trick
> to overcome this limitation and allocate these buffers directly from
> the remoteproc device's coherent memory area, somewhat breaking the
> separation between the driver and the underlying transport.
> 
> == Well, nice, but why? ==
> 
> Main usecase is sharing/virtualization of devices in hypervisor-less
> mixed-criticality contexts, where a subset of peripherals are controlled
> by a "safety" real-time processor but still need to be used by the Linux
> world. Several solutions have been / are being proposed [3] [4], but
> none of them re-uses the existing, standardized virtio specifications. 
> 
> == The proposal ==
> 
> The proposed approach is to introduce a bounce buffering mechanism that
> is transparent to the drivers and can expose to remoteproc devices only
> memory areas they can access. This is obtained by defining the .map
> memeber of each registered vdev and use the map() and unmap() callback
> to bounce data to and from the remote processor, just like the swiotlb
> framework is doing in other contexts, using the device's coherent memory
> area and the associated functions to allocate the bounce buffers.
> 
> During the map() callback the address of the incoming buffer is compared
> against the coherent memory address base and size, to pass through
> buffers already suitable for remoteproc usage (e.g.: the ones allocated
> by the rpmsg framework).
> 
> == Status and open points ==
> 
> The series was tested against a custom Zephyr application [5] running on
> the Cortex-M33 processor of an i.MX93 and exposing six different virtio
> devices:
> 
>   - rpmsg
>   - entropy (rng)
>   - gpio
>   - i2c
>   - spi
>   - can
> 
> On top of three of them (unsurprisingly: i2c, spi, and gpio) several
> devices where declared inside Linux devicetree and successfully used
> (well, technically I'm still experiencing difficulties with gpio
> interrupts not firing on the M33, but that's not really related to the
> series). 
> 
> Several open points are still present, and needs to be either
> investigated or discussed:
> 
>   - for each bounce buffer an entire page is allocated from the coherent
>     memory pool; this is a waste for most of the allocations, which take
>     on average 32 to 64 bytes. An option can be to initialize a DMA pool
>     on one page and allocate small buffers from it?
> 
>   - the support in its current form allocates more memory than before
>     (for bounce buffer tracking) also for existing usecases (i.e.,
>     mainly rpmsg).
> 
>   - an additional issue still exist - and is not solved by this series -
>     for a subset of virtio devices: communication through the device's
>     config space. The remoteproc transport expects this config space to
>     be somewhat constant, and there is no provision to sync changes made
>     by the driver with the remote device. This prevents e.g.
>     virtio-input to work.  
> 
>   - device de-registration on remoteproc stop is causing oopses (under
>     investigation - might no be strictly tied to the series)
> 
> == Patches breakdown ==
> 
> Patches 1 and 2 are cleanups to the remoteproc-virtio driver and could
> be applied independently of this series.
> 
> Patch 3 was submitted a couple of months ago [6] and paves the road for
> the actual support of generic virtio devices, removing the fixed number
> of 2 for the vrings associated to a vdev.
> 
> Patch 4 introduces two new APIs for coherent memory areas associated to
> devices that are used later.
> 
> Patch 5 might somewhat be controversial, as it unconditionally defines
> the VIRTIO_F_VERSION_1 feature for all vdevs. This is required to
> support some virtio device types, and there is no other mean of
> defining it, since the field reserved for features inside the resource
> table is limited to 32 bits. Given that the 1.x virtio specifications
> are ~10 years old this still seems reasonable.
> 
> Patch 6 is were the bounce buffering mechanism is introduced; another
> feature (VIRTIO_F_ACCESS_PLATFORM) is there unconditionally defined to
> force the virtio framework to use the new map APIs.
> 
> Patches 7 and 8 are new devicetree bindings, the first for spi-virtio
> (modelled against the existing ones for gpio-virtio and i2c-virtio) and
> the second for declaring virtio device inside a devicetree. This is not
> required for some devices (e.g.: can, net, gpu), but for others is
> necessary to declare child devices and link them.
> 
> Patch 9 is used to convince the remoteproc-virtio transport to parse the
> bindings just defined; it is worth noting that the virtio framework
> already has the support for devicetree declarations and this adds only
> the glue between the existing support and remoteproc.
> 
> Patches 10 and 11 are i.MX-specific and enable the usage of the newly
> introduced support on this family of platforms. The first one might
> probably be sumbitted as-is independently of the series, as it aligns
> the behavior of imx-rproc to the other platforms in relation to mailbox
> usage.
> 
> Finally, patch 12 is the PoC that has been used to develop and test the
> series and shall not be merged.
> 
> ======
> 
> Thank you in advance for any comment you may want to leave.
> 
> Regards,
> Francesco
> 
> [1] https://lore.kernel.org/all/1330589497-4139-1-git-send-email-ohad@wizery.com/
> [2] https://elixir.bootlin.com/linux/v7.2.5/source/Documentation/staging/remoteproc.rst#L26
> [3] https://lore.kernel.org/linux-remoteproc/20260721204704.400781-1-shenwei.wang@oss.nxp.com/
> [4] https://cfp.embedded-recipes.org/er2026/talk/PCYPJP/
> [5] https://github.com/WallaceIT/zephyr/tree/multi_vdev
> [6] https://lore.kernel.org/all/20260621-vring_flex-v1-1-c6c582fbe94b@valla.it/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Francesco Valla (12):
>       remoteproc: virtio: cleanup rproc_add_virtio_dev error path
>       remoteproc: virtio: replace commas with semicolons
>       remoteproc: virtio: support dynamic number of vrings
>       dma-coherent: add base and size APIs
>       remoteproc: always report VIRTIO_F_VERSION_1 feature
>       remoteproc: virtio: add bounce buffering for data buffers
>       dt-bindings: spi: add bindings for spi-virtio
>       dt-bindings: remoteproc: add remoteproc-virtio
>       remoteproc: search for a fwnode during vdev registration
>       remoteproc: imx_rproc: always use non-blocking mailboxes
>       dt-bindings: remoteproc: imx-rproc: support virtio
>       PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   3 +-
>  .../bindings/remoteproc/remoteproc-virtio.yaml     |  89 +++++++++
>  .../devicetree/bindings/spi/spi-virtio.yaml        |  52 +++++
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++-
>  drivers/remoteproc/imx_rproc.c                     |  49 +----
>  drivers/remoteproc/imx_rproc.h                     |   1 -
>  drivers/remoteproc/remoteproc_core.c               |  43 +++-
>  drivers/remoteproc/remoteproc_virtio.c             | 222 ++++++++++++++++++---
>  include/linux/dma-map-ops.h                        |  10 +
>  include/linux/remoteproc.h                         |  24 ++-
>  kernel/dma/coherent.c                              |  34 ++++
>  11 files changed, 562 insertions(+), 93 deletions(-)
> ---
> base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> change-id: 20260915-remoteproc_virtio_map-bcf32a5fab54
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>
> 
