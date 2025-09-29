Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3E30648E
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151434; cv=none; b=JH76DybE8fhdTvPU7gz0lCE0X2mepzq57RM+ski3X6blPACHpJJLY19hZXZ7lo0GoJ9OMO3APrXBkKXoUC+rmu22k273VcTNHSsfByCdqWVthuAtWsKXUpL+U9N7yzpDTBzhA9zl7WG0tm648fdt/CnuTs4gLouymtSj2zsteXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151434; c=relaxed/simple;
	bh=zldeIVGYldYbmC65e0hKwaIJnCH6totj0tsfM+V6c/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cq/fZYEAWiEkRjq+7WWaIG2k+VbArOoE0GOR3m3U/SITQkR4sWzGeLRgV4Z5kk/npDOBswQKcc82tRwVgsdBFG5jkxXFJhPMEelKRcTf0Cbkv++KGq4wmR6iPZvHKLnQo7JMTcIkL6YhTj6ex0IAGnt9lz8MuQfMSwSp949wLNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yS81tLhj; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yS81tLhj"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60528734so50531457b3.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759151431; x=1759756231; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIgtSwakb4S2F49hv2ah0ceDD3kdcrnl68lJO2bz2SI=;
        b=yS81tLhjbLcGbCee8oU5M9P+U1Bnh3ct0b3Dv+9XHlnPLYmGz7JmWx/994FyywBWMj
         69XwkS4+Es4DvYiv082f6PKdNXMAOveZfQS8+BhYX+kmywfaF7hAkSAy3jGSB0E5RG1A
         NzAPNsS1YEprfJf7xncf49UBJBLz+r1j5KiFkobzukxsqq59gaViYC3IuQRUXf45egO7
         q/VRDvSV1kC3DgnoyKSNYCE+lzt2IVCgb8eIMOGIMTVNe06k73RXC0yoM9VDXdV02eXw
         RHHu7TXeSC/Yu09HYHX4a48VyuEjvYJTSJCqgnyuqk+0/MnpC2JLZJGVisBjtLaeQwxR
         kysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151431; x=1759756231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIgtSwakb4S2F49hv2ah0ceDD3kdcrnl68lJO2bz2SI=;
        b=oVlb6jh43i7DRhz8I1kRWhk9H9FLc1GYxqj+Rli+g8RwYjzhrnivuEySbrNz7N+FZ7
         qcRGBESqTW861jD7Wvpwg9Yh/amN6bcVi8VLOY3ljpqR5FtzSs5AKBKjjGg788hWrlB8
         dfYe+4wMvACnWcwlOMsKALAw+2t73FFEibuQBGF+HgiM20MwEXtAwoCXR2QfdwG0QGIm
         5cLD97EYQNeOCfU3su1KFyjN9IVHhooT93gKji8T1j5Ij7MvFImmTWcddqU+84je/IC8
         +StrNOWsaLOz/LZ29avc8COWuNTcaE9hv3SOgiF80baM0GLpXenVjw1JPd1TDFh9ZEjs
         OlMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpc5RA3AawVORfqUpMaQp4atPtfQVX62rzdaOU7cyWJePN96oSuH+lUJQrzPp/wl38/t8MPHZyYNdctag1o/0O@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJ545pMYx+dvsVsG2VsZOjTb7oqsvSSP9dl7/H8z5eWShv801
	cOVeSOQFVJhI9nu3J9rsjoq2V7WK6iZRXQQYq2HCTf8bct4oeeBTr9efNmfTX1um7Qo56DPiJvr
	s8Gg9CeAR4PZMGD8tVNYlAigM+mMt85kOkDBMcgRn1Q==
X-Gm-Gg: ASbGnctm5j96gCewLAcGfYn1d1BsInHLxmoJocFYTeDvFIiRRd4MCnhIT49RtiHFA7G
	npvJDTs41X2IrsbfFiqbDTRG21IIEtKAiI1bA79YMHm2xymLUhqOyghXKMdHirL9AQdOJXNfeBn
	uuy+PM4ZwEGGmjAFYD0tkyC9uvzWb/HPK2zFa+Q1UFI8TCQLpWrvFC9WnFxIeWq37A8uNopJ7ma
	p2glZmO0keTRpzpLuE=
X-Google-Smtp-Source: AGHT+IEaqhle1COgySgMHCGl7/RAGDslrMpVmtc/WxzU5IvlxnhajJDxwCn8WYXyXNTN50BLyVZqReaPXPJrWYY1F9w=
X-Received: by 2002:a05:690e:154c:20b0:639:2794:3416 with SMTP id
 956f58d0204a3-639279436b2mr3662726d50.19.1759151431542; Mon, 29 Sep 2025
 06:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com> <20250926-imx_rproc_v3-v3-1-4c0ec279cc5f@nxp.com>
In-Reply-To: <20250926-imx_rproc_v3-v3-1-4c0ec279cc5f@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Sep 2025 15:09:55 +0200
X-Gm-Features: AS18NWBrMVxKi_O1xz826dCqJxNTtrsBYTk49Oo4lKT0mm4rt1UcT29ebmOL9cg
Message-ID: <CAPDyKFqsDjn2+6XxY=Dkv9qZ6weTaeChwsSHvnHFnFzbYQ9bUg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup and
 improve remove path
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Sept 2025 at 14:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> Proper cleanup should be done when rproc_add() fails by invoking both
> pm_runtime_disable() and pm_runtime_put_noidle() to avoid leaving the
> device in an inconsistent power state.
>
> Fix it by adding pm_runtime_put_noidle() and pm_runtime_disable()
> in the error path.
>
> Also Update the remove() callback to use pm_runtime_put_noidle() instead of
> pm_runtime_put(), to clearly indicate that only need to restore the usage
> count.
>
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/remoteproc/imx_rproc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..8424e6ea5569b9ba6b07525643ce795faaeb2898 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1136,11 +1136,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
>         ret = rproc_add(rproc);
>         if (ret) {
>                 dev_err(dev, "rproc_add failed\n");
> -               goto err_put_clk;
> +               goto err_put_pm;
>         }
>
>         return 0;
>
> +err_put_pm:
> +       if (dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_disable(dev);
> +               pm_runtime_put_noidle(dev);
> +       }
>  err_put_clk:
>         clk_disable_unprepare(priv->clk);
>  err_put_scu:
> @@ -1160,7 +1165,7 @@ static void imx_rproc_remove(struct platform_device *pdev)
>
>         if (priv->dcfg->method == IMX_RPROC_SCU_API) {
>                 pm_runtime_disable(priv->dev);
> -               pm_runtime_put(priv->dev);
> +               pm_runtime_put_noidle(priv->dev);
>         }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>
> --
> 2.37.1
>
