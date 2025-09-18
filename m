Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019C83594E
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Sep 2025 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198858; cv=none; b=IBLYBoE+GLmdmBl6B/rtvIuOIaudSV6cXGHm9wL5wjIvz6YwiOhp/VnWcfZpzAGznN9ubcACH6mqJ1H3Bg8vh12DouJD85EllXfSHDHceiX30WJhx6xPVZy8nESB9gbmRBmD3tpnVcmGwTX+Au03KTfkIm7yNc/KyCuG/hFR4pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198858; c=relaxed/simple;
	bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6755iYD1zFm7W6NTyVDRf6aJKUCG321/eWCapIFBY+q5BU+QVpNEiA7Rx0YYRduI2cjLj4yNoIfQkbvfyCu4LJ8a7lyydHRQmtCzJ/r0zdQBruyMdgjB6ClQVQop8AH05lDOflGtldDYGAfbaAEKDE+dliuPMeYnLTasjYmCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBc7eqQX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBc7eqQX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-26799bf6a2eso9111025ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Sep 2025 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198855; x=1758803655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=;
        b=hBc7eqQXSs8wv9tjBfVgCkJafljF/8kvDAEdmvAl5aLS0TdJxDbCpmCgTmuXFkCNw2
         5b4UTTsEavMzTY24Cu5bClb2IQG8LHnO5VDuxwmCs8Zw7bNMlOvV2U+yOIpvpZNlg1xU
         6Vo1TSCOHpSghn2ATdinrkyQezdyyo+htiJT/08YvA6iPEmrrbc6K6aun392fzqpp2BZ
         01IuLUsY9KiY6Scvb8QHfdcNiNxtUFNcZnuw2q02MyermtEfQyxNbM4JZ/Y8Q6EnJsO1
         vpan/z5Mg+jjvLqVUrI4bgfE6P5eE6NowSv+pgI7+Zt37P8w/WEtMGGgXNswiKJpNX6X
         SC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198855; x=1758803655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=;
        b=QQWm7UA48Yy8k6vKj/7z7PTBuRnCPGDXl/6EQkYZt5tpc/sc8vxV9oRIg/qna6bvGA
         lwjo4yrzX/iodtiXgXPeJD49lBtJ5MuycC5dXk8e7aNY6a44uwIqkrxU17OHSrztBsGJ
         uKd0svOW781iT1HSvZUkpLTwu1S4MsoFWFaFsVtcws7PuEPrhb1cc1mte8hw1nXH03Gf
         vqjBns+LHDFqdS1gKaa86zV1mueFiJKjhFR706eSiE2jmoS1W7JGXMnij+v3x36dCI0Q
         30zdDEADndiVyRAbTCxCUZnj0TcSbhpsJGLdt5Vvp2t7pHSx9Ql7LqyPOILTHWgXJ4cZ
         p38w==
X-Forwarded-Encrypted: i=1; AJvYcCVzF/fTgw6r1ujzF1N5xsZhHNegjcQX1XgdXxvDS6+CNRT9n+fXr1eiWxRe2rJ4K3KRYKjv6kkrSZhcCXyveFuw@vger.kernel.org
X-Gm-Message-State: AOJu0YxXRlEnGa9zcO48kayvl5TrLTsUg91xGHm6Sp6koCq38COvaUkq
	/9BOQvSqxzeRiSwvl1wQCP7FRcEVjBUBGrFnezzDiLBUzc42No8sfudNmQ7lFaK98P6pdbElbYn
	z+M7MX5GyOqoACL4CrSm8f9ID1l4H1Us=
X-Gm-Gg: ASbGncup8p9LLqsSqPyf+v/gU7rfA9irqp2B3Ogg5A6pLH+2o+cOSv5nuXOsnJ/1UWu
	IlsxDDARSZzQxy3Z4ja3ZWeg9CsE1HCWH2vBNOkY69uHgRxIc20SSV9i0kkitHx/j2VJ+xEv625
	OwIGJuHogvAP6Dn7/SLRyyNSlXFExJbwqZ20NwH++4JpId0YLNxTye3ZWeQd2FxmlIoO1IFxspl
	txix3v0BJ8vyY/WWoUiH0Lr7QuzNIqdYm+BJ/S9qQkzMZNE2iQlz/w+S11cMzvmGw==
X-Google-Smtp-Source: AGHT+IGnwyZAzgewsFS8BUxGi1+hNmSjaadWufVUdwqAGCS8aqyS2HM8fO6whTlbN/7oWRWldmq3iDfdXt1FIzoF+PM=
X-Received: by 2002:a17:903:3c2f:b0:24c:f589:661 with SMTP id
 d9443c01a7336-268118b963emr75488845ad.11.1758198855204; Thu, 18 Sep 2025
 05:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:36:33 +0300
X-Gm-Features: AS18NWDAzLMXylSrWYdgmw06GR6oKayTLcqLKRKndzdOYMuF8YWkd9yOlAi8pkU
Message-ID: <CAEnQRZD9XGSzYBYMF+0G9RtDo4y-RtX2n=5M9p8Osk3csYrbLA@mail.gmail.com>
Subject: Re: [PATCH 2/5] remoteproc: imx_rproc: Make detach operation platform-specific
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Refactor the detach logic to support platform-specific implementations vi=
a
> the dcfg->ops->detach callback. Allow finer control over detach behavior
> depending on the remote processor management method, and make it easier
> to add detach support for new SoCs.
>
> The previous hardcoded SCU API detach logic is now moved into a dedicated
> imx_rproc_scu_api_detach() function, and registered via the plat ops
> structure. The generic imx_rproc_detach() now delegates to the
> platform-specific handler if available.
>
> Also, the dcfg->method check with IMX_RPROC_SCU_API is removed.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
