Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81067C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 18:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 631D861158
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 18:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241291AbhHESek (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 14:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241267AbhHESej (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 14:34:39 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D741C061798
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Aug 2021 11:34:24 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 21so8594690oin.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Aug 2021 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TZQqBrv6qFFrmIcwMHn6Tt1aOzqmQe5CcX5H31Yc2D8=;
        b=jM+qFVtxfPIwShdjDlkwiDnBtOTl3GBLcUMQkzrNJs5RMZD08KMiUYSXA6DwKlngcV
         FJdoM4rjwEct36UODwq4Z0sqEBOhjWI4w5GZWCqCzdl//cLAReV5sS8sKwe18gDlt37P
         exqVNaZ3KID+niE8g3gCNu20AhSeKoh22h7Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TZQqBrv6qFFrmIcwMHn6Tt1aOzqmQe5CcX5H31Yc2D8=;
        b=q6dXYcQwy5VYd40zOkoGZ7vkUIfHPPghaasfj4ys8sXMXHdgx+1Ku7lmOhE5wBYm9Q
         OIZ++Wx+ntQy4Tk9YADVubzAh5d59Ytx5eTFqwB2eBu9AREa3X3qd9kfUz3zVi99egxx
         90ZgYve4GDpM5rEe/TwGRKcQiaXfmb2KudC4C3ao9Y0ucrtAM7ZbLQG1glC9I81yFH0U
         HmilDNZv/347hBr6mXAZuwQeeXRKxXOJMhI2GUM9v2OPVEjUe1cDEFfB/x1bOCniCEZ2
         TFsWmNQpAY09N1HxzKeOFbwsWRbICv6l7qul6OzYwSaS/LNek33UB8FSH2qoYcKb+zPT
         b2YA==
X-Gm-Message-State: AOAM531lKO7Mth5irSsXkGLjJ8ViPIlmW8816ODd5eGDf6oMTR9bwlSe
        0lLAQ+q+xebuxYUj+oRxKoRgGZWcIhWf5ibGOEl3ZQ==
X-Google-Smtp-Source: ABdhPJwJ+Ulv2NUu9Hno8DPMoDQScz1PjXLsrEKbBtSi8KYZ7i0sxRfVg4lVYFImIcK8gjsNOxr3Pa8zmqL7w9Eizls=
X-Received: by 2002:a05:6808:619:: with SMTP id y25mr8128779oih.166.1628188464390;
 Thu, 05 Aug 2021 11:34:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Aug 2021 11:34:23 -0700
MIME-Version: 1.0
In-Reply-To: <1628161974-7182-2-git-send-email-deesin@codeaurora.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org> <1628161974-7182-2-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 5 Aug 2021 11:34:23 -0700
Message-ID: <CAE-0n50fN42fhAcoCJBz-PEW5sEdqSKT5YuaxWE_29J=P1=vQw@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-05 04:12:53)
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 934fcc4..b84cb31 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -515,6 +521,43 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
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
> +void qmp_put(struct qmp *qmp)
> +{
> +       if (!IS_ERR_OR_NULL(qmp))
> +               put_device(qmp->dev);

Where is the corresponding get_device() call?

> +}
> +EXPORT_SYMBOL(qmp_put);
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>         struct resource *res;
