Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67222C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Mar 2021 17:01:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33C7960FEF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Mar 2021 17:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbhCaRAf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 31 Mar 2021 13:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbhCaRA3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 31 Mar 2021 13:00:29 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB02AC061574
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Mar 2021 10:00:28 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id j25so15010234pfe.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Mar 2021 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8CMJJPY1glfR3cYmba+zIjKonSJ1PODjzUQOl2feUs8=;
        b=VjXc29thg91cjrIfM0fANgIorC+5VjaHmISJnH5Sv3fRe1hpvfBsoZ+VjVz3dWVCs7
         cZpB13IBcAE6xhJmFdQL8JZHOtoC8SAF0liQYJLCHvujoKuLyq3QHPMXYgmowYmEP5LL
         91Y3DpcRMAIjrrX+ZMz65y6onIom51Fz6C4kSOC80j9CsoXnUI8C26rzAsXYUAtXvX16
         Nj5VQ0/yigwcQGrxnYmNzVajdsxk0WbpQIuaEC5OXlm3y/2/Xa3Fo2M5M6uEHuHtXEOw
         5TfEpabHQPKI0uWBEooilEjXrMU5JemFCy7rNtzIfcS2gLnhxS4UF/FeVo1OVHK2Wfed
         ymyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8CMJJPY1glfR3cYmba+zIjKonSJ1PODjzUQOl2feUs8=;
        b=py99PRt8TjQ/C6+gpsBXXwP0LEaCWzz/oaydxZNJyLmeuZP9kzWcqk/OUbil9PXRQs
         Wid7S1/swfPLaZTGBnuvprLFxAmrRmf9P4ByWL+KSiwpB1yfDs7uU7Vr4my3/07kcgJG
         NINL/WUyV7C007BwZ3IP2RPmLdvSglZC4qpvOOytszXypxp4O2R4jwqODfpA3wKX3DZh
         i/n/RWnTBGaxuIsLi8Th3pzz1/dA17GJXBqDFb83A9n8yuFeEIPpWWQk0EBsURlOzPIO
         x4tYGJzNIqA+RweEbxQu4PIj0n9Tgga5KRdpm9byIvufSdgHU8269z6booeoV9onYUyk
         mrRA==
X-Gm-Message-State: AOAM5324oIRiwMfDigPtO9ea3D9lQuPrie2eIVedX6y28R0IcGA/VKOj
        bzylDmYRYK09SFrmOh9EnX7i/g==
X-Google-Smtp-Source: ABdhPJwJp5wnQFXbGr0scI1am/x3JHOdvVvk/xAi3xIN2+AT4FbkoxAK98YwxHf7re61kTL0m9LqZg==
X-Received: by 2002:a62:6101:0:b029:215:3a48:4e6e with SMTP id v1-20020a6261010000b02902153a484e6emr3946608pfb.2.1617210028415;
        Wed, 31 Mar 2021 10:00:28 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l22sm3000443pfd.145.2021.03.31.10.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:00:27 -0700 (PDT)
Date:   Wed, 31 Mar 2021 11:00:25 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Peng Fan <peng.fan@nxp.com>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] remoteproc: imx_rproc: fix build error without
 CONFIG_MAILBOX
Message-ID: <20210331170025.GA2371491@xps15>
References: <20210331122709.3935521-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331122709.3935521-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Mar 31, 2021 at 12:27:09PM +0000, Wei Yongjun wrote:
> Fix build error when CONFIG_MAILBOX is not set:
> 
> arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_kick':
> imx_rproc.c:(.text+0x328): undefined reference to `mbox_send_message'
> arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_probe':
> imx_rproc.c:(.text+0x52c): undefined reference to `mbox_request_channel_byname'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x548): undefined reference to `mbox_request_channel_byname'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x76c): undefined reference to `mbox_free_channel'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x774): undefined reference to `mbox_free_channel'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x7c4): undefined reference to `mbox_free_channel'
> arm-linux-gnueabi-ld: drivers/remoteproc/imx_rproc.o: in function `imx_rproc_remove':
> imx_rproc.c:(.text+0x86c): undefined reference to `mbox_free_channel'
> arm-linux-gnueabi-ld: imx_rproc.c:(.text+0x874): undefined reference to `mbox_free_channel'
> make: *** [Makefile:1292: vmlinux] Error 1
> 
> Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 7cf3d1b40c55..e68fcedc999c 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -26,6 +26,7 @@ config REMOTEPROC_CDEV
>  config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
> +	select MAILBOX
>  	help
>  	  Say y here to support iMX's remote processors via the remote
>  	  processor framework.
> 
