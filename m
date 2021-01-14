Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CC7C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 20:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 379F923A34
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 20:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbhANUzS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jan 2021 15:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbhANUzS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jan 2021 15:55:18 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5729FC061757
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jan 2021 12:54:38 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id x18so3539863pln.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jan 2021 12:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jD7vbDbD0h84CsDujjRSLvXMFR2wSvaymJTCUCRVyTg=;
        b=i4ANxg8Q3GY1CKfPo+klvkSjAhcsfVbNRqK+K/aQ/iToZldEMxU8NHBcNKw6UiXjq0
         JOaf8WHB+ZRym59WBEzqIO8fSNdU5TfCYCLb7V+NuC833UbYh+Qe4jnSCo5qbzILKgOe
         ZCtM7mU+AKviHFbajnRGNd9uuqwb5C2h5qCDtW8MiFGKZclK1cVhdY18laToooYZVFNe
         5gTSksJXBxPeXBQHIrvw8OvxYowfx5fNvMqwFL/B+6Xli9GAXFZNvxWFEVbJfqXw3Id+
         5rKeRDeu0YnRxzQ0ei0wp8zeAofbx/+H5ZTcajDcb6MvU6sbkRDUBWcGV2yCe5kwnyx4
         ShVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jD7vbDbD0h84CsDujjRSLvXMFR2wSvaymJTCUCRVyTg=;
        b=hdkpEHp/KdEaDmDOZAl++2+j5gduNF7DR+ZlyJ3OPRQhhquYPuTXyQmvQyGk9xfOeW
         Qaybh4+BL3VeLRTraRrZCbxayy2hEZyYocZxZGA3zBfg5Ckz4RJsMnUgolujjye8ugnP
         OS180cD6qLVmAB0ZZyOiP79KJg8gfVnUEAKFYxMfUTSN+wjl4FZ5Bt9cRC1PII7MTb4K
         JdBvoF8RgCztXmqomdcZeuOAmgaRH7Q/hfvEMXPXBY2LHAUR8HF+XS4mJGhaFfR79yKZ
         cbnLquztQb8KoZcupGFlVjzRcTdKjlVy4bEy9otqGY++oVPUhR/xgQC1timMq50TFQUe
         THiA==
X-Gm-Message-State: AOAM533fklYVUoseZfgrpsggAc+0D61fowQTk8GpB1j4rBhGHOudp0D7
        3SsB3rsbh/mHNR4SpILY8F1tsA==
X-Google-Smtp-Source: ABdhPJwHSp4h2t6bqX0badjP/w9fNcURWQGRTeksXWdcWRqrH8U8NT/f7kVg2Tt51R5DDZxijhwg+Q==
X-Received: by 2002:a17:90a:bf05:: with SMTP id c5mr6907923pjs.90.1610657677823;
        Thu, 14 Jan 2021 12:54:37 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id fv22sm6486172pjb.14.2021.01.14.12.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 12:54:37 -0800 (PST)
Date:   Thu, 14 Jan 2021 13:54:35 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com
Subject: Re: [PATCH V6 09/10] remoteproc: imx_rproc: ignore mapping vdev
 regions
Message-ID: <20210114205435.GC255481@xps15>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
 <1610444359-1857-10-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610444359-1857-10-git-send-email-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jan 12, 2021 at 05:39:18PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
> They are handled by remoteproc common code, no need to map in imx
> rproc driver.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f80428afb8a7..e62a53ee128e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		struct resource res;
>  
>  		node = of_parse_phandle(np, "memory-region", a);
> +		/* Not map vdev region */
> +		if (!strcmp(node->name, "vdev"))
> +			continue;

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  		err = of_address_to_resource(node, 0, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
> -- 
> 2.28.0
> 
