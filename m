Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A268C56202
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 04:05:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31D7622210
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 04:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gY5vw82/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgKUEFo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 23:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgKUEFo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 23:05:44 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCEFC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 20:05:44 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id o3so10754651ota.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 20:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vDCzn8IpZ7D1wHWvbrDgdoNWq9ddfRFT4DNN+T24cXc=;
        b=gY5vw82/h1f9OVJ6eYtJiP9As4gPHncfRQvhz8TcCdbhtOmCxWl33fmyGQ6MvrZL6A
         waOVRIqwe0WcHXmIblrUj19BejHVizPjBSFo2hNrkki0O7hlNlGU3yuOQkaBZrESXzmR
         qE+uvja8Olo04T/4NAfKxAci/eyYLNH65J3s5cLeZ3VlfRrzVIlHqU1wwUIGI0QJXRpk
         ohNEt48kmWR8niX3dPmKODoDL6iaRgJdTFDao7BK9GH7XkmEHIJcGOvDzdMh/biLtPPl
         4xbJyPHkbmsek6hQwgZtdchqWy4LjTQnOOjTlvXyLDKsu9lrNkb9cQ1A7FdnKoVjbKeH
         c7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vDCzn8IpZ7D1wHWvbrDgdoNWq9ddfRFT4DNN+T24cXc=;
        b=b1SEDZz4qlqmmZjlOD3Djtr7oW5FItZB1euyEQaTeHV6UzodlBjZfGAIacfxCdM9Mu
         KdrYC4PSQc7dG6Xtwd2qqaIXJk8oUF85G1Vb7KVK4xYDpY1LCdqp0ns7YIwEvSiTVlU8
         CWHb3+tGBk8gOYIOlX502qIJOd8W+t8lsgAN7ziJXo286+uKiKfR8SVRmZ0g1ytU5DM+
         SACC2QADtg85H5eAhQdRgB0c8MSezZtsl6HHhpkuZdb2ujfUym8v8lePNqLryGI/UVT+
         A9iX0PRD5IlxODHJ7c7RVP8KSw74PMtOV9H9SQJZlejJ4/TzWSQkDbWHU7B0rq+TdAWy
         r/ZQ==
X-Gm-Message-State: AOAM531XYPXndlM8mr9L6jmuYsHqek+NvwExlFpagxVF+YYk2KccehFv
        50ML3289V0N0qeGtwt7xbVEBZA==
X-Google-Smtp-Source: ABdhPJyEoLAlB4m/u91It7w5xf0owODbLy8PAPhdLNw5Vc0V3GxHTc8Ur+ZzMXEXgxSWKQFTLiGEow==
X-Received: by 2002:a05:6830:1e95:: with SMTP id n21mr16865592otr.49.1605931543881;
        Fri, 20 Nov 2020 20:05:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r206sm2760502oih.14.2020.11.20.20.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:05:43 -0800 (PST)
Date:   Fri, 20 Nov 2020 22:05:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 4/4] remoteproc: qcom: Add minidump id for sm8150 modem
Message-ID: <20201121040541.GM9177@builder.lan>
References: <1605819935-10726-1-git-send-email-sidgup@codeaurora.org>
 <1605819935-10726-5-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605819935-10726-5-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 19 Nov 15:05 CST 2020, Siddharth Gupta wrote:

> Add minidump id for modem in sm8150 chipset so that the regions to be
> included in the coredump generated upon a crash is based on the minidump
> tables in SMEM instead of those in the ELF header.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

When reposting patches without modifications, please add any
Acked-by, Reviewed-by or Tested-by that you received previously.


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ca05c2ef..e61ef88 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -630,6 +630,7 @@ static const struct adsp_data mpss_resource_init = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
> +	.minidump_id = 3,
>  	.has_aggre2_clk = false,
>  	.auto_boot = false,
>  	.active_pd_names = (char*[]){
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
