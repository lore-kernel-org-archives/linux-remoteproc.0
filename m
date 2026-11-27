Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797639;
	b=Lnu7karpQQCI5bkQsVNnXE3D0hyMA2C5b/FWsYifSvsz3e5wzM+OXbyJfQvy+ZMVkW0b
	 wJ1OqOG3IIxLsaAJNj5U2r0EuPHVCGBCfDhKgMeTfXrXaPx7O1I4J3Zt9U3MdVIPUYzlO
	 fjsN6gBS3gn7JuPiMKgqvEC/g3A01DvB+VtS3ZEs59GPfgTFxzBRLf6NVUjPGKUhpHw4l
	 7a6TNaVdnDjp8gOuJNvPI5tk0Kr/HZ4apea4bW3k3YEVJiG1ggSrkCYApPBukMtqXymdv
	 kAwXbU5h2ZUip6xS9EN3YqMo0hN83uEgdRDVD/5opimp8L7M3H9+whws/Ij0yVtB81w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
	b=w5ef5BzFQnXUH49hwfOGxMQ2ECcMOTyffsF9S6n9Y950IZfWShRWkP1OceRJMVmZ5Bia
	 IslM4SC8Uz+7DhQuyx8lcBkh6T7v3Jt85/2rLRazInpAlN8/0AaBbQkAXx3gEZX5qtd10
	 xklhMOT+cBmolN0pd/4eBO8lLJpTxrW2TDHgd0jvvQCZ9eFBwCZJK0Uylp1HQm15mjI4d
	 AOuwheb+L0jpD279FhwymUL0UY4d2Ma/mDP4NymHBD3TWyj/FpF7DFAx2Xzz3ob+yGaDk
	 S7K87BXM/eN3UgJONwKIvgI53MbcCFIdWRHY2i1+I9YWrIWs49doLSX3Bj3AjrxRTYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v8D0HPG5;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1345D606A69E
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 16:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1345D606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v8D0HPG5
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdebab6fdb3so1165044a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795797634; x=1796402434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
        b=v8D0HPG5SrMDtS67IZb1pkHKSk/WlmWSmt2FKBx36gm+wJx09D8v27+i3x3gQasJjs
         pPT5bu/fX/ox451LY4xXYl/XhrM7lleWf0ZS2dF7Ul4nFXJq2VVHy+OA6FJz3ONYxANm
         IH+OR2Bcmfbtg798BqCiM41ezaxq/eGjlnZuEf2kOQZFDIONKAuTTHePZ98l6j87afJB
         y8FFSg6MAHYDqykdlRcZdsn7rrmSO2qpu4Ek8NkhBvh4T51cPlTK/oiuF8haWlBjs7iB
         j0EcxYKSmJameVcx85RNRVqe6RWB7I/v7iBBNDixhsH6eboth6dqjJvP2zz2ca+hKlOw
         o0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797634; x=1796402434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
        b=k3WshdYchTOJrEVP/Vixm6uxxuM2QXfQiI2ApUdsFMnwy0dzALeqkrBx3I53MMK+NE
         R+mI3xMqQsRdiucPSg58E5tHnDoxSDOWBgl/uqYYltq+TJ9wsnZ+ZzutONeR2E3fx7F4
         2VPf+Oml3FO6uqNnkYdj2N7oWAGFRiJIfKC9k4G+GKujAezQcE6LnACkw/pz+MqNBgCB
         yFiPxWY8h3t0fbzR5F+NNoZXfwLXXAfh75Dg2p9ugmi95sMGbjy10+MtHGhOv6OHK20r
         +g8OWoEn5dvBoZR6MCQotl/jJp6uORlszfkj2UWoD+Nl246LRo1CHDjL/7LWCkrGXNAy
         5AqA==
X-Forwarded-Encrypted: i=1; AL+hErGU3ObbvHOm+0TuSwqZmSQCytmNY64Z7av3htfpBqDeIBA78+PhhxRIIEMf7an5xU3JZAYHn4OXen7jqhJe57Wy@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ue3SRT5VAPwFKISyOF9JsgvScKKGiJDuXZN+2vhrxF0Gnlwwb
	bt0H6H9C3K3LficOp5EX5J0Pvfuc/CA37v5RSc9FljAyLBYONTXneuDtEs3JV+0QQk0=
X-Gm-Gg: AZFdTZdruVdgGcu+jSq13paALc9MHs3dSW0Iwan3WqBQmQmje1/CqybKbeXDTpw5YEL
	VjD4q6tvWYsZyHNgl6dwb2rr3Xec/fSsU6wsNyDZyqQB5ZRlWgFLMKW/5vP50VAHYD8Sl2ZGn/S
	3vr8LnO2EyMNeo583BlV+NYwSN/HNtP4oEZEtutUSTB7sGE+itmpcO7NdsKGsrT5f5/qzbKc7kf
	4u3JCJXoE8+DwAoVq61hoXs7VGFmz8FjrsI+CJYFV08DCvMRAVpbR5eD17Dh6bUvjDU64WswqFs
	jRD5+vhc86owo8usDYOU8kJvLeBJpGJu0GIB75jSgYqwct6rsVqbpVwbhUffe/Odj59NwsDzZAW
	4eqsd7kcMRFy6W+0+vEsddemwMAgPnyZocJbs90d59PZDfTsvwOM4ww/aKENBhCvS9VMfFMiGVV
	HNXoDFzGTFy4QWDG0dZuHo6ng4IVHXiWD5261bGNqHEz1oUkzauKGJiu5DWpL/0F/aGIZNzJEHA
	m/Zt+7YCekKmlzBj9uZ5Zm6p1kCUEP3yDjQclD94ELDnowoYdi13DOK0yZ11noLEiWWRe7GK/Lt
	qXIX5bF9BpkGy3ygu5qajNdbxDuuSOAO
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b41c7d6061mr24239538a91.5.1795797634227;
        Fri, 27 Nov 2026 08:40:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:6d00:8302:1937:74ad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm38838830a91.4.2026.11.27.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:40:33 -0800 (PST)
Date: Fri, 27 Nov 2026 10:40:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Rob Herring (Arm)" <robh@kernel.org>,
	Sjur =?iso-8859-1?Q?Br=E6ndeland?= <sjur.brandeland@stericsson.com>,
	Alex Elder <elder@kernel.org>, Andrew Davis <afd@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Brian Swetland <swetland@google.com>,
	Clement Leger <cleger@kalray.eu>,
	Daniel Baluta <daniel.baluta@nxp.com>, De Leon <x0095078@ti.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Guzman Lugo <fernando.lugo@ti.com>,
	Hari Kanigeri <h-kanigeri2@ti.com>, Hari Nagalla <hnagalla@ti.com>,
	HyeongJun An <sammiee5311@gmail.com>, imx@lists.linux.dev,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Loic Pallardy <loic.pallardy@st.com>, Mark Grosen <mgrosen@ti.com>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rishabh Bhatnagar <rishabhb@codeaurora.org>,
	Robert Tivy <rtivy@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Siddharth Gupta <sidgup@codeaurora.org>, Suman Anna <s-anna@ti.com>,
	Tero Kristo <t-kristo@ti.com>, Uday Khare <udaykhare77@gmail.com>
Subject: Re: [PATCH 00/10] remoteproc: Assorted bug fixes across remoteproc
 core and drivers
Message-ID: <awmyfo4HYoQ2dqKT@p14s>
References: <20261123172140.3547896-1-lee@kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123172140.3547896-1-lee@kernel.org>

Hi,

On Mon, Nov 23, 2026 at 05:20:44PM +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
> 
> None of these changes have been tested on physical hardware.
> 
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: "Sjur Brændeland" <sjur.brandeland@stericsson.com>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Beleswar Padhi <b-padhi@ti.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Brian Swetland <swetland@google.com>
> Cc: Clement Leger <cleger@kalray.eu>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: De Leon <x0095078@ti.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Guzman Lugo <fernando.lugo@ti.com>
> Cc: Hari Kanigeri <h-kanigeri2@ti.com>
> Cc: Hari Nagalla <hnagalla@ti.com>
> Cc: HyeongJun An <sammiee5311@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: Iuliana Prodan <iuliana.prodan@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: Loic Pallardy <loic.pallardy@st.com>
> Cc: Mark Grosen <mgrosen@ti.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Cc: Robert Tivy <rtivy@ti.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: Siddharth Gupta <sidgup@codeaurora.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Uday Khare <udaykhare77@gmail.com>
> 
> Lee Jones (10):
>   remoteproc: core: Fix integer overflow in rproc_check_carveout_da()
>   remoteproc: k3: Fix integer overflow in k3_rproc_da_to_va()
>   remoteproc: omap: Fix integer overflow in omap_rproc_da_to_va()
>   remoteproc: elf_loader: Fix overflow in rproc_elf_load_segments()
>   remoteproc: imx_rproc: Avoid stale mailbox pointers on request failure
>   remoteproc: imx_rproc: Register SCU cleanup after resource acquisition
>   remoteproc: qcom: Clear glink->node on allocation failure
>   remoteproc: qcom: Skip unregistering uninitialised SSR subdevice
>   remoteproc: imx_dsp_rproc: Fix pointer stride in
>     imx_dsp_rproc_memset()
>   remoteproc: imx_dsp_rproc: Fix off-by-one bitmask for trailing bytes
>

Other than patches 7 and 8 that will be handled by Bjorn, I have applied this
set.

Thanks,
Mathieu
 
>  drivers/remoteproc/imx_dsp_rproc.c         | 10 ++++---
>  drivers/remoteproc/imx_rproc.c             | 33 ++++++++++++++--------
>  drivers/remoteproc/omap_remoteproc.c       | 11 +++++---
>  drivers/remoteproc/qcom_common.c           |  5 ++++
>  drivers/remoteproc/remoteproc_core.c       |  7 ++---
>  drivers/remoteproc/remoteproc_elf_loader.c |  6 ++--
>  drivers/remoteproc/ti_k3_common.c          | 27 +++++++++++-------
>  7 files changed, 61 insertions(+), 38 deletions(-)
> 
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 
