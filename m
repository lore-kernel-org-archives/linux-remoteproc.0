Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388BEC55ABD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 09:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFF7C2225E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 09:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ofrPYkxt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgKPIp3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgKPIp3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:45:29 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA9DC0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:45:29 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id y73so8723626vsc.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DbKk16NI5p2pQ5Vkp2eQt+oH4jAwfu7+8232QxkCO+U=;
        b=ofrPYkxtv/cs3S+9dJbrlpk9TX68OgaStRCpSdUnu+uY6Bg6fWnfQGEOPO2gXwUXxt
         FelpjVA1Z9q3ZfoBXej1h9RF8cLaDZ7Ow3viO89QU0xD8lFteDvBYsRH+YXw7tos96LQ
         bDTKITx4Ex7UyPy/o2JvF8WpKjN3s2jcxH6qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DbKk16NI5p2pQ5Vkp2eQt+oH4jAwfu7+8232QxkCO+U=;
        b=NldSCyvmAiz0IlSDT8RcWHhOxABNy7BDXBlEz2peF6KovgdyE4El1Q64kP2oyJH/6E
         /arAOqqt4X/U/o1+iIttlQjhocVPw7OvXqRa85QYPnWyglE8lzGGeUZJkiaNEad3v8gc
         LkkKJNcDJbOvqyMGQl07wdPBorKfoJlSnURt6ldWHOUPA4lbtKbJsS5eo+synNikv9J5
         qM4yq91hBMMF4+2V1lftDnvhyFY/t9Yfis39uNYbwgUXVOxfiFmAHd+Y2pXgIUfM2MyV
         4aDf1C8SeJAhGUWbo7JJNkiYWvWw3jiM0fXkRw/eRNXTqT0L3pva5n6L3R234KgsWpH7
         MkBQ==
X-Gm-Message-State: AOAM531HqbZQS1AEQsB3EX9bfTm8Ds1Em/sj0eM0eez672BDmsIk3F9e
        2i9nrzNYpFs54xSJ5thUOmbTjOljoZCIsIashBnsBQ==
X-Google-Smtp-Source: ABdhPJxio4nWE4xVfy3dvuLxspvOAzbqk2ScwGiHgHOJP+QTPiYjy0NzA0YqGWsFq5+QrLpvVibIcJy3fIYfsSZySOo=
X-Received: by 2002:a67:5f05:: with SMTP id t5mr7482385vsb.21.1605516328500;
 Mon, 16 Nov 2020 00:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20201116082537.3287009-1-tzungbi@google.com> <20201116082537.3287009-3-tzungbi@google.com>
In-Reply-To: <20201116082537.3287009-3-tzungbi@google.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 16 Nov 2020 16:45:17 +0800
Message-ID: <CANMq1KAuZ4gsTmYC_kQvhzpg-AEfXhBqypS0bdogv15THQCTiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc/mediatek: fix sparse errors on
 dma_alloc and dma_free
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Guenter Roeck <groeck@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 4:26 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Fixes the following sparse errors on dma_alloc_coherent() and
> dma_free_coherent().
>
> On drivers/remoteproc/mtk_scp.c:559:23:
> warning: incorrect type in assignment (different address spaces)
>    expected void [noderef] __iomem *cpu_addr
>    got void *
>
> On drivers/remoteproc/mtk_scp.c:572:56:
> warning: incorrect type in argument 3 (different address spaces)
>    expected void *cpu_addr
>    got void [noderef] __iomem *cpu_addr
>
> The cpu_addr is not a __iomem address.  Removes the marker.
>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 2 +-
>  drivers/remoteproc/mtk_scp.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 47b4561443a9..b3397d327786 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -99,7 +99,7 @@ struct mtk_scp {
>         bool ipi_id_ack[SCP_IPI_MAX];
>         wait_queue_head_t ack_wq;
>
> -       void __iomem *cpu_addr;
> +       void *cpu_addr;
>         dma_addr_t dma_addr;
>         size_t dram_size;
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8ed89ea1eb78..a1e23b5f19b9 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -413,7 +413,7 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>         } else if (scp->dram_size) {
>                 offset = da - scp->dma_addr;
>                 if (offset >= 0 && (offset + len) < scp->dram_size)
> -                       return (void __force *)scp->cpu_addr + offset;
> +                       return scp->cpu_addr + offset;
>         }
>
>         return NULL;
> --
> 2.29.2.299.gdc1121823c-goog
>
