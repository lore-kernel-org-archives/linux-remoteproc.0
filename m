Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D52701C4
	for <linux-remoteproc@vger.kernel.org>; Sat, 26 Apr 2025 20:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745698479; cv=none; b=AouNCtGbejuJvytRvCMCWAIONnAIjIaOkoJ/+YjSuB+SLbJwXvvj3Z4JuIkATgzZQ3t0uU4G2NphLcWJt5nRo7YcbeULJgckW3Q6o7aMWxcpZqkDFAvscOeJNguANjUNGH07KcKH9N/s22fErNOEtbUAO+GdxJNOV3YACDjH1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745698479; c=relaxed/simple;
	bh=7LNu7v1jz0aiIiM5mfAjNvEqZ5cWO67PVyK5u0S37to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dL++V5u+0caohK+1RcEOvsGbsBXhg1OnReP2mMxaT12XpUr3e5KAmxCXdBk/XkpYk+GEIANTwEmku1H/9R4qtMU45pj2Pws/SRnEONbWEjHz/XZ4PNkjNWmtVNu7gJmsfbgO9GJW9xrBqc2jh+nK2znuXut5nQHDnG8u6JRGGSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/CYDXbz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/CYDXbz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so5704315a12.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Apr 2025 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745698476; x=1746303276; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMFVi6kMs2GlW3FqbZ+c8W0mX4h+96g36QjGWqU5rnM=;
        b=q/CYDXbz7U2/orLSpSTCakYT0O5fcWRRngE/rlr2vl0E16GoxCgzx0nbytoyEF/AH9
         NWlanfpKmaWfKLGBpPGRyUTFIOWVGDHPHGty18Tzp88v/gvV3KsZ+2exAGC1ib8+X/xD
         h63deaBEKADVAFka0j11r31eiumEd8754bf3J0J3LE35qHDqV3L0Jf6NF9EKMl7ocMcc
         4JsQTOZzFytwjRtDfiq0EOi0nYWEGo+9+FF/zfXkwn20bOqcGZnZ0U/wRX61NORfroTB
         tuVAI5vwGPOFu/1uNCAfGr+Oz5133HhphrP9PXuQPLrgyOMfsSf8c1yrOFeCOC1fAiG5
         SdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745698476; x=1746303276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMFVi6kMs2GlW3FqbZ+c8W0mX4h+96g36QjGWqU5rnM=;
        b=VDxr8ru7Jv5vV/ynfHDpOXs4+1VW+aKXECHT3zPzpU8Dvtoebjh/zMxE9OjIlTM07o
         wekqmmQa/GrAey81MWB7piWCY5MYiVJ6I3VYrxkzXMbHlaNc+Z6sVA+ahRe2dFRqQisG
         PLwUQNbmKVL5cjCdj7mfRRiMjqQrWa5maqqUKeAUkO4W9SKYxqAwj1AArFEXYz0GdUCI
         +3PAb7uAIpIgPmxi5sDFxHxRZBayN4BWrqnPKIrtOO1crJ2l8ffc81A5DVFZWmUiJ5dG
         9IQGoJqZXZrtiV3K4nNMmcqdbUm6V3yMp++ia3DWnOdmBwFYsgp5NBu2rWW5eJ8pRq2h
         5hMA==
X-Forwarded-Encrypted: i=1; AJvYcCV8FcrEILNsc1nTHlhPhqH2/8OZXFXWFy52KyZDEORPX/Me4oCIT74BCbG0h66EMre02nSSOjuEBwc6lTe7yH5q@vger.kernel.org
X-Gm-Message-State: AOJu0YxShvrhOA1v5dKiW+4YnIZhearfuEi4NiNupgxIWxEvDmezqZgi
	49+vVwZ7QkAbMv10oO/QhQHIcoxCAoGxuSE++3bDfHrZkHWCas0UrxC4kYrT1DFaF75m5QxTOkd
	OjNHTwwmaoA4SQ9W7wN1hUAqUbRev/gGCvEEQ+g==
X-Gm-Gg: ASbGncuZ6jQ157UBYlxWcJkPJm7AYsa+DuCZN/ZiS6hFp5uXQXBzPkZ29F3hCCQ4Lkc
	vp856ZyJ5vHQHMirqscGt/HKPdeY9TMv39DppIrP4G0+BfMQX1GtQwncmAiPeY3GWfYCbVIwqg8
	PdQdOfoXxewMHhGAbF7JUHIrHNuJjUroR7QxD4LTc499vnk7cHte5891Rx
X-Google-Smtp-Source: AGHT+IFzAcYkrWSpLnALMz4IOmWDHGW3c3A0BJ5sxt15g5Kcfu+Hi0BvKk6p41FqxLu0PhKfP/bQOHVtQB7bKF8yLXM=
X-Received: by 2002:a05:6402:274c:b0:5ec:fb3d:f51f with SMTP id
 4fb4d7f45d1cf-5f72269088bmr5668937a12.10.1745698475929; Sat, 26 Apr 2025
 13:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com> <20250426131804.GA13806@nxa18884-linux>
 <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
In-Reply-To: <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sat, 26 Apr 2025 14:14:24 -0600
X-Gm-Features: ATxdqUEm-fDJNLvyvlQsgTBEC97JqhRG-_wf6f2Ng6j5VajbYKC45hcbu2ANAzk
Message-ID: <CANLsYkzNE-Z8LwEtpXrmnWLLDNvzjFYaFHVePE_mSkmWVdQ6Zg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 07:46, xiaolei wang <xiaolei.wang@windriver.com> wrote:
>
>
> On 4/26/25 21:18, Peng Fan wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> > On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
> >> When rproc->state = RPROC_DETACHED and rproc_attach() is used
> >> to attach to the remote processor, if rproc_handle_resources()
> >> returns a failure, the resources allocated by rproc_prepare_device()
> >> should be released, otherwise the following memory leak will occur.
> >>
> >> Therefore, add imx_rproc_unprepare() to imx_rproc to release the
> >> memory allocated in imx_rproc_prepare().
> >>
> >> unreferenced object 0xffff0000861c5d00 (size 128):
> >> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
> >> hex dump (first 32 bytes):
> >> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
> >> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
> >> backtrace:
> >> [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
> >> [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
> >> [<00000000521c0345>] kmalloc_trace+0x40/0x158
> >> [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
> >> [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
> >> [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
> >> [<00000000e7e994ac>] rproc_add+0x124/0x17c
> >> [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
> >> [<00000000efc298a1>] platform_probe+0x68/0xd8
> >> [<00000000110be6fe>] really_probe+0x110/0x27c
> >> [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
> >> [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
> >> [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
> >> [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
> >> [<00000000db3eb243>] __device_attach+0xfc/0x18c
> >> [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
> >>
> > Fix Tag?
>
> I will add it
>
> >
> >> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> >> ---
> >> drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
> >> 1 file changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> index 74299af1d7f1..c489bd15ee91 100644
> >> --- a/drivers/remoteproc/imx_rproc.c
> >> +++ b/drivers/remoteproc/imx_rproc.c
> >> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
> >>        return  0;
> >> }
> >>
> >> +static int imx_rproc_unprepare(struct rproc *rproc)
> >> +{
> >> +      struct rproc_mem_entry *entry, *tmp;
> >> +
> >> +      rproc_coredump_cleanup(rproc);
> >> +      /* clean up carveout allocations */
> >> +      list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
> >> +              list_del(&entry->node);
> >> +              kfree(entry);
> >> +      }
> >> +      return  0;
> > Could "rproc_resource_cleanup(rproc);" be used here?
>
> Thanks for your suggestion, I will try it

Before sending another revision, please detail the steps needed to
reproduce this problem.

>
> thanks
>
> xiaolei
>
> >
> > Regards,
> > Peng
