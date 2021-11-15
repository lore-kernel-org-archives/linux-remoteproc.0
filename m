Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192C3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 03:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E870661ABD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 03:11:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245083AbhKPDOJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Nov 2021 22:14:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344198AbhKPDNm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Nov 2021 22:13:42 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3474BC0432F7
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Nov 2021 15:43:28 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id bk14so38306314oib.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Nov 2021 15:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hq1niQBK9hXN5OqRcd+jKLXnbjQsPYHmfo6HktmOyYQ=;
        b=ElGa7e81Ufm21BU1nQUf2FwyYoKWv3jgjbJ7AnPUx1UdlSkE+1CTGVHKQ+N+OHHKKo
         CY/9GY1bR7nYn7plBARAtBMZ8NqZ855XFALA6bz68eREZBxN4F6Gm6a6bEb/5bniGgv2
         vnPsPOYZ/4EiS5qTqAiVpMj8er/rWI6BP9EzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hq1niQBK9hXN5OqRcd+jKLXnbjQsPYHmfo6HktmOyYQ=;
        b=1KXpf2ME9Q9LDQl6021AeI+VkV7E+2ka1tdGSzKygrfePAS1IHQDm6XbshNJlMSdWO
         bGa7KpFJ7vC4HLDJLsNRLdGOd/GISDSPgs6mmwy5LifBlaIVtbO1iko7fm/vEjyroKNT
         Tq6mXBnYVBBX4AbE/Qkm18l3o+0dyfu645r5RfdJrGlsQ+myw8fX0oRdL3Igv66EO0mS
         HqPomc01INT7iGowQVwRgD4nL1/u9hcDRC+HqoHnxue+NBTn9kT0sYcNPnbbPwwvnb4M
         VFA1LIbAb5P3TSQWKaxucG6JKWZVl3FR7Gkot+BMPRm/6XfF7jSv/uUPwU2BpFX6IB0G
         qJ5Q==
X-Gm-Message-State: AOAM531XaWZ6QKDfUI+nvQKAmEfjUGezyXcjFWWkYcjKJKXiJlaqHbl2
        P6yz2mVB45LjLALO42nhsLRpMwAo3sZPMd61RPgR3C59Kmo=
X-Google-Smtp-Source: ABdhPJzmvae9UwbAAuS+UNXKAvsH2tyT8qBtsPQNp7h9OAVLMQQAv3q1gNTR8r7cZyYIpGgIVDz4OHQi2AlJxPVBsmo=
X-Received: by 2002:aca:2319:: with SMTP id e25mr48854187oie.164.1637019807605;
 Mon, 15 Nov 2021 15:43:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 15:43:27 -0800
MIME-Version: 1.0
In-Reply-To: <1635860673-12146-4-git-send-email-pillair@codeaurora.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org> <1635860673-12146-4-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 15 Nov 2021 15:43:27 -0800
Message-ID: <CAE-0n52effcajLwjOY_v-pjp68ytkb-zo4R9EHp3CQi=yB8nPQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] remoteproc: qcom: q6v5_wpss: Add support for
 sc7280 WPSS
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Rakesh Pillai (2021-11-02 06:44:33)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 098362e6..e2e8d33 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -435,12 +571,22 @@ static int adsp_probe(struct platform_device *pdev)
>         if (!desc)
>                 return -EINVAL;
>
> +       firmware_name = desc->firmware_name;
> +       ret = of_property_read_string(pdev->dev.of_node, "firmware-name",

Is this documented in the binding? If not, please add it.

> +                                     &firmware_name);
> +       if (ret < 0 && ret != -EINVAL) {
> +               dev_err(&pdev->dev, "unable to read firmware-name\n");
> +               return ret;
> +       }
> +
>         rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
> -                           desc->firmware_name, sizeof(*adsp));
> +                           firmware_name, sizeof(*adsp));
>         if (!rproc) {
