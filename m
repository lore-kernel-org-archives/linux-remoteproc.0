Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116245;
	b=TgaBBoTq0xMocKhG7Z7xk0rPNJsp/jYWc6NOWoEZhrzjx1GAwPPsSRO4SkP5p/SGJujH
	 Eaz1sfIkwXM4MXEzZTlr4SfAIZQKqY/rkplyUUdvRKkfdLeT6yjQ6RMm/+6j6YTnhM5JA
	 U+HIclPYLoys3GuNvRd6efQRXFOSgZnjm6d8CkSLzDHCMuFHDJwTLxi9tZRY7+mRJwdAp
	 nIbXL0W+Ip9SPaTJHnGv6/ScLSXLE/R2fTSae5j7XzNTWrfLgGJT5mMoPYJmkSXN5xG6L
	 qHVbnmfOYSJnUEFxDMqzzFkJDv/xr9h8IRxmShHdhrULbHsNlefdR7Q2tNc0+f4faMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
	b=lCvIP+j/UBnLVZR4HTwqnGTTs0xCeFiDoxV/qF+96sU6brqm1BuOuoUSoNl4PaFlOY45
	 TyGY2sWgKvM8+8GVdYmhWKFO1AJt+eUVa2JXjcnxEF5e5FIJIvWOA/YP4KjH+4u1/BrjT
	 /6GUS6UgRIhbXzNbMWJ82luHI2Ytgi62H0s7E8M6sQzd4HkynbY3+zHr43uzN65cVLQWr
	 7UW5LwWsewKjVfawpuIMt//bNnhjOa4c4VYVhjzc0AAT3zwKdUaJi5OvLRL2C0WY/zRn0
	 Rrrq7ITPns5SXc6DVVClskaHyBqcUJIJqpTA4WJw4JrucMNF87M7dmYUMyPLw2/nqvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AsxhCWZq;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23668606A336
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 15:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23668606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AsxhCWZq
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06c60065fso63262b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 08:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793116244; x=1793721044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
        b=AsxhCWZq4ZpcjmjJGMxqpyEK2EsT/+re+Mm5/ZKOT+XhURYz/lucLDPINHDCt4pSHL
         y8vMTuF0oIMUgaGtY7yiuudiOzaAgHrFgXCrk5P6NzZl3LzOLzqGTlOAIQ2+YnuJIQNc
         Xp3e3MKxrOO60WCzQqu1OeIEx8gMlfyi6L5EK7Rpu/239CtGex8R+8WcFOEnHkpkMa6T
         d3jaM76tPpdmntjDZw6fpUGWke91YLa8SkbG1jeIe2IrJHqqgwZwDc38NrBJETdlJfw+
         OR8ISkqd9VP65z0a6z05FEJMEophVw1z/CA93fvhXE13Tch/CsLuM/djhuadgAj74nHt
         iktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116244; x=1793721044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
        b=KxMGIpfHxrCJmr1CdfcCaOj1Bt3vieaMnbWKLtxL/41ktwLU4ZOA8Zdt1ZpPIpr4pW
         SQ20mQ4QmNQtnHUeMQHMTFzo3JYppmSGQe7t0nlf2pNq0Kp6PBvVM8wLEwBqAvuIPyI1
         YIxl6VVBfojoh+hnRR9FwCINK8+K/E3MTA+8hmtVidyfBEat4nACRi0K4qoXvHYaMoS8
         2OymCFfmbJDmUPzkmnAXYMLIh9ixpBAdz6Ws+c9KupiTDAGgTz6pGvvwizMJNEDbdmWf
         xBv2i+7t6/sRouCdZJQ6ZWUQGH7yYzH3C5R9ACunx1e2YcI3hR+1LgwkS/lmnaAq8Z9Y
         La9g==
X-Forwarded-Encrypted: i=1; AKwUvByMbYHVQLar13WBHeYUMkpWzvIztCXzIIbfCJWgJFLjM04Q1k8rcZdzD0xxVgEa2t+m00pfNgZP9rUUzsSnygu7@vger.kernel.org
X-Gm-Message-State: AFq9FYITFybQWuyrug5o17wb8gvun7mp8SvSLWL8TILrNS6eBXPoADiY
	BK2f4qF6O56XC/tcza+cNKpPzgoMhf9nIZdMA7bSSgA+ZRETEdrOPrZl7GaaNj7yPTAluA4K0H2
	THqNU
X-Gm-Gg: AYBFou0/Atc5Ra8WyID+Fu7ZjdysdFRcfBJf85leBz7uMh1/+XmVanYAQVDAEJAxv6J
	d+vxJKXzrebVUMecvD3P1Eoj6lRaKRXaL2/lavsJbN0vxK1HrPMwKXIVdJDuPhWscQBcAYCGZgm
	q4DXoHc/aMhILZBAezR71u05ipvtWHhIADf54yT7sYfOtanF9grfGJM7wwkGB8iL7S+C6oLgX/q
	3qd9UOCYZyxayIhT3ElNP904hc75Sc9ZorvdF36bLI06kYzaWHYQbvPK2v+UL8/XrTEMVenagXO
	Bc+LFW1gUPoz7tcnZX97s0xKM/tGDQF/TIPgGdbL0ZAuFrrx8pxDM3qC6WmYRTD3iPSBcSjq54r
	VrU79KeapJllONpb0l+UuQfWDYV6WiPZtcVkzzc0nEpC+an8THXM+erWA6bHlPBA7W4qVKwVTwI
	UOVzvs20DPpyQwNs7oyXJnEFt9kwLihnT8TdQIwiyd0HrCOulXb88bUc0ST4ytrCEwG00jxtuBM
	8bzL6Sh/t8iZm6jbWAHeYngdLNtSbES+s89TQqY7zhl5KBy1ENXS9VT74o=
X-Received: by 2002:a05:6300:6bc9:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e7cd4cbe1bmr6742323637.68.1793116244485;
        Tue, 27 Oct 2026 08:50:44 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c0a5:5d28:58c5:eac9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666d1sm2943517a12.16.2026.10.27.08.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:50:43 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v9 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid implicit ABI.
Message-ID: <auDIUf6Vx3VdeXcz@p14s>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
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
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>

I will apply this patchset when 7.4-rc1 comes out.

Thanks,
Mathieu

On Fri, Oct 23, 2026 at 03:52:48PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a implicit DT ABI.
> 
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {	ret  = <0x90000000>;
> 	no-map;
> }
> 
> m4 {
> 	...
> 	memory-region = <&rsc_table>;
> }
> 
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
> 
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
> 
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
> 
> ---
> Changes in v9:
> - s/hidden/implicit/g, sorry, missed at v8
> - Link to v8: https://patch.msgid.link/20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com
> 
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
> 
> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
> 
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
> 
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
> 
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid implicit ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid implicit ABI
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
> 
> Best regards,
> --  
> Frank Li <Frank.Li@nxp.com>
> 
