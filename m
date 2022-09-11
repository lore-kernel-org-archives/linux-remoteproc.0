Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E3AC6FA86
	for <linux-remoteproc@archiver.kernel.org>; Sun, 11 Sep 2022 22:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiIKWzn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 11 Sep 2022 18:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiIKWzl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 11 Sep 2022 18:55:41 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5824921E16
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 15:55:40 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-127dca21a7dso18966419fac.12
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 15:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date;
        bh=nlcIQGarpQZF1b3fqIIEqAzgfa9Oo0Ubme7PE3yoogc=;
        b=eaaBTIwttt2CjIs/FXfOF4vlIZCdC9jW55CaoI+H1a2K1pq3RM0VFGrIiSlYIPOiPW
         Qlrn8bN0Ra+7DncrXuIYcOYujD/gqXLxB7pGV++pzW64HuK1pefvkJ1jUH+cgehbvP3N
         5HQdmB14xiAq7k1qiVq/13s8VkQ9imB2EJ9UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nlcIQGarpQZF1b3fqIIEqAzgfa9Oo0Ubme7PE3yoogc=;
        b=OkYgTFlbvsCGoEUspNGA5u++GAz7iEPkhjku7iINhesCkAknQJ/ZzR8dg/waI39TfF
         Aj3Cd19e6fd7kNS3et6qNYr7aVCToTwwmuKWQshYq/HzwCDoxFexhhgjucSvasy1vvI3
         s6k1oKn6gXNDd61+RcgwLhuaw8UmMjiFgN+/a6RNXkDLVvT8cxMYKo5/XD0jA+TnBkI1
         xAzE6bVx0cec9iwXrOBSNaM/fkPKdh0bRhbEZLUQroCw7vHWKwL/RxeLUQRAySdy3oLl
         nFVB4QicqQIp21I/VEmOyUU+oM2dXQRX3ZJw8E0xFeagOzgIjDliahmIYr/aWD5Hb+iK
         AJkg==
X-Gm-Message-State: ACgBeo2VOh/SovHJjDtENBVGLVG8q1ujBKA1q97S4y5MDXtSawAuJq3c
        LvCs3ZPGg9r74n0IxwOsRRJlIkXPTM4Zzwgh+45Q5g==
X-Google-Smtp-Source: AA6agR7OYBLg+WdC6y3UCRy2aVOaumf8UJxXjuDOYFe8okh2tGp8wIsyxmb63X1InGt+PoQArJn6b6NMdTC54iHquW4=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr7698554oik.0.1662936939654; Sun, 11 Sep
 2022 15:55:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Sep 2022 17:55:39 -0500
MIME-Version: 1.0
In-Reply-To: <1662643422-14909-5-git-send-email-quic_srivasam@quicinc.com>
References: <1662643422-14909-1-git-send-email-quic_srivasam@quicinc.com> <1662643422-14909-5-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sun, 11 Sep 2022 17:55:39 -0500
Message-ID: <CAE-0n50i7jqoA8rYhkvMEd_i13apA1ZWhHsXBj99Sn_8Hkywag@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] remoteproc: qcom: Update rproc parse firmware callback
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-09-08 06:23:38)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 02d17b4..207270d4 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -447,7 +447,7 @@ static unsigned long adsp_panic(struct rproc *rproc)
>         return qcom_q6v5_panic(&adsp->q6v5);
>  }
>
> -static const struct rproc_ops adsp_ops = {
> +static struct rproc_ops adsp_ops = {

This is sad.

>         .start = adsp_start,
>         .stop = adsp_stop,
>         .da_to_va = adsp_da_to_va,
> @@ -590,6 +590,9 @@ static int adsp_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       if (desc->has_iommu)
> +               adsp_ops.parse_fw = rproc_elf_load_rsc_table;
> +

Why not have two different set of ops so that the function pointer table
can't be hijacked? One for the parse_fw callback? Or simply return from
rproc_elf_load_rsc_table() when has_iommu is false?

>         rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
