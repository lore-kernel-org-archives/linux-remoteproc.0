Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2A2C4338F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 Aug 2021 18:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 412D86113B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 Aug 2021 18:34:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhHXSfc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 24 Aug 2021 14:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbhHXSfa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Aug 2021 14:35:30 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515C4C061757
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Aug 2021 11:34:46 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id x9-20020a056830278900b0051b8be1192fso27912203otu.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Aug 2021 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=MpSjVxSMjJK4OJw4oTKLD3JL0PWvQPTVS0fPqXZYl3g=;
        b=n/JcnajTDuWMOgB1dqCLhqVz/SK9+IAgpIc6Z5Dlx0X3Bz7NVcegvqK2cpm3DNJbPQ
         10DZqlRko41kmEobXSLmA4zrYTieEAA4vI1y7bwkO66KsdU7sMqstshTU6BpT0hdAZfy
         i6kXOJtX6evRy9U7I6Sp6+LA4yS0fHqGvNoOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=MpSjVxSMjJK4OJw4oTKLD3JL0PWvQPTVS0fPqXZYl3g=;
        b=EhFQhu90LzRkTuq1mjkkCyRjuGYTpmSzjvIiDyEImHuMihYIEJipORWdr4o5aIoQIk
         Y7DTTN5jLD8SQytSF2j+oot2v2WMkKgwYUv4Pe204ueu2yHPoJ3h1MOqsoyvYirUexUG
         Zre/21NxEg3bZsGMtGDNnNu7TcGba2RHbUYlcdMwqBlTfxSCjSfzK56VLbPzlAEjoPts
         MXm1N6Cx54S0bni+oYdpiHNPR5t6kYeCi/vQV+v5nhZbRjlES7Byp9jY0depntXvkLz9
         y0cbvTDLRWW+9Ifth0dZ2IK4kNLK9HX8Fn8NHYlwVdvSk1L8YakPBDGHHoqVHGeaVqNp
         DP8g==
X-Gm-Message-State: AOAM530HMxFqWS5r7QY+U3mwtLfyRH09OXTIttl5Qn2JaDvE7TtsSpHx
        ZjAUJPUQQ7SFnx4O3WP1RlFBDzP71W/lGcFbc88Dfw==
X-Google-Smtp-Source: ABdhPJzRH/Uc7RJJIpCbxFsIdbJBiPfb7rT9/hLjX1Vp9cEqoF/t87EH1mDk73cPqGvQmJ4MtwBCUJQX8YPNs8ZHDkQ=
X-Received: by 2002:a05:6808:180e:: with SMTP id bh14mr3854642oib.19.1629830085691;
 Tue, 24 Aug 2021 11:34:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Aug 2021 11:34:45 -0700
MIME-Version: 1.0
In-Reply-To: <1629113954-14084-2-git-send-email-deesin@codeaurora.org>
References: <1629113954-14084-1-git-send-email-deesin@codeaurora.org> <1629113954-14084-2-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 24 Aug 2021 11:34:45 -0700
Message-ID: <CAE-0n50G_OYqR6R8+K5RkrCBvdQW-E-zDoMZ-yyAoEJW2WyxcA@mail.gmail.com>
Subject: Re: [PATCH V6 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-16 04:39:13)
> Not all upcoming usecases will have an interface to allow the aoss
> driver to hook onto. Expose the send api and create a get function to
> enable drivers to send their own messages to aoss.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---

With one nit below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 934fcc4..a43c22c 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -515,6 +521,48 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
>                 thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>  }
>
> +/**
> + * qmp_get() - get a qmp handle from a device
> + * @dev: client device pointer
> + *
> + * Return: handle to qmp device on success, ERR_PTR() on failure
> + */
> +struct qmp *qmp_get(struct device *dev)
> +{
> +       struct platform_device *pdev;
> +       struct device_node *np;
> +       struct qmp *qmp;
> +
> +       if (!dev || !dev->of_node)
> +               return ERR_PTR(-EINVAL);
> +
> +       np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
> +       if (!np)
> +               return ERR_PTR(-ENODEV);
> +
> +       pdev = of_find_device_by_node(np);
> +       of_node_put(np);
> +       if (!pdev)
> +               return ERR_PTR(-EINVAL);
> +
> +       qmp = platform_get_drvdata(pdev);
> +
> +       return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL(qmp_get);
> +
> +/**
> + * qmp_put() - Match get_device() inside of_find_device_by_node()
> + *            in qmp_get()

I meant to put this comment next to the put_device() call. This should
say something like "release a qmp handle" and then the existing comment
moved down to the if below.

> + * @qmp: qmp handle obtained from qmp_get()
> + */
> +void qmp_put(struct qmp *qmp)
> +{
> +       if (!IS_ERR_OR_NULL(qmp))
> +               put_device(qmp->dev);
> +}
> +EXPORT_SYMBOL(qmp_put);
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>         struct resource *res;
