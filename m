Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B194299943
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Dec 2025 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289858; cv=none; b=PTKn3yRuFTpeb0AspnvVYU4uCIIb61UdjRDQvW4fWmZxa3D3HpNoJiRpUKO+xsy+wYGNeBXMvBV7qvwRPDVO2wXl3m2hjE6mYu73l6WkWpG1Awbjl+miq4l4R878tfsEPs5rZWqUn2HHTAijMEhQosnIMOaHdyqs/NYpei3GNQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289858; c=relaxed/simple;
	bh=unuZ6P3b7Yxjaa+0itPHl4nXBL7mIF6rtwXPOxCWtX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFfgSJFv4UxVbQzyKzy25xBH9J4+eWRRVg5fwoAkCYKUEsaXElP3vkPcBMV471KgWaMKvbflGILOiODuOO0SgPZdDWxsap0zMgqDKFOVa7FeNLxDD6AYLAhZOYRfR5CjxMu6RwgmqtGCzrvwq3+bDPT464zGTC7HJH1Rd6TlQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJcDhqP6; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJcDhqP6"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2a45877bd5eso8182709eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289856; x=1765894656; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=EJcDhqP6gkSRYJwsSv2k0z0JKn9iv5hcbelmELr2P3lxWCRnlk0lbADGeEpal6NB4p
         wYuuoo9+s5zqMnCoWq40Dd4sWemsqp+oOEPWUbqAl3J/GbjdVKnH/2NbJbU7hong+gjQ
         sawD3lVJ6BJcqYA9eu75o9Gnka3/Z5vxcEXy8NS4ZouORDBysJdlvLwaNm208Z74YZBe
         +Tyl8ln2f+b5tVxwpZFY2dly7V0+LHt4ezeVsRejV5mAkwpMOJRd2rH97TzHkb/iBjcc
         amJ7UUeOBoZvlsLphZZunoALUwUDvoFN8NbYLerIHWjUqFLqCkBtu2i6Ww45VwuZtD5E
         h/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289856; x=1765894656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=cVd3bwX60w/6A2vciT/3SPXevK38MFBwyfRc7JqbhrPwSeiKv4t2QJYtwnry1kUd8K
         2TYYE78psECRwhEcFbqccghdRPVgHEGerIbfHZ/t8iFRXYkdGpqhxVMzVpQnlt1AwYou
         8JIe7iLX660envnU4x3CBa6yeec2/bqHzSqv9skrwen0FyvNj2FMDwLpDSiD5/rZVhA9
         g2PtIyFWcKRiHpQ5uX4OLf0WX2/faj53xcpZ77l/3pLYBJ77XgRKchGkjeKq4tMfw2or
         QHsT7+8YKPB2WlcjU8bpP46/QAqOds7fZYs4EwuxaSgXZzMEMJfAVbB2Swvpno1IN3jj
         fBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWscqLMBhAsIwI6hh+bet1osUNhxWuSI+jSdSfMM2ygRFYwFvxjL/LnN+LLlcFAgUObqp1Obf1aege+hKH68OHn@vger.kernel.org
X-Gm-Message-State: AOJu0YxEnzGxYV1IWb37CeJpxQ+4TAcWpAIiHERX+67rx+3DPeShokpf
	YNVLvOvxFUSzsffeVr4svC4GK3ol3sgUYjIrtWky1Md4wFiFFRYAbsIjJO6dBOenp/IPboHjLhB
	dVkgGpWrtTTWbJzhRh1XMPmY4TfpaGgw=
X-Gm-Gg: AY/fxX5NHTaK6VP05tgM1OBQ82t2sqxl8Jh7thtQh+3mjn+GAXOG/bqK/4u9DO/4HoA
	7Eiz8jsJN7Lx7SN9IkwU6e5o+fyrK5q6SZkhaq9PsTZMSAb6+alHjLkZOAsOzCAdTVd+leoZDxh
	Qh0F7PeuL8ZZdXbHg/a0GyAzIzdFDhmh/38Idredu20Ne4zT0ZCvp1Yl+dKWuV3ilRnaYTOUsUo
	jkxrXJlRSnlrpsAKL1OCjATwf5tk+/eYUijtwc74tbs2/kazez/qON31w/8mPBwURx0Fq36shYF
	hOimEIRcmm4JewxRU86tAu8rBQ8ngEqKwM8LVybwElFSLftp6ee00Re+0wGktTR2yyUZnMBGVGC
	qaO8zpREwSQ==
X-Google-Smtp-Source: AGHT+IHJSK7Qp1zb5om02W592OqiY5udTEsk9nBSftpZyGmqI0e9P/OjwE7rDiAyfrBX382yq5jBhBWzuWKkJmGaXh4=
X-Received: by 2002:a05:7301:f25:b0:2a4:50c2:a74c with SMTP id
 5a478bee46e88-2abf8dee655mr691583eec.8.1765289856143; Tue, 09 Dec 2025
 06:17:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124182751.507624-1-robh@kernel.org> <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
 <20251124182751.507624-2-robh@kernel.org> <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
 <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
In-Reply-To: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:20:03 +0200
X-Gm-Features: AQt7F2rjwQKc_bRBeYsxUFhD_YJR9U-Y3qN6s4VMgPax1Na8ykfHoapTIdM-w18
Message-ID: <CAEnQRZDBZ52FoNRBJa1qScbkcEYKwbyP_ephutdkYFaY5b1yLw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Other platforms (non-QCom) were tested also use
> devm_ioremap_resource_wc(). So something else is claiming the same
> region? Can you dump out /proc/iomem?
>
> The region is dynamically allocated, so maybe that has something to do with it.

We noticed a related issue with imx_dsp_rproc.

Because:
imx_dsp_rproc_prepare:
 -> imx_dsp_rproc_add_carveout
     -> /*... */ and this calls devm_ioremap_resource_wc
-> pm_runtime_get_sync

imx_dsp_rproc_unprepare:
 ->pm_runtime_put_sync

There is no easy way to manually undo devm_ioremap_resource_wc so I have
sent a patch to use devm_ioremap_wc.

https://lore.kernel.org/imx/20251209140425.766742-1-daniel.baluta@nxp.com/T/#u

In your case Marek at least you need to understand which driver
reserves    8dc00000-8e7fffff : reserved and why.

thanks,
Daniel.
