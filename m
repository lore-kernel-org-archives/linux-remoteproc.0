Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE188C64EC4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Mar 2023 18:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjCCSUa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Mar 2023 13:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbjCCSU3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Mar 2023 13:20:29 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E692688
        for <linux-remoteproc@vger.kernel.org>; Fri,  3 Mar 2023 10:20:28 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id v16so3212879wrn.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Mar 2023 10:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677867626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8M4JJhK7OCXpM9WO1V+URKM7Lv3jQVkaIfYcDZqUPng=;
        b=IvX4709SpETHwKZnaZ/VUBhGBnb3edIHYGjmnRTo1BR7Tt1xe823j2DQZTJ2WkNzK/
         R5cpZFgbjIPciEMfKgv3NrYpZemZHbPp9Icf90pImph3WUIV+WDqmvGjINefz1TBaRa6
         k/KQ2xsxWpgC9qzNcLTZlg/ZelSOQaxs+k6RYznEhGkEpU3bEguAOIWlzQdlyb5H1xtE
         VhM3dxPKFeXIwpkmDHby9jXRGvqEma7hrM/d1JolXyCnXd0dnBQPWdb7RrSxvJV3t/CI
         9pQTFRbY/5f5mK4RpUa+g9wxO53l8IjMJHYNBgiJUFgre7filrwaTOQ3mkJgtG3+sjO2
         kQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677867626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8M4JJhK7OCXpM9WO1V+URKM7Lv3jQVkaIfYcDZqUPng=;
        b=Vrb3kruFDaYi1VUTDpuhMXHwe8ITouj2r4bzsTnxlSfylYctaA+xVGH3N0l9NO1qY1
         0ENvfdiikApRnqEjn++d17DOo2uvl56dZQbnOBXKxI1ivkmfPnq2dMq3OUJdInjqC0Cj
         qf5SIyqdb7Vl9AxVDusM3CHImf9Fvm+m7SamNY1ANrs9jV62bl33hX/nRXZ4iOu9I88G
         MNE4Z7g+tvSyd1OvXXZcvim2u1ZTDGY5vuO1BCeW8wyvfRdtmC/JTItJfkNrhYz2WP7c
         d96Nd/CCmtHR9bc17scf4IGMlbzFXDWuevue8Vte3izJ1XzJD3PsGIvXRXRuoY9vfmdo
         WRig==
X-Gm-Message-State: AO0yUKU3CUevzg7EajTaGotL84OEj9OwUrpC6IB5kyBNyEdy4omnylzW
        QYT+j0WMM2gg1aiHzpyDfFzSeJsvdnEsYnvBJfDayw==
X-Google-Smtp-Source: AK7set8oEHzqOqPD7jWE2EaUZk7vGnHcVw/OgqgaNvamVgg81oFWY/hFsoF4Gpyn8OzLm2vrZQT2ciIRG5AFFD0W2TQ=
X-Received: by 2002:a5d:4347:0:b0:2c7:1320:7781 with SMTP id
 u7-20020a5d4347000000b002c713207781mr635648wrr.13.1677867626499; Fri, 03 Mar
 2023 10:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20230303102751.9374-1-jason-ch.chen@mediatek.com>
In-Reply-To: <20230303102751.9374-1-jason-ch.chen@mediatek.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 3 Mar 2023 11:20:15 -0700
Message-ID: <CANLsYky0pbqiEfq7E6DZM=J+sm2JJ8gYST2atUyP8X7y9zdHWA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mediatek: Dereferencing a pointer that might
 be NULL
To:     Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 3 Mar 2023 at 03:28, Jason-ch Chen <jason-ch.chen@mediatek.com> wrote:
>
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
>
> The res might be NULL when calling resource_size.
>

"resource_size" ?  What is that?

> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index eacdf241f4ef..863d18f63f58 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -829,6 +829,9 @@ static int scp_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, scp);
>
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> +       if (!res)
> +               return -ENODEV;
> +

Please have a look at the implementation of devm_ioremap_resource()
along with the function it calls and let me know if your patch is
needed.

>         scp->sram_base = devm_ioremap_resource(dev, res);
>         if (IS_ERR((__force void *)scp->sram_base)) {
>                 dev_err(dev, "Failed to parse and map sram memory\n");
> --
> 2.37.3
>
