Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3045AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Oct 2022 19:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiJDTwL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 Oct 2022 15:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiJDTwK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Oct 2022 15:52:10 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B273F65645
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 Oct 2022 12:51:56 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y100so19757064ede.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Oct 2022 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7dAFZ0Dv74viOjab/o6SdVduwwf4JhWfgRlUOHBIw8s=;
        b=p1Rf07UZ6nQSCG9E2dB1vRGVLdfDE6pwCDbvEiwzmXiNm8hJsNPkwiXVEXblsgcTMO
         VD7elVi7Im7+BdHJKgOrYhC1xTHRHa6v75jV+Cj5KYkTaf2vqtTXohDgNbX5xUavrV0+
         oR+j5h3G4GJaGr+QCRnFqEuAr95AIRhOWnhGhQH3PG3JdXHqZ6uUcn0icJxqTCJ8TWSN
         W2NrDXPLKkw+1VBcphQbF2Q9Esii2ytqFi+A1ZJ8qPHSczRAp2pkyS3+7nRmsbflYICs
         DKyBZrrJfVWF6hfc0ESiJYhiqC3TGVY99zj+NP/9rudqbBJeXwvQ8/mLhg+Zr6/c9SFU
         Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7dAFZ0Dv74viOjab/o6SdVduwwf4JhWfgRlUOHBIw8s=;
        b=QhnDNBqJWh7vf5gH14E9uDMvs5XTye5IoEYG2UyLpLtVhApwv462AvDgPO33u+8lOJ
         ATllCp35saxKX2d3M6DfuQ5VrFEpMXIIe34COimDDBZEF7oPm/qcaaOMrmsB7NUe0gNa
         wHRi0IkAzTPju0NFcPeuGNfjbrz/5E7Coh37HGhU6lXuQnT5B9HG37qq1k0/DFvAQSxl
         n3EQxYTZ/NoPtP/AxnpDlhYW8gZmvcNyHV4hel3kKZOLX0sRxs0tTkLLIED1Vrup0bUu
         q/pVCi8tDzvaG91H9SKBfSffkfBbmQC/4jP42aJjFTLzlLaVLVZpUlHDYek4SkSwJm3j
         itNg==
X-Gm-Message-State: ACrzQf0b8VB977o7iWXno7hd3oecBB4D4v4uFI6UGQKSd7ntZJBF0YFC
        Sqjm2WNtniV86ODZFd1UQ7Do2CcTet6OFEaMeOsvxv4w2lA=
X-Google-Smtp-Source: AMsMyM7tp161kPhb3d8RhOwSScAFsLy++rlzF6dUMDcpt01r082kRDSLrp9nYObjuNioSwTIh1BPKNN1kU8tq6QyjKY=
X-Received: by 2002:a05:6402:40d1:b0:44f:e974:f981 with SMTP id
 z17-20020a05640240d100b0044fe974f981mr25889439edb.222.1664913115282; Tue, 04
 Oct 2022 12:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 4 Oct 2022 13:51:44 -0600
Message-ID: <CANLsYkw357ajx8BnbykKiVD+BVv21VwAaYjvFDwqbvEw7cBDHQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: virtio: Fix warning on bindings by removing
 the of_match_table
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 4 Oct 2022 at 11:40, Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> The checkpatch tool complains that "virtio,rproc" is not documented.
> But it is not possible to probe the device "rproc-virtio" by declaring
> it in the device tree. So documenting it in the bindings does not make
> sense.
> This commit solves the checkpatch warning by suppressing the useless
> of_match_table.
>
> Fix-suggested-by: Rob Herring <robh@kernel.org>

I'll change that for "Suggested-by:"

> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index a29e3b8ff69c..26a7d8c498bc 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -593,17 +593,11 @@ static int rproc_virtio_remove(struct platform_device *pdev)
>  }
>
>  /* Platform driver */
> -static const struct of_device_id rproc_virtio_match[] = {
> -       { .compatible = "virtio,rproc" },
> -       {},
> -};
> -
>  static struct platform_driver rproc_virtio_driver = {
>         .probe          = rproc_virtio_probe,
>         .remove         = rproc_virtio_remove,
>         .driver         = {
>                 .name   = "rproc-virtio",
> -               .of_match_table = rproc_virtio_match,

Yes, this is quite simple and slick.  Rob - is this what you meant earlier on?

>         },
>  };
>  builtin_platform_driver(rproc_virtio_driver);
> --
> 2.24.3
>
