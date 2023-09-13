Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976F5CA553B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 16:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjIMQYh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 12:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIMQYh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 12:24:37 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461F090
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 09:24:33 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-269304c135aso6163a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694622273; x=1695227073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8zYJ0RCDSzCvH0QmeVklyy3iTRroJs+iiHGO8/+f8I=;
        b=nMnMzULmo0/OpRuQqqhm1kcA7B8vpJnwBXIiVuStocjehig90bYjKuXDxO0XdkXSG+
         1idiR4yp1bOiCjqjdqjsDfmPK7nUeO+tQcDxxLEwj8DSlZZM3hRDBESHL2JvW7I68tVR
         mCuSOtRMtjzD6AfY3e5zditE030JazSaOQTJOz9+hPnjzLD2frNUo5K/jphUn4xj4+fw
         0t4XcWFYyR4YHym+h3ZZRB/+t+/wPlFfcVgf59dxDucKNGWzrL2u75XvgL++MRKgbj3f
         c1cH52c3S61rloPElYWGCukEkA1JIN9hmh2KCTerGNSvqYSYvdrKJ/Hpp3uToAzeypGj
         sZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694622273; x=1695227073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8zYJ0RCDSzCvH0QmeVklyy3iTRroJs+iiHGO8/+f8I=;
        b=FBI6w/9ACeMBwmOYUK0olUk3ElLe039v8fjnw1sl6FS5orEi4fUO7803fK5+ff2mqR
         gmAp1xl+b27Nm1X2N7OTAuViCNgjdsMceeDojJitWm5vsw3+CfeBmn0fUtwRvTKK1wA8
         wCbTFLeZHbbtskJeus/UVWCzHOgdF00O+Jc0cmGeFfCggQDtbNxdRRMgecX1Yvh/6mhO
         yG+K/FdTHsuS27OZqdKyjCWkISquYfmolqQKJRcCXwFc+ZKubgvZyZstN1g+aWiL9H/5
         IRRvAenqzg0SVUYdpch+S/uGBDBbTug27bRoWrLn+RTQuIATc+ATFplXJRPLRagC3jN2
         PdGw==
X-Gm-Message-State: AOJu0Yz/7qff8DerQpWmN6aklVjt9ysaeUTH/Ef3NmE77Davp/9wlh6q
        pMqP252zTsldjrWAUEuaRklVLw==
X-Google-Smtp-Source: AGHT+IHWgvdtB+C/HoVawZpYur0vnXtpwb+tKQOBHfzGcJms7pMWVUlPNPLiwp+O2MlPn4j6G7TlYg==
X-Received: by 2002:a17:90b:4c4f:b0:268:1068:4464 with SMTP id np15-20020a17090b4c4f00b0026810684464mr2548211pjb.30.1694622272676;
        Wed, 13 Sep 2023 09:24:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d880:f5d9:a2c5:d083])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b002680ef05c40sm1668280pjb.55.2023.09.13.09.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:24:32 -0700 (PDT)
Date:   Wed, 13 Sep 2023 10:24:29 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Chen Jiahao <chenjiahao16@huawei.com>
Cc:     andersson@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, arnaud.pouliquen@foss.st.com
Subject: Re: [PATCH -next v2] remoteproc: stm32: Clean up redundant
 dev_err_probe()
Message-ID: <ZQHiPUYYLNwJ/rz1@p14s>
References: <20230817083336.404635-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817083336.404635-1-chenjiahao16@huawei.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Aug 17, 2023 at 04:33:36PM +0800, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant. Removing outside dev_err_probe() to
> clean it up.
> 
> Besides, switch to use platform_get_irq_optional() since the irq
> is optional here.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 98234b44f038..1f53c672c66b 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -712,9 +712,9 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  	unsigned int tzen;
>  	int err, irq;
>  
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq == -EPROBE_DEFER)
> -		return dev_err_probe(dev, irq, "failed to get interrupt\n");
> +		return irq;
>  
>  	if (irq > 0) {
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
> -- 
> 2.34.1
> 
