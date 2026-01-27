Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBAB35CB86
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528852; cv=pass; b=npyVLqYcamT7m8njy7FA/txC7agNjIa6i3ePudxrylPPHwJKuT+8tB5f+BmSC5y/7p+ArX/oekVRu3RkS9Ur6M7OXqt1lQR6v2vQPI7bCQrllmSGeYAUfA1N/8YoHYlU762MVp8gv1BMyY9UKuseAm664R4reim00RznHxy4+5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528852; c=relaxed/simple;
	bh=HCLPCR2cutuEe8a9e/T0nSzNtiAitdZEV3TVlV7ptNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ln1xJU3AG+GS5OvbtNYs09ExZ+9jdX6WsG2H/XVSPCkZBHTHbisjfUCDn/lOQNxBHBpe3D/rlARMStvM5Qhi+JgRQgzRyWCLLWsbicuu+6iudmVAmSVEolzRPigl8Dr7Ejxqbl5HX8uzFqSWsM+OpjDN6/nYlmtYiCUUfqR3GQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJn17s0I; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJn17s0I"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b88455e6663so883784566b.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 07:47:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769528849; cv=none;
        d=google.com; s=arc-20240605;
        b=A3hgB2l2F4MAti2clkmVS0oWO23d5MKkz2NfBq6z9NvXly4bEF92O6tA9I6TGgcJ9y
         Ae/pnzKNqVKWVf9JFLM9b2OsGjF1PTxhzaqDHhVzv7CM7Rvj2EHn+iY8Hf2YeV11hp2O
         VCY7zpYtT8ezgTMNH64IeJcGJ0sQgM6cOMpifUBvR2M4FrLFNe8iJmGM3csVf4M24RBW
         4K3X6W+3/ByO11bhbBnDaNX10UjXoJFT3aqg8XsZnoj9rLNyOB3OecS1YavpfiFZhRCe
         9HzbuJInA+y1e5RnCH+zpxU8xrV/IfXllt8eU4e6MuKPmAg/xgoBNSvPn/VMqg3+7HyD
         JfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        fh=g87uBUSmDKKE1eAcldSYvhQYN7o2243fueCMwX78CZk=;
        b=bPKtP9Y9iR2Ulg0OPj5hfP8lPp76gpSnsZLPRxFx17zZXK+U+pA0T9/h5FuZEEzBp+
         1B3iHYKx11vTCTIb4bAW6Sye+ffBnBWMYEY3Gb9b4cjKN+ciLdgibq5zWXxLCtTGM39H
         q43sSutm9LEBMxtpyfah2cEtr2AUvHj2aQdxs64s3dy6t6j9nbONVjkvZy0y58iaVRMy
         e6bWmfdh+TfGdT5uqD2E5PjWi0DDF4/ZZ300oLwql2vsiqljZ8YJU9vga1sNEaFrpF2D
         MHiuKvGi1EDrDNeaT76H28rH2U525qxbH6AWpyukqS60htq/WsJiLye5fNF/TPKt1Nd9
         sjXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769528849; x=1770133649; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        b=qJn17s0IrTl4xJkDKhNywAaqJqGO9lHhElHPHVyKUcuiATjYXxws2FECPTUxpsFGqe
         mQ7/x2rc+Q3/19V8309D7DAMz3hUAy/hXulFKUJlfRVQ1gl3nc8SY6Vs8YWhqsqBhVYf
         oK0+5wIKd3aIwBGv1XU2wFQpsNak3CEv00bcoDhm7ZJ0YjxeVAw/8hh3Ds7TM4xyP/L6
         2aLUec/qKoXFpcJgsqGjUYQH2xDvY+OPASVzxcAVhKOrOfmD/ZpUo3dsejpp9nfunRAh
         MebGadxEOSu9DKrtB/pBWOHvSiVWNl79u75FH7TBiy1LvEQzecm/PRqyaK8W182LRnmn
         wQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528849; x=1770133649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        b=WR4BBTIg6CSCwKEI8AhRfwS/8SXA/mxY3ecbz1xD7RdaBfHfHGc+2sxUdJ6Wqqqalh
         0ScpXH817GmPFQMmAiGQIC42hu3XEMLhpmRb39IYfHoAhAmGFpXReI7ZNzHJU3kUaQqy
         B7caef1jSWTIf0pNNvSkEGOS7OIgb84Ib7uyvMbnc/CIeufROFfE9sa3f/yqoJSjcMAt
         ze+2K9fy0zh61zPJjXEQV5Pa/cG/Uityg2aN+jUvkD4sI1YmJT/P6Ppd0JdqlAtro3s1
         vjzP7Hu9Xd4ppn0qOXB5aXd1WaZ9xiGYRiBNu4noQxLWP7/RDZXZRwyk9X1IfB4Zv5yt
         EzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdjU9qH6Xbu0uIrtsuAxqDjSvHR5SMM2SXU8KXQty/tyU9jBNNRgLqMvPGpc3hqwakqyGvLM425qhrbhvGGZFA@vger.kernel.org
X-Gm-Message-State: AOJu0YwORZZNZdM0gUn7/F37ugOcziRc8DCfaOsI1lsjuHTMwdbrUI0V
	+tML8N5ycLwnw9p8E004L+3upbXonV5fhj+16Wc+oG5R/XSmdTnAXdA3MGtpyQxdsbQZJ5xu2ZI
	xIdsFGmwb77FVDa67flGKhGJPtvoDnsokBFq777pOuQ==
X-Gm-Gg: AZuq6aIG7ODNjNf6WXtg+rR9izRbRd0wMcFIEnhgvLOOjeZsWdrdXBwTeqjxTJljMSz
	1mYgc9Ds64DKbY/ZT19+apKrmlOT2nfrAIOHNqYietE6DBDnj6z/Me90VMRm+uALUemEbiVKSDC
	F6l4WgU5fYNCFtbkihVj0pPx0KFUB8S6H2kAYpI1NPmkjBRslaz+WC4lbbntoE9/RbaYwNyIlVm
	nMw3nzDXJM0HnnWmvwIOtSl/UXnx64tY9l+7G6vGMQkxB7GXPUI7Z55MvMelV+CCCIti+2eY1Gc
	bg6/TzGth6d5wohfi5DSKGWEPoIXaA==
X-Received: by 2002:a17:907:1b24:b0:b87:2cf8:f7b2 with SMTP id
 a640c23a62f3a-b8dab3e10c3mr158375566b.56.1769528848592; Tue, 27 Jan 2026
 07:47:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
In-Reply-To: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 27 Jan 2026 08:47:17 -0700
X-Gm-Features: AZwV_QjqQbFcKArui8POG1LTyVyFyhUaVHLmRHbU-P_6uXh9D3Ex2V3D86esp5E
Message-ID: <CANLsYkznMVh240wMUZGayJHRzsUV-NNTiU+ezpLt3rjcwSn5Wg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded resource
 table when none
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Jan 2026 at 23:51, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> priv->rsc_table is not NULL if the DT has a "rsc-table" entry, indicating
> that _if_ there is a resource table in memory, that's where it should be.
> Function imx_rproc_elf_find_loaded_rsc_table() is buggy so the narrative
> about a previously running FW with a valid resource table can be dropped.
>

(sigh)

You apparently did not understand my last comment.

> In this case rproc->table_ptr is NULL because the current firmware does
> not contain a resource table, but the remoteproc core still interprets the
> non-NULL return value as a loaded resource table and attempts to memcpy()
> from rproc->cached_table, leading to a NULL pointer dereference and kernel
> panic.
>
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no cached resource table for the current firmware. This ensures
> that a loaded resource table is only reported when a valid table_ptr
> exists, which matches the remoteproc core expectations.
>
> This issue can be reproduced by:
>   1) start a firmware with a resource table
>   2) stop the remote processor
>   3) start a firmware without a resource table
>

Another sign you did not understand my last comment.

I had hopes of merging this patch but the changelog is too garbled to
be salvageable.  I suggest you ask Daniel or Iuliana for help.

> With this change, starting a firmware without a resource table no longer
> causes kernel dump.
>
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Per Mathieu, Check rproc->table_ptr, update commit log
> - Include R-b from Frank
> - Link to v1: https://lore.kernel.org/r/20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 375de79168a1c8d11b87ac1bd63774a3feac106d..f5f916d6790519360f446f063e09d018c5654953 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  {
>         struct imx_rproc *priv = rproc->priv;
>
> +       /* No resource table in the firmware */
> +       if (!rproc->table_ptr)
> +               return NULL;
> +
>         if (priv->rsc_table)
>                 return (struct resource_table *)priv->rsc_table;
>
>
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-imx-rproc-fix-e206f8e6e477
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
