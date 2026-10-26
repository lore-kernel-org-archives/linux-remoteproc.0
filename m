Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001098;
	b=rm6/GN9T+/+N42MAJ9D9fkg64PsxJXVOwN9Q86ZGnRnZkJmwRkomdwsvC8N9uYBxO3Zj
	 pWwixUv2B35xQjQ2GqjrSIVVK8eRvr+5sa1l47yqA6/8UHVpy3red8iFP5BYVZaLmqPAM
	 NMZLPmKxBTSOWYbPLInNvl2T/cWRKpk2sPvbz8CGWqm6e2dNXFmbdM9xdW3OBmz5VZHwl
	 QMguWV4yCWmypigMAgyZzWcwG8VkI3UESo0vibbihsiV1fcyUr1/PnMXm+kSnU5ufa55u
	 sYvOnjPepXcP2b6rsx6k9ADsWlJ30glkc8BZez6sKgnr+GcJkR0qglQX5U6Rz18p/JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001098;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ReopTLtwQNEVhs7qRFvgKJ+ZmFHz1cCFpaMGBdlN7ds=;
	b=g55PPZPySRxsGomVIhPdOAugM/7Gu4KWifzN9HRuGEhHO4D6vMdO6WgcP0ouYH1EfOIb
	 QIrX6SliiFiHAQKHS6B9lA5s8PDAv9ejky4yWV8DCzSCQ7Zxv6XD4ZmPXGbYjQAjREdyL
	 JMf3+zvAJ38Ln36FJNqdDLDPcHH2MREugZ89R4ClAeBTwjxmFE9wazrJ7eJN/dzRxLtrJ
	 25kMoypI8O7DGhE1PD80QgriSFUYL977a1R9z40xJE3g5WsvZKXW8ti3IUBb/nyCIHm3a
	 NshQPFCTSzd8dTr3I3TXB10be4OVeNpI6Hz4JZSI0xjb5p51qDnn2dOzeFfdjE3pRFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kK6KAtcp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E25606A31A;
	Mon, 26 Oct 2026 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kK6KAtcp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF581F01825;
	Mon, 26 Oct 2026 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793001098;
	bh=ReopTLtwQNEVhs7qRFvgKJ+ZmFHz1cCFpaMGBdlN7ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kK6KAtcpcJVtoleORKRGvQMTbkBoXD6YMNGx/enpf+xC5rMP/oswCcruMBvWnxCVb
	 09gboOOnQYNlQgt4cSaAZhBLWhfSVpuNq9NzxvM0UiWrLykPMgkZPt+rVdFngQChet
	 cV0Wke/cdj5gDrWaPCG5jsaMbR/kST2oO+jDHGfyGfHFtAS0qwhf3RJtK6HALcr9aq
	 ffYblwaIm+2djIWwu9R9qj0k6vBwfJwFEKXmIclifXTkCFxZPAPMTfd0MP6hxBeXaI
	 j0u9OEX5daFxBICOSYnIHtKIpT8MqxcUSPM4g5i5JKcxORGxBxEx/nLOXtru05DHFm
	 Yt9lksUulWEkg==
Date: Mon, 26 Oct 2026 08:51:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomeu Vizoso <tomeu.vizoso@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
	Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
	Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Robert Nelson <robertcnelson@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Markus Elfring <Markus.Elfring@web.de>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Suman Anna <s-anna@ti.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-remoteproc@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 03/16] dt-bindings: remoteproc: k3-dsp: Allow
 referencing the timers' power domains
Message-ID: <20261026-encouraging-musical-piculet-debfeb@quoll>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
 <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>

On Fri, Oct 23, 2026 at 08:39:28AM +0200, Tomeu Vizoso wrote:
> A firmware may drive the core's timers, which need their power domains
> held; the remoteproc driver does not hold them, so let the DSP node
> reference them for a driver that attaches to the running core to hold.
> 
> Assisted-by: LLM
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> 
> ---
> 
> v3:
> - Initial version
> ---
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index d6319c8e96f8..80eaef0a19b8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -76,6 +76,23 @@ properties:
>  # Optional properties:
>  # --------------------
>  
> +  power-domains:
> +    description: |
> +      Power domains of the SoC timers the running firmware ticks on and
> +      times its work out with. The firmware programs these timers itself
> +      and makes no power request for them, and the timers' own nodes are
> +      reserved for it, so nothing else requests their power; a client
> +      driver of the firmware holds them on while it drives the processor.
> +      The processor's own power is managed through ti,sci-dev-id, not here.
> +    items:
> +      - description: power domain of the first timer

first timer

> +      - description: power domain of the second timer

second timer

No need to say that power domain is a power domain.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

