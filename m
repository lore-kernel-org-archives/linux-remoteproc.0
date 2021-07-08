Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A4DC07E96
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Jul 2021 08:14:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF3C461CE5
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Jul 2021 08:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhGHIQ4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Jul 2021 04:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhGHIQy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Jul 2021 04:16:54 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1408C061574
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Jul 2021 01:14:11 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so5069368ota.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Jul 2021 01:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gid4rnqIBzMMVsvpYAgpOIx7Yt26Fq5yjtUjRBKFcfc=;
        b=Ua+Iovn3NCc7gqft1L0F3M2QZiFNPcI55U77te2X3MFnOhr8+5rsQCbbHfy1o0btkF
         mVWAwQiOT5/PHys3FGcB8wa1SZ7pi81oTeVgzIdjX5jG2uhgCOtKtrqKbDekNgQmKCEB
         P+ZScdh/wSfKAdjWuoGHl9oSPLtOjIszhL/Uu/dhfQbV07LvpT9n9tHxqliIfmlJ4IHu
         lWObEeuJ5vjmisj7yFwQsZap6evkXVvvi8yYszdG9g7Cn+68QFALqNNcSiZSpfUEfe/b
         PN6bA1vfcOZvXP4BaydnOpoNTenAxI8UUQRgZXqmJxZz+uBxwNeFNtSKbg05fOc83GxJ
         E/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gid4rnqIBzMMVsvpYAgpOIx7Yt26Fq5yjtUjRBKFcfc=;
        b=X1pdRjLz3hpNhin5sPklTjT2OpABLikFp0dxmAFLKYBPQTKgSRSFTw9yaSi8TMFI0u
         LiPjnRE5jPW3E5FdVbx7H4Ate3G0UZqbhLwBPKNlpjtPU2uehfdXZIrzD85IrS3Tu10K
         pzwXe5UoDaXNdrWQ6KtSxzVQXEZCzSU8TXxorMdaz5Wea6alUQh14lKPljg2tj+T0Idq
         wc28iXLHjjymxlD+Qlj6S5E752W0IeFXNCbkl9QQ6yRQSZFXSQzSNrsQ6yUyfcFAkVGq
         Sz2+voXeOxUDfiJuby21FnZGrNtT3dOhnUmleOT1B3eEe+8jMLUrTzaRqXBTvoiFUgKY
         W+iQ==
X-Gm-Message-State: AOAM532N7CPZrrsMR4FxbqBeHy70U33kd7EVkaq8Q0shFw0WzusgZhki
        qj0J7i132+iqR5nWIgU0B6aqLb1PeHTfMvUnaNY=
X-Google-Smtp-Source: ABdhPJwXeHB7EnNMjGnPzrsbZx6nNExpCxEDcIx4a8DIn8xOWWAAs+4Vk+TotUv7TH7vt8hEkeqqmD7MvSUTwIauWOw=
X-Received: by 2002:a05:6830:150e:: with SMTP id k14mr22539023otp.118.1625732051209;
 Thu, 08 Jul 2021 01:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210707094033.1959752-1-aisheng.dong@nxp.com> <20210707094033.1959752-5-aisheng.dong@nxp.com>
In-Reply-To: <20210707094033.1959752-5-aisheng.dong@nxp.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Thu, 8 Jul 2021 16:12:14 +0800
Message-ID: <CAA+hA=So0nWDw8KFS=MjnfjfpsByLkwiFh98w2gbyMDDHx_A6A@mail.gmail.com>
Subject: Re: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc for dram
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-remoteproc@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 7, 2021 at 5:41 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
>
> DRAM is not io memory, so changed to ioremap_wc. This is also
> aligned with core io accessories. e.g. memcpy/memset and cpu direct
> access.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>

[...]

> Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Above two lines were added by mistake. (copied from patch 4)
I'm going to wait for review comments first and resend with changes if any.

Regards
Aisheng

> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v1->v2:
>  * new patch
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index ff620688fad9..4ae416ba5080 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>                         break;
>
>                 /* Not use resource version, because we might share region */
> -               priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
> +               priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
>                 if (!priv->mem[b].cpu_addr) {
>                         dev_err(dev, "failed to remap %pr\n", &res);
>                         return -ENOMEM;
> --
> 2.25.1
>
