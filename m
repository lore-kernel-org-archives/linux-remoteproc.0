Return-Path: <SRS0=hTqE=EK=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001F1C4742C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 19:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C3D52080D
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 19:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WffJI4fY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731106AbgKDTFw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 14:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730008AbgKDTFw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 14:05:52 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973C4C0613D4
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2020 11:05:50 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w65so18096462pfd.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2020 11:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e3RgBMCNd6sKZVbOqvGd6J+ApVrztDEwtVCn4pPL4cY=;
        b=WffJI4fYp4FmcCF8nhmDGr00/Y8B8NnS9ajFsJns0MLqg4gebReZE6TRQPBIoh6Etu
         9qykh1g3rHXSVsje8HrlVgj1qIOwf2hJReWpMctR7Ua12XZIKKmWYJraVxLPIXx8mx1C
         PwlFC4Lx6B5D8B5nKMn+YVEZt8Yqx3diDzr6LPjXkuxxkR78nDntu3DZaqWsYp1RQomk
         aAYcB333lTvasR1WznLCjCwPcgBiwA06BjuZf/0iNa/pmvyQ3tFD8stopS600nXWYQFk
         FgQhVtTHZAlNesMYo+BKuIFzp+Afoky5/qQv3GOlCdBK6jMzY2x63MQKQ/s8nOTvFy2l
         vtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e3RgBMCNd6sKZVbOqvGd6J+ApVrztDEwtVCn4pPL4cY=;
        b=HGb0q6X2fMFQCml+VZqdHaB0qOtO4KZG80Sb3UZDm8m8KRg4tGjQ6zB9tCmm3bshzW
         +BgRXrK/Xxw9FmKvJSl3lU19VasD9NkqfVcS/wzQFuwZW+PP4QpQA65sM1ymdqjG/zL6
         pSiDNvLk+r7KIVSd1vbLha8GbgBr2qYaYoMR3v5hq+RXNemiDyPsdwleO/cY9sgxnqo4
         ZHeMNCrIUv9t4nZz9VcqPN0yFVkdSLWlXLGLnj08BAHf7W75x5RlBzVsVgPgDAKnU1u8
         aI2ojJTGTkTEZxAoZnjpT6FOD0r8YEWRDXa0fHH3n2oEo+2k2dgcbr5psly4rXTfILUI
         0Dyg==
X-Gm-Message-State: AOAM532yoWmKe4WpwDjSDdj8XRWp0cQKjUMRjEzglsvE4nI3KGCEa6/F
        uFmDnXBnq18HOM7bjTI72pa5nw==
X-Google-Smtp-Source: ABdhPJwSb7Xs5JU7LvSxnxDJzTwVF5qjpqXYY4TsO/ILSHq1xQbXdfVIMJi3nS5qDmjPiCZ98ePPXg==
X-Received: by 2002:a17:90a:5310:: with SMTP id x16mr5606218pjh.62.1604516750131;
        Wed, 04 Nov 2020 11:05:50 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m129sm3210275pfd.177.2020.11.04.11.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:05:49 -0800 (PST)
Date:   Wed, 4 Nov 2020 12:05:47 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
Message-ID: <20201104190547.GD2893396@xps15>
References: <20201102074007.299222-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102074007.299222-1-acourbot@chromium.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Alexander,

On Mon, Nov 02, 2020 at 04:40:07PM +0900, Alexandre Courbot wrote:
> Now that this driver can be compiled with COMPILE_TEST, we have no
> guarantee that CONFIG_OF will also be defined. When that happens, a
> warning about mtk_scp_of_match being defined but unused will be reported
> so make sure this variable is only defined if of_match_ptr() actually
> uses it.
> 
> Fixes: cbd2dca74926c0e4610c40923cc786b732c9e8ef remoteproc: scp: add COMPILE_TEST dependency
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 577cbd5d421e..f74f22d4d1ff 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -772,12 +772,14 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
>  };
>  
> +#if defined(CONFIG_OF)
>  static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> +#endif

I think it is better to add a "depends on OF" in the Kconfig.

Thanks,
Mathieu

>  
>  static struct platform_driver mtk_scp_driver = {
>  	.probe = scp_probe,
> -- 
> 2.29.1.341.ge80a0c044ae-goog
> 
