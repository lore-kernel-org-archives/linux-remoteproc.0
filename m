Return-Path: <SRS0=6FrS=AY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B1EC433E4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Jul 2020 19:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D415220758
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Jul 2020 19:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T/tDzBSf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGMTDQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgGMTDP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Jul 2020 15:03:15 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821CDC061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2020 12:03:15 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t6so2752049plo.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2020 12:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/OwblBkyUz9U0R8zbXyE33PVpwL2KrxM/SNh//IN4cg=;
        b=T/tDzBSf1dlGGChdUJkNUHI8vqRPvUL5q6Gsr04CuMxTatssWeCfyiVk9U5RecA/qy
         FWg9w814lsFZXlVZIuLenpZK/xioGTsnrBY/Vfi3oJbcnJRhLvdxbze/cRoaWaPS5Up9
         OdyRIhkj7eQ6fsmn7Q8CBKB1yz1FpvKH3iBKSHgtMOdd5E3e2Vv+Zoi/MY8vnJ9+QVW7
         jh904BgGE+HcgaIGVgTztKqaVdK9GQ+mbbtarb7xkMENf2bttvBfEL43YOd/r0f6ArxW
         Ff6OT9fTmnP8rugEf9/5OZg0/oLF3paxKJkMqS3bN2WhcdNP6PrJ6bCcnJ3TOvpOb5M9
         8b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/OwblBkyUz9U0R8zbXyE33PVpwL2KrxM/SNh//IN4cg=;
        b=hTO7t18CcvIQ2NQkKlDZruQQbhs1lN6sZ8rmc6gwmK4nN6bIRWH2Shzbsg7spqLPyW
         sgUBQiAUZhpqWTwx9pfrghWjF5crQOXSlcHuQkJHVo0HzF5/WnS82UmXpU+y4PlurBcF
         C+WZlzEgKum8rpnR14pdswgPN4arM/u3tTKUY/5o30jyuL6QSNeOzoio5erkffdrsSJM
         o/C+ojmPgvA0RwiismDTFfQy9oCIkVHJ5TxqxahT16ETLEyFjrGEaJGM3gz9Oc0IYnYN
         Lu3Bh256C6M9tkTcBFLq8eX459XHY0D/j+29ZF4DY355dAzzy3Z2kQqTkulbQ6eX/wFO
         9f1w==
X-Gm-Message-State: AOAM531YvYtH63/ANZNIzRgVTZX6Zz3NApP5Vz0qtGJpVprEn76b+pMb
        TscxSde7QxcJoN/JjAb2owtiFg==
X-Google-Smtp-Source: ABdhPJzFfsedhaLX8n8bpSfxSbNRN3zzyxCHlaOIOS6tyKoZxnAuPBXgwGAGxjCR5kPFKzVVcR4THw==
X-Received: by 2002:a17:902:a504:: with SMTP id s4mr847143plq.177.1594666994828;
        Mon, 13 Jul 2020 12:03:14 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y198sm15123103pfg.116.2020.07.13.12.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:03:14 -0700 (PDT)
Date:   Mon, 13 Jul 2020 12:01:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] remoteproc: qcom: Add missing slab.h
Message-ID: <20200713190106.GA2161373@builder.lan>
References: <20200713020003.134039-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713020003.134039-1-wangkefeng.wang@huawei.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun 12 Jul 19:00 PDT 2020, Kefeng Wang wrote:

> drivers/remoteproc/qcom_common.c: In function ‘qcom_ssr_get_subsys’:
> drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of function ‘kzalloc’; did you mean ‘vzalloc’?
> [-Werror=implicit-function-declaration]
>   info = kzalloc(sizeof(*info), GFP_KERNEL);
>          ^~~~~~~
>          vzalloc
> 
> kzalloc() is declared in linux/slab.h, add include to fix build issue.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Thank Kefeng, patch applied.

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 2f45f0c79914e..085fd73fa23ae 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -15,6 +15,7 @@
>  #include <linux/remoteproc/qcom_rproc.h>
>  #include <linux/rpmsg/qcom_glink.h>
>  #include <linux/rpmsg/qcom_smd.h>
> +#include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  
>  #include "remoteproc_internal.h"
> -- 
> 2.26.2
> 
