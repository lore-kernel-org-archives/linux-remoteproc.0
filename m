Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CC3C4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Dec 2022 15:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiLOP5x (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Dec 2022 10:57:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiLOP5v (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Dec 2022 10:57:51 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E112DA93
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Dec 2022 07:57:50 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p8so16309779lfu.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Dec 2022 07:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7k/AHx9sIHaw32Pe0dA2eE03z43VrbqeQoa3ShJCk/k=;
        b=pLz0jTSycXFgOHwa8XCsuJC8wZc+R0cGlgWphKESpF4Gi75FxLs6MFYAthhzoF9ucL
         4ZY+nrPRbDbiWOFGKv15/QXvU0Tz13Jf1SYp+zyo1r/I9fNlEyILPg12I4QQGEKKZyUR
         ORv4Kl2Hjn/oV5WFudPN3Hl4BLOe2oRujyOTm3LizYoMJ5Ikyk32L1NVfmz0KfBtHzzS
         RecSKueHf8MfidzChdKoIZnqu7C5o5kKb4ddRHcky/xat8jMH0n4fnoP4EZstq+zFvnQ
         +TeI8+2MJKkT5gtKnN1K2MrqJRtmfX45QBA2UOc6lmYzifIMbPF3EKqeP/6xl3kI7HCj
         Tt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7k/AHx9sIHaw32Pe0dA2eE03z43VrbqeQoa3ShJCk/k=;
        b=dt1jUIrojakx1SfbEcdet2FEROwJlWuK5S35HMmzrY+IDU0+1yfX59XxbDFC+9Bv8C
         cTSDusmTa6v1vqkucCa2lP6u4y/iAHVw8+e/afpqjuhXS7UOz66QfKHPPXEqdPUNaB69
         k0xAUdA9iMWU5W+SogkIlVtXHKwvv/I7jRWFfQ92OXdJRjhwS9wE9mplyF/NZxElFouk
         qb3zOu4SlLlwd85T2EknnJbXXMZcVGDC7i35SOYL1GF/d0yQ3Q5yj2miNwTpWamVqzSa
         34DVvpoWQT8v6hXgFugJYHJJjshRs38R8M+0mhLZRwPBEAgLHxhrwyYr+UkjsqWnWLN8
         z8Zw==
X-Gm-Message-State: ANoB5plDynKDnBdtY1YYb6AMGM8dYtULP7nS7zDDzFnizVIXfzSOXMj8
        o72dut6DUxETg7sBfUzNP6a+Y7mvbekug3n/TgGJbQ==
X-Google-Smtp-Source: AA0mqf6DQQ9SfaJViAGGy3snbd9DuSVfN7MeD8Unnxs+XD3ETc6xAtXlqll2YOYrwIT+R+/pJtwz7jCCVod+oeRktF4=
X-Received: by 2002:a05:6512:104e:b0:4b5:604a:5b24 with SMTP id
 c14-20020a056512104e00b004b5604a5b24mr9608434lfb.550.1671119868440; Thu, 15
 Dec 2022 07:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20221214221643.1286585-1-mathieu.poirier@linaro.org>
In-Reply-To: <20221214221643.1286585-1-mathieu.poirier@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 15 Dec 2022 08:57:37 -0700
Message-ID: <CANLsYkwPvkr8bujPsRD+4g2Lrwiu5dB7-k-biXaQRMm70ANBVg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: Make rproc_get_by_phandle() work for clusters
To:     Suman Anna <s-anna@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, a-bhatia1@ti.com,
        j-luthra@ti.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ben.levinsky@xilinx.com, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

People at TI - please test this patch for AM3352.  Theoretically
things should be fine but I would certainly appreciate a T-B from
someone at TI.

Thanks,
Mathieu

On Wed, 14 Dec 2022 at 15:16, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Multi-cluster remoteproc designs typically have the following DT
> declaration:
>
>         remoteproc_cluster {
>                 compatible = "soc,remoteproc-cluster";
>
>                 core0: core0 {
>                         compatible = "soc,remoteproc-core"
>                         memory-region;
>                         sram;
>                 };
>
>                 core1: core1 {
>                         compatible = "soc,remoteproc-core"
>                         memory-region;
>                         sram;
>                 }
>         };
>
> A driver exists for the cluster rather than the individual cores
> themselves so that operation mode and HW specific configurations
> applicable to the cluster can be made.
>
> Because the driver exists at the cluster level and not the individual
> core level, function rproc_get_by_phandle() fails to return the
> remoteproc associated with the phandled it is called for.
>
> This patch enhances rproc_get_by_phandle() by looking for the cluster's
> driver when the driver for the immediate remoteproc's parent is not
> found.
>
> Reported-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1cd4815a6dd1..91f82886add9 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -33,6 +33,7 @@
>  #include <linux/idr.h>
>  #include <linux/elf.h>
>  #include <linux/crc32.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_ring.h>
> @@ -2110,7 +2111,9 @@ EXPORT_SYMBOL(rproc_detach);
>  #ifdef CONFIG_OF
>  struct rproc *rproc_get_by_phandle(phandle phandle)
>  {
> +       struct platform_device *cluster_pdev;
>         struct rproc *rproc = NULL, *r;
> +       struct device_driver *driver;
>         struct device_node *np;
>
>         np = of_find_node_by_phandle(phandle);
> @@ -2121,7 +2124,30 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>         list_for_each_entry_rcu(r, &rproc_list, node) {
>                 if (r->dev.parent && device_match_of_node(r->dev.parent, np)) {
>                         /* prevent underlying implementation from being removed */
> -                       if (!try_module_get(r->dev.parent->driver->owner)) {
> +
> +                       /*
> +                        * If the remoteproc's parent has a driver, the
> +                        * remoteproc is not part of a cluster and we can use
> +                        * that driver.
> +                        */
> +                       driver = r->dev.parent->driver;
> +
> +                       /*
> +                        * If the remoteproc's parent does not have a driver,
> +                        * look for the driver associated with the cluster.
> +                        */
> +                       if (!driver) {
> +                               cluster_pdev = of_find_device_by_node(np->parent);
> +                               if (!cluster_pdev) {
> +                                       dev_err(&r->dev, "can't get parent\n");
> +                                       break;
> +                               }
> +
> +                               driver = cluster_pdev->dev.driver;
> +                               put_device(&cluster_pdev->dev);
> +                       }
> +
> +                       if (!try_module_get(driver->owner)) {
>                                 dev_err(&r->dev, "can't get owner\n");
>                                 break;
>                         }
> --
> 2.25.1
>
