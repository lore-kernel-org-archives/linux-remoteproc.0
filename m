Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F77CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Apr 2022 17:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbiDRRP7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Apr 2022 13:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239486AbiDRRP4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Apr 2022 13:15:56 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592ED2B18E
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Apr 2022 10:13:13 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 203so938419pgb.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Apr 2022 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BvtRLSGlIqgoZJw83CHbKmm9w5RaBORQkePsPwp3Jcs=;
        b=X4HUkGNZmS19IamCaufLPwvkr3VU3muJTy0uqV5g7ZncQwXZXwPRIPzafxazChGNEO
         ybOPX5th1MG/Yh4Yz1AYYEXYUO1Km9yplsj4dJUgklqGMwCcUAJo+voR9rMmHwE28Lm/
         TIHSSMmO6CjeQWVmvdyA9zhyPjvF5wnXzN01hFDq8nqhN4iJW+KLB58OFFV91GkgEig8
         38brj/8xk4X5b7UkhN2nVvDuccfkk7KvvWk+JROL/vggq0uL2noWR2Zxih8fX6AdYzxh
         Iq4Ye/qp4Z4iCOcRuFSskjr57JNOXttTftidMDZGNvCaK3+CvUxVdqWpFHuQadh2LhUI
         GWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BvtRLSGlIqgoZJw83CHbKmm9w5RaBORQkePsPwp3Jcs=;
        b=QofYfHH/srh+6uqMQq3nfeQo0VTvSb9M9luQ3fcdXc5UNoE43FHcTtLpuAiKazC7gD
         uWyHIU2WjqGYvpNXLN5wA2VGAmtZlUhieJzaOBcjS7Qhg2RKUNsb8CVFrpsx52l5Y+K/
         jIxPHZ1ca+3DWvMmP9sZxdJIkv11joGC/h9yqKpVcEJXMN7B97R8rPXmFHmrtovrzhr1
         9QE7DzrMczAWbnBXNJJv49dV/nWy4MggPbjMdgog6uz38t+q0grPQLI1Giv3X87YNamX
         2F3YC4FFsiNRXIAog2Q+bgbrJJqTmmIZcQOD86OoY8uwgaEcb2jsd5F/LUjTCm/UIfc+
         nWDQ==
X-Gm-Message-State: AOAM531vgUWpfjPhZq/ekjr1uDUpg7Uy+B2/ysSvO7lgCshDKSQyYx3X
        Wc5tb8k+m+t1gSnkNCcUSGY65g==
X-Google-Smtp-Source: ABdhPJx+xxEgbzOInBcT6iUBxz+NtIWz/XvFoiE0lFt8D8qcoTK1TxWsyQtJDP8JzSBdLixiTYwdjw==
X-Received: by 2002:a62:1c8d:0:b0:4fa:8dcb:6da2 with SMTP id c135-20020a621c8d000000b004fa8dcb6da2mr13217641pfc.19.1650301992571;
        Mon, 18 Apr 2022 10:13:12 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id u26-20020a63471a000000b003aa1ad643bdsm1809062pga.47.2022.04.18.10.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 10:13:10 -0700 (PDT)
Date:   Mon, 18 Apr 2022 11:13:08 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4] remoteproc: imx_rproc: Ignore create mem entry for
 resource table
Message-ID: <20220418171308.GA952787@p14s>
References: <20220415025737.1561976-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415025737.1561976-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Apr 15, 2022 at 10:57:37AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Resource table is used by Linux to get information published by
> remote processor. It should be not be used for memory allocation, so
> not create rproc mem entry.
> 
> Fixes: b29b4249f8f0 ("remoteproc: imx_rproc: add i.MX specific parse fw hook")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V4:
>  Typo fix
>  use strcmp, not strncmp
> 
> V3:
>  Update commit log
>  Update Fixes tag
> 
> V2:
>  Add Fixes tag
>  Separate the patch from https://patchwork.kernel.org/project/linux-remoteproc/patch/20220111033333.403448-7-peng.fan@oss.nxp.com/
>  Address typo
> 
> 
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7a096f1891e6..91eb037089ef 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -423,6 +423,9 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		if (!strcmp(it.node->name, "vdev0buffer"))
>  			continue;
>  
> +		if (!strcmp(it.node->name, "rsc-table"))
> +			continue;
> +

Applied.

Thanks,
Mathieu

>  		rmem = of_reserved_mem_lookup(it.node);
>  		if (!rmem) {
>  			dev_err(priv->dev, "unable to acquire memory-region\n");
> -- 
> 2.25.1
> 
