Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7D5ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Sun, 11 Sep 2022 23:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIKXBZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 11 Sep 2022 19:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiIKXBW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 11 Sep 2022 19:01:22 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6252422BDF
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 16:01:21 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1278a61bd57so19009315fac.7
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 16:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date;
        bh=6zz4KZBW7Xf3j2wSfJkLMRtj9pzF2Gk+JSNytD8QvQo=;
        b=KImd/fj3U/QgmbidNljOQB0iad08e+8tC7mEvjqEkvixNow+Z+wnVSTmbZV23CPKc0
         HVBqKaWCkJGIcrZIoRXaBlNToBktSydSGjlVRnEZNW0TQpsTqVtdIUtF/c4W/YXoR8L6
         uT5mXj7nfc2hX+QoF4xeHytsBybIIg2LF5SlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6zz4KZBW7Xf3j2wSfJkLMRtj9pzF2Gk+JSNytD8QvQo=;
        b=uoNRw8PE79DQyMl5mVhOEk7YpyBS4kTjqjOVgTs0QdGOTFwywxNf2VuYNyBO6BFkHC
         3AwlrsJKo+Y9+Fh3J6uR+sZujWrhla2PFuOxx/zbTIuE+zG5/URwbhxBG2ZsI0O8Oe3q
         ZBSe5aFjnFspvxbMsYlrMuLw1UIXKW6DrnCmFUe2zPsRbJY8SYx8Wp/Z0G8UHcUNJQHH
         JTa9PmGJfWcXi+jLx0WwclYJDg7DtdZkNGtZq1WaiUFgP39of4BKINbZTHwWsJ/ds0Oo
         uYGf0cltcD5b5nZ5tiCWuIaqgzs2U2R65bucLCWLERLkRSbG8vURiGs5iwNNP/wgxDso
         6qDA==
X-Gm-Message-State: ACgBeo00idp1S+LFfER2/3ki0DysmCf9Io2IhqgB3y2Mc1clT0pcpUHZ
        ktv/9XEbqhzrRFYs7bVni1iooIcbc6/GyLkTokkjnQ==
X-Google-Smtp-Source: AA6agR4/09plFX0OTLhhwmmwNv2ATAUGQVcnLBvFUcpfLX90f+vdiRH8e94cVQoAUJ+DNnBqf83WSMN07J4bpj24cxM=
X-Received: by 2002:a05:6808:1142:b0:343:86a0:dedc with SMTP id
 u2-20020a056808114200b0034386a0dedcmr8186288oiu.44.1662937280713; Sun, 11 Sep
 2022 16:01:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Sep 2022 18:01:20 -0500
MIME-Version: 1.0
In-Reply-To: <1662643422-14909-8-git-send-email-quic_srivasam@quicinc.com>
References: <1662643422-14909-1-git-send-email-quic_srivasam@quicinc.com> <1662643422-14909-8-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sun, 11 Sep 2022 18:01:20 -0500
Message-ID: <CAE-0n53CUPAW2P5uC-4fN+qPw0PLCaz4Dfom7htYOTT9-o+A9Q@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] remoteproc: qcom: Add support for memory sandbox
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

Quoting Srinivasa Rao Mandadapu (2022-09-08 06:23:41)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index ccb5592..e55d593 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -9,6 +9,7 @@
>  #include <linux/firmware.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iommu.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
> @@ -48,6 +49,8 @@
>  #define LPASS_PWR_ON_REG               0x10
>  #define LPASS_HALTREQ_REG              0x0
>
> +#define SID_MASK_DEFAULT        0xF
> +
>  #define QDSP6SS_XO_CBCR                0x38
>  #define QDSP6SS_CORE_CBCR      0x20
>  #define QDSP6SS_SLEEP_CBCR     0x3c
> @@ -333,6 +336,42 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>         return 0;
>  }
>
> +static void adsp_unmap_smmu(struct rproc *rproc)
> +{
> +       struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;

Drop the cast, it's unnecessary.

> +
> +       iommu_unmap(rproc->domain, adsp->mem_phys, adsp->mem_size);
> +}
> +
[..]
> @@ -343,9 +382,17 @@ static int adsp_start(struct rproc *rproc)
>         if (ret)
>                 return ret;
>
> +       if (adsp->has_iommu) {
> +               ret = adsp_map_smmu(adsp, rproc);
> +               if (ret) {
> +                       dev_err(adsp->dev, "ADSP smmu mapping failed\n");
> +                       goto disable_irqs;
> +               }
> +       }
> +
>         ret = clk_prepare_enable(adsp->xo);
>         if (ret)
> -               goto disable_irqs;
> +               goto adsp_smmu_unmap;
>
>         ret = qcom_rproc_pds_enable(adsp, adsp->proxy_pds,
>                                     adsp->proxy_pd_count);
> @@ -401,6 +448,9 @@ static int adsp_start(struct rproc *rproc)
>         qcom_rproc_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>  disable_xo_clk:
>         clk_disable_unprepare(adsp->xo);
> +adsp_smmu_unmap:
> +       if (adsp->has_iommu)
> +               adsp_unmap_smmu(rproc);

Why not pass adsp directly to adsp_unmap_smmu()? And even better would
be to make it a no-op when adsp->has_iommu is false, so that the code
reads straight-line otherwise.

>  disable_irqs:
>         qcom_q6v5_unprepare(&adsp->q6v5);
>
> @@ -429,6 +479,9 @@ static int adsp_stop(struct rproc *rproc)
>         if (ret)
>                 dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
>
> +       if (adsp->has_iommu)
> +               adsp_unmap_smmu(rproc);
> +
>         handover = qcom_q6v5_unprepare(&adsp->q6v5);
>         if (handover)
>                 qcom_adsp_pil_handover(&adsp->q6v5);
> --
> 2.7.4
>
