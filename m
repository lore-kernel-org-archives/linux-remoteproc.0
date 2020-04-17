Return-Path: <SRS0=ybdg=6B=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9393C2D0EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Apr 2020 17:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8CEE2078E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Apr 2020 17:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPLUpW8n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgDQRE1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Apr 2020 13:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbgDQRE0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 13:04:26 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F81C061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 10:04:26 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id e127so3055895iof.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4lySji5eZr7vFRyXo+ccYCUZufUMHPBXSg6yDFBfT+0=;
        b=cPLUpW8n3CrcKqGSdBWo2qZR4aSmpF9ftFZ+jW/FhLcZDtbjVnLrWPHldUq6G4q18R
         uHnAt/ExkFHgTiWZyPw1571yLyTaII6dejTxO1K9JCbxeM4rqv4SazKR8NuHJLjOYdzh
         RBLshabzlDr9UEeKGsxqNJ+P0RRLpuiotqQqqGi8h7H7dvW8PaQj2VemkHAu3ax8G3kp
         L9iXqGPAwJ5s9wU4GsuRXfY/gnyEfkdQp5ipYFfRhsZhjpTRF1o3ygmDfSQ37Vffaw9h
         2UCGbC0JZ+b0HoMmCC3/JnFdPYERkS63qAGXwqBwizdwz+W/+GaTp/M/QAJ7RHJuYv7G
         9XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4lySji5eZr7vFRyXo+ccYCUZufUMHPBXSg6yDFBfT+0=;
        b=nRcbJbeCvHfU1tIGjWQlD3vqWRmX5LfLhf6F2YZlRiFBwaUpCvPuKwxyv1pFBtljiu
         OCuwPSvMtkQ2kQMCnP+QSARVe6SuZlRHMCePBcSn4MpEIQWprBK6y6RBWAOcAR1JmBMk
         RpXzzqe42Tr+W87Rn7vLRFbM1CtCR4DGVc79ggM59PwGQXwWY42u58M03Kxai3ZBcg2i
         gwu2g1c0KLifJrbwW/0wzA5TUJk+tLDVsaq1EKumPrPO5qIwBFVArpxZg1QEEjSqoclW
         i1Fc9w/478tOQ71n6EDd66T50MRQO/z2zKwxTCOe/+xecnxniEsDI6W8a9RCeIXRabo8
         m3+g==
X-Gm-Message-State: AGi0PuaBDo36eExK3Gt5dCmUC/A9LeQY1q+9iWLBMlCYwzj7Zim5fDxn
        pTLfpkHmGomSe1qGpuEOSOtUAB6FIxZKCxc0uuFvaSwL
X-Google-Smtp-Source: APiQypI9r6/CwVn7ZGYRSPvTc4tAXquIPq+CygktIDWtI503IFDTNxMoO6h/tMkgcO8GaCXcGtosrwZ0ZCzspSiKM5c=
X-Received: by 2002:a02:4445:: with SMTP id o66mr4093213jaa.36.1587143065543;
 Fri, 17 Apr 2020 10:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200417002036.24359-1-s-anna@ti.com> <20200417002036.24359-3-s-anna@ti.com>
In-Reply-To: <20200417002036.24359-3-s-anna@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 17 Apr 2020 11:04:14 -0600
Message-ID:
 <CANLsYkz1LF=stn1E1uBQzBrLvMxio6=UQxQ7=jN1cVNT7P3Dkg@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: Use a local copy for the name field
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200417170414.tKL13rIz3WG3mBOmGDYc76U3oDTaMD_XIvDfK5z4h3c@z>

On Thu, 16 Apr 2020 at 18:20, Suman Anna <s-anna@ti.com> wrote:
>
> The current name field used in the remoteproc structure is simply
> a pointer to a name field supplied during the rproc_alloc() call.
> The pointer passed in by remoteproc drivers during registration is
> typically a dev_name pointer, but it is possible that the pointer
> will no longer remain valid if the devices themselves were created
> at runtime like in the case of of_platform_populate(), and were
> deleted upon any failures within the respective remoteproc driver
> probe function.
>
> So, allocate and maintain a local copy for this name field to
> keep it agnostic of the logic used in the remoteproc drivers.
>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v1:
>  - Patch baselined on top of Mathieu's rproc_alloc() refactor
>    series, and so addresses Bjorn's simplified cleanup comments
>  - Switch to {kstrdup/kfree}_const variants
> v0: https://patchwork.kernel.org/patch/11456385/
>
>  drivers/remoteproc/remoteproc_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e38f627059ac..3cebface3f26 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1984,6 +1984,7 @@ static void rproc_type_release(struct device *dev)
>
>         kfree(rproc->firmware);
>         kfree(rproc->ops);
> +       kfree_const(rproc->name);
>         kfree(rproc);
>  }
>
> @@ -2069,7 +2070,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>         if (!rproc)
>                 return NULL;
>
> -       rproc->name = name;
>         rproc->priv = &rproc[1];
>         rproc->auto_boot = true;
>         rproc->elf_class = ELFCLASS32;
> @@ -2081,6 +2081,10 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>         rproc->dev.driver_data = rproc;
>         idr_init(&rproc->notifyids);
>
> +       rproc->name = kstrdup_const(name, GFP_KERNEL);
> +       if (!rproc->name)
> +               goto put_device;
> +

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>         if (rproc_alloc_firmware(rproc, name, firmware))
>                 goto put_device;
>
> --
> 2.26.0
>
