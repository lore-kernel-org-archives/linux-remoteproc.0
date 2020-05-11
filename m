Return-Path: <SRS0=6wT4=6Z=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89672C47255
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 May 2020 17:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61B03206D6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 May 2020 17:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nfb99L6T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgEKRpR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 May 2020 13:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728046AbgEKRpR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 May 2020 13:45:17 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39FFC061A0E
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2020 10:45:16 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id s10so10736586iog.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2020 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTMcsGbSNPLL7L+tUlyt0FenOS7bLLaekCh7ftl59gc=;
        b=Nfb99L6TDVBBWvt/W0lqIjZKrLZDJ/LXYKTvX3IvTOiMFZN/A1DIPF051AUp+7tDkX
         sVxPiC2nZH5U1Io2kW6fVGpMx0LndJCvV34Rtso3BcUX/uM3fh+Tn6Vv0dzctSr/Sr/h
         oOigNR9VZNxYR7ovbguI2IiC8jqBsgoBPcFVnPRW3diKX5sGiDRwDwEVYlkUdYFKgJJo
         a9K6d4sMtYVdzpts1rmuMGBOlg9MC0MDNS7lYCgvz8oZVIPDKCqPEbsSwSnIMt8JFDlO
         wPJa+exWgkN4H31DKuofRThFklXX4KwpyrWMoDwOYrBrEAy19dk1llmjWrb2Y9/Yp/2u
         xbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTMcsGbSNPLL7L+tUlyt0FenOS7bLLaekCh7ftl59gc=;
        b=hU573yiV/gDHB2g2XqNzcAIaQorRWxe3WYclE12Ifrj8z4l1gW9I7v1AC042Q81xai
         XuUjpWMbPHLFJnxr6ExJy1QKeRjh/Pug5KUBOjzaV4uIMCERcxcgun44bjaCOWLponAX
         rcpSuX0qqrakWHDqjSoEwJjUEpfCBLcn5MOhH3XfmeJRBn7QEcxFij4sVY+dRTCLVp1R
         +ebrQ5MnZXrZzqXcXk8NCfzCqF8jM6w3Lh1eaoWuGXVKsd32nKOUcYpufCEDHeKE/sHc
         FyzdEn3/QC5nehLVjllZBddwUxC9pi18qCjaIU1nezWaJIvcfkCMp+MnsVO/Fq/LdG9C
         pYeQ==
X-Gm-Message-State: AGi0PuZmioOxtVTXjV9eHOkqD7U4G36TqYFLUTk/GlcyOS4Ck1fuM/rR
        iNerOXovfLHy1+g+gsSmuT8Qr4seCICIaw7fwFJ37A==
X-Google-Smtp-Source: APiQypL8QQIH8rAW3VdEhTJm19ncep/OtoyHj8sVIDxfQabUswS2mLh+6DC+2Nmsa/EfSAbxASZU982W9dmlWpW0JZE=
X-Received: by 2002:a6b:dd06:: with SMTP id f6mr13132232ioc.90.1589219114664;
 Mon, 11 May 2020 10:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200509084237.36293-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509084237.36293-1-weiyongjun1@huawei.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 11 May 2020 11:45:03 -0600
Message-ID: <CANLsYkxn2QAHgGtmygbw4x-kmrzo2R5u3XDmDUz5EVAYg=SQyQ@mail.gmail.com>
Subject: Re: [PATCH -next] remoteproc/mediatek: fix invalid use of sizeof in scp_ipi_init()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Erin Lo <erin.lo@mediatek.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 9 May 2020 at 02:38, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> sizeof() when applied to a pointer typed expression gives the
> size of the pointer, not that of the pointed data.
>
> Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 2bead57c9cf9..ac13e7b046a6 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -132,8 +132,8 @@ static int scp_ipi_init(struct mtk_scp *scp)
>                 (struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
>         scp->send_buf =
>                 (struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
> -       memset_io(scp->recv_buf, 0, sizeof(scp->recv_buf));
> -       memset_io(scp->send_buf, 0, sizeof(scp->send_buf));
> +       memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
> +       memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
>         return 0;
>  }
>
>
>
