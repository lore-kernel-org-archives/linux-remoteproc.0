Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FD31F936
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766597780; cv=none; b=ULLQegw0wtqJZGqPeYkeKX60Ed8jOO9gyZvGyfG63yTU5ez/5OW1yM75SndD+1+05tJsip73BHqtzusoI3V67RYdWVOU2bR2IQA8mj3YMAs9GOc3wb1m1Z5IhMh3In12mCY8Dp4e14VxJCaVEty94SrNflLiECVjgsUOwdMF+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766597780; c=relaxed/simple;
	bh=PClKipvoSN/NnumpcyN+/KuxzqPi200kimFq8t05q80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKktGYMGFBe9DlXKLFsW/AciZWKyaM7KvL2CYMhZXQ+J23u67wYb3SEaU6fR3P62SyOugqV4SYrEZ9q0UFSZ5cgn2dCpUQ9qAefJh0J7+noz2FBmKI7Qibj22y0Hfvmy2r0Adm2AEjdV1E3uavlnAlkfzZT5bf6asgwPjE2J050=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RY0BaL3V; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY0BaL3V"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-450b2715b6cso3725516b6e.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766597777; x=1767202577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpMnqFtDTmoVp19QSLvEcIFu/SJ/IsYwE4qFGJyAisg=;
        b=RY0BaL3VQxJqm3nUyGuB9UkykFhgSsccUewP6vtaZVXcVUKEBbJlo6Zi5jp67LgYdV
         1hgRqip5/B2CbV895GzvcHOz0fC+flxZh84ATLflP+XlwGMCAj1AaZDh+puTKKzA/hY5
         T4wpYxDgTzZcm5PM92GGy70+pmnl4fpY1BNp28gg6Z3kGvp3vgTkdgnCXu4TcXIcMerC
         yEsJr7VVLk0hQoazDsDUkJxV9D/bD3SLmpeS3SpDjwpyQFdlAqNSSI6bS+GOjxcJ///s
         CtJJJZVErS+brQK8P95D6Rl8nIryZ6lqCqy4udAH5IeJTb2j685nZQrTbF0gUAwJeB1Y
         dviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766597777; x=1767202577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MpMnqFtDTmoVp19QSLvEcIFu/SJ/IsYwE4qFGJyAisg=;
        b=Q3mH6qdxf2s1UP9bRApSj1hSz7RHTFuUvA9NwWIA+BqCOTcw5cmCCYatQU3qX6TIxX
         ypKR6/vKtVDu+rTrCIn4cI/Om8fdv41mAZM1LZ56RQxRTQhxw+daOST9ccotQRXUFF1n
         YcBC6CAegHIVN5751T1KzHiL77p1fov0C2hU0JP2mO/7ueqezGwMu/RiMiFLHycoQeIr
         7iJgQCkdgdm4rZ1OZXjA1lfhEm1yf/x1u4GywSQD6uAeGVJxcj+0iKorWW64WraovcHH
         Nxt/Z2JJA3cBy/TmEyr2X1y2Doq5k4V6CuuTkNpf8rddYZrVfyMCYc1pLV4bUCUN7kkV
         ChlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSKAjtk6fmuqsEYoieVDZA4niwvCO6DmdM2FYl5fvO/i3ZDJ2DW2AYM+bfqC4/HZgIJMFRMu89WHvCJzacYw3D@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLJFfeTw8pNYcgGkjkItrhRtfGDFjFrAf97CtGBWdSGumSfLa
	/ss0p/givNV+bVXaicBhS4+DB/N1WZVGL/V37YRySynPptSw0WPf/Ft+
X-Gm-Gg: AY/fxX4pBjuRei52L2PmaV6l3o/e6SpYYWDAucM7dHtYrOpEKQh7OnPR2dO9FDyusvs
	zbW/7aw1nS6b8tMonBOkXD7eMyrSB2wjYlwYYb+I8+zOdicPmAj0rOHTApdUDNKUEWmoXO1y7gL
	8K3Msb2CF/+/pZSTYkoU/zrIYjsvzNFPI59/GpCcYuHLfEUvkAaJcvOM4EOlC5+VeU0E/Fcw9a/
	24zPpCOBYZ58h4kIiGMHG0NSM/toUKhFKy+l1GnIr78p/vbhGHvSfE0ZM59BOOq5pFAbsTNJRn7
	3Qn6CGfSksdRS0gIYKBwM0+/76ECrslN6VMzakPeUiLAVTmhheU5aJfd21dOpmTxJOciOw/kthB
	I9MWSE7SzntWrGl5cy21MyPYDS/B9p+MPMhtYrSsvn3q/F23YazbxMzOFZnufZWq9pjHvkdXuH/
	YY9L7lPAWzfpDn0EhoXhKw5PlMTF+5pvrFNwbZM2MODp/zERlTw2P6azSZQdnDvT3xF3IrL1pDj
	F/K3/AJurWi9L2T0JCLAKHQjXfge4Y=
X-Google-Smtp-Source: AGHT+IEwhNLGB/ObbcXq24oPZkJatmLwE/LdvbRV3KFdoUMFsBjOOpCavIyiLN9TSPdAOX5X01lMsQ==
X-Received: by 2002:a05:6808:1202:b0:451:4c6d:a638 with SMTP id 5614622812f47-457b20140eamr8904780b6e.7.1766597777141;
        Wed, 24 Dec 2025 09:36:17 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaab620b8sm10695688fac.14.2025.12.24.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:36:16 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
Date: Wed, 24 Dec 2025 11:36:15 -0600
Message-ID: <7564740.MhkbZ0Pkbq@nukework.gtech>
In-Reply-To: <41616f5e-68a6-4354-8520-4321e747efc9@oss.qualcomm.com>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <12223416.nUPlyArG6x@nukework.gtech>
 <41616f5e-68a6-4354-8520-4321e747efc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, December 24, 2025 3:44:56 AM CST Vignesh Viswanathan wrote:
> On 12/24/2025 1:51 AM, Alex G. wrote:
> > On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
> >> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> >>> Q6 based firmware loading is also present on IPQ9574, when coupled
> >>> with a wifi-6 device, such as QCN5024. Populate driver data for
> >>> IPQ9574 with values from the downstream 5.4 kerrnel.
> >>> 
> >>> Add the new sequences for the WCSS reset and stop. The downstream
> >>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
> >>> using with the "q6v5" driver because all other parts of the driver
> >>> can be seamlessly reused.
> >>> 
> >>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
> >>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
> >>> register. The second set of clocks, "clks" should only be enabled
> >>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
> >>> tries to start the remoteproc will hang.
> >>> 
> >>> The downstream kernel had a funny comment, "Pray god and wait for
> >>> reset to complete", which I decided to keep for entertainment value.
> >>> 
> >>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> >>> ---
> >> 
> >> [...]
> >> 
> >>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
> >>> 
> >>>  	struct clk *qdsp6ss_xo_cbcr;
> >>>  	struct clk *qdsp6ss_core_gfmux;
> >>>  	struct clk *lcc_bcr_sleep;
> >>> 
> >>> +	struct clk_bulk_data *clks;
> >>> +	/* clocks that must be started before the Q6 is booted */
> >>> +	struct clk_bulk_data *q6_clks;
> >> 
> >> "pre_boot_clks" or something along those lines?
> > 
> > I like "pre_boot_clocks".
> > 
> >> In general i'm not super stoked to see another platform where manual and
> >> through-TZ bringup of remoteprocs is supposed to be supported in
> >> parallel..
> >> 
> >> Are you sure your firmware doesn't allow you to just do a simple
> >> qcom_scm_pas_auth_and_reset() like in the multipd series?
> > 
> > I am approaching this from the perspective of an aftermarket OS, like
> > OpenWRT. I don't know if the firmware will do the right thing. I can
> > mitigate this for OS-loaded firmware, like ath11k 16/m3 firmware, because
> > I can test the driver and firmware together. I can't do that for
> > bootloader-loaded firmware, so I try to depend on it as little as
> > possible. I hope that native remoterproc loading for IPQ9574 will be
> > allowed.

Hi Vignesh,

> Does this rproc start sequence work on IPQ9574 without using the
> qcom_scm_pas_auth_and_reset ?

Yes, it works as presented in this series, without 
qcom_scm_pas_auth_and_reset().

Alex




