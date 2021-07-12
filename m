Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1F7C07E99
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 06:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72FCD6101D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 06:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbhGLGJC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 02:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhGLGJC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 02:09:02 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4180C0613DD
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Jul 2021 23:06:13 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id l18so16201613iow.4
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Jul 2021 23:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QQbTdwpHiSKGRKYlqDaIH++wFzRy31sqh5rrqS0iJ60=;
        b=t0Y/ybxJlERi6+gcvIqxVoSHTxGvCReSlnUccJ0b1pilessjk+biRgnQ360cyUs5gF
         DVmXtwAxqwsWyEfnN/s9dN/8smb09/5fMY5dXaJYUSvYX0q8kAZtiSD2XXmy5PC8BXIG
         L+f1CAFBBKhgbXBIJhWwGV4rK9oIRHCprc+giXaWBITPhymUkEPPaTtjW9m4ICbDXRcT
         5cZ6hOz0l3DqGbNT0Om0M9SQVz+hAaMDp9lzyXaN19+Fy8sTIHN3klJ8Urf+Ss35Q+Um
         hI1P+L5PNxTSCzSIatiGeR8jrcg7SLbNGsdVkp3Z6vN89yM9w60EI7VCKhqwk7D9520R
         WVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQbTdwpHiSKGRKYlqDaIH++wFzRy31sqh5rrqS0iJ60=;
        b=nOQotq+wVRbNoZMhox1Ooq0iVkkMWWpH0kOjpVaYvI6S7/3kkZWe1CJ7OthFUkMq1z
         jwgYE2ERTXCmuUmNYV+vAPqZa8KsemhuQKMsjmFq5KoFjd0AsTPupicUNJLOwDUMK53n
         DbJR/ryFDWAFlD1F5GaOwpkfWucKrqlEWOcOpu269xJ3KSZFx27ALKovxt0v/4felL4H
         nQjaET9FgcfOw9xsW3EWmRNJwxQQlmmslisEev0E32kguz9HLKLacAeQcKbdX4QjBBra
         sl31KALD6HCbOEd5EmH63c7Z+Z89BE+UHIwRblSipKrYZoVRFXNRVbJmuTpCtovlCY0W
         MkxA==
X-Gm-Message-State: AOAM530B12Rejabrfyy6AAY1c99zf3+PmPM1JbBNmELbOGYniB+fkEqZ
        u18nfqwiYfPFe20fvWdKCUL3sJifBZHUTyZPa9y7oQ==
X-Google-Smtp-Source: ABdhPJy7eNcQX+XxQ8vkxSM7FMxxg2yrDt9MGG1GMQdcRqA3qp7XJidTxHybq7Q7j5orvAzZQJxZZLV5b5QuCu0V/M4=
X-Received: by 2002:a5d:87d0:: with SMTP id q16mr38727515ios.109.1626069973247;
 Sun, 11 Jul 2021 23:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210710122446.5439-1-tinghan.shen@mediatek.com> <20210710122446.5439-2-tinghan.shen@mediatek.com>
In-Reply-To: <20210710122446.5439-2-tinghan.shen@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 12 Jul 2021 14:06:02 +0800
Message-ID: <CA+Px+wXJo1R5WU-Acn==DEqubzzZDfxnJpCeFvKoYzzrzr-H1A@mail.gmail.com>
Subject: Re: [v2 2/2] remoteproc: mediatek: Support mt8195 scp
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Jul 10, 2021 at 8:25 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> @@ -785,11 +785,13 @@ static int scp_probe(struct platform_device *pdev)
>         if (ret)
>                 goto destroy_mutex;
>
> -       scp->clk = devm_clk_get(dev, "main");
> -       if (IS_ERR(scp->clk)) {
> -               dev_err(dev, "Failed to get clock\n");
> -               ret = PTR_ERR(scp->clk);
> -               goto release_dev_mem;
> +       if (of_get_property(np, "clocks", NULL)) {
> +               scp->clk = devm_clk_get(dev, "main");
> +               if (IS_ERR(scp->clk)) {
> +                       dev_err(dev, "Failed to get clock\n");
> +                       ret = PTR_ERR(scp->clk);
> +                       goto release_dev_mem;
> +               }
Use devm_clk_get_optional().
