Return-Path: <SRS0=rFSt=CY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE53AC43461
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 18:34:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70B9120732
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 18:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AiloNFxh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgIOSd6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Sep 2020 14:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbgIOSdv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 14:33:51 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A1EC06174A
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2020 11:33:50 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id e7so3950260qtj.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2020 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+6blGfo45ddZLHqhdwQdwxW8NrcsjKKHRRn1ZBFXZLs=;
        b=AiloNFxh5Cghl768jry20e5NlAprC5q+qXPjhNzSb/KwOQgDxHmLc9ijue0h3gEQTF
         MIZnq7foK9H9nRgI2dh8JhQ8zTHaEc32/iGt+J4bdwCjnAMIpfc3xU/b2kN3dLLRqL9Y
         Zq8Z4wwSsoSTMzRUqX4v+s3yey83bsIAVQwDnPdkff/f5Y7ReN/VcE9wz5HhRgn4T+UH
         vgGKklp3Og6USdpBP/9SPua7hVtevCOnwf0/QM3PKs1Y1XKppuMRM0/Z2XhJO2wShq7c
         z1GCh7w+BD7ha7y0v2YLHb/We7eErm7KoVQ0CUzWyLuX2zg9kNxpMx/OpTlaFtgptxsH
         51Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+6blGfo45ddZLHqhdwQdwxW8NrcsjKKHRRn1ZBFXZLs=;
        b=aEX1CcsRy/Q7H7WU+3rxcCsOthHp6d4fSxWGOoC+21BEa8QYAH/y9uu+anfNK7LdIR
         W3JG0kBb1oXLL5/VMzSQYUB/ZlErbwMzVrF/ECxBae/OvRzNqrXfOLdqGhcbBbYbE3+0
         YLZ7G7aLFIzH24PRQGeiYkccOJh6mfUHcDaTJnpfWaV+HRNmiPCvLXVwQWoneebgW7Iw
         eb5I+LWJQe3fY/+lu+jBn6PJHqnakrxyatOTeum7nQZ2cEFOmfvZUUm587O4eHdQkOHZ
         5GSMAMdufQdrvxP8vKGZiDkXQ7/Yk8RWyXJUfYIa4/DV9ovtHZxPSLG/LbzN3O/q2NXV
         g0EQ==
X-Gm-Message-State: AOAM531dh/pDOjEYYw18WrhkLjh8j4F5pVKm1f9u34Hkqf5GLEpIoLiX
        Cx5xKDvwZMj/JidAk1UPyzEGvg==
X-Google-Smtp-Source: ABdhPJz7sRn6Y1bEqWrjwHnF2W6Cm8ePoVdwzD3htSQpX6zknE/6OuWM79mb5tJYrZj8Ag5B/NZBUg==
X-Received: by 2002:ac8:4f44:: with SMTP id i4mr19663393qtw.189.1600194829229;
        Tue, 15 Sep 2020 11:33:49 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id 29sm17519013qkr.114.2020.09.15.11.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 11:33:48 -0700 (PDT)
Date:   Tue, 15 Sep 2020 18:33:47 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5: Assign mpss region to Q6 before
 MBA cold boot
Message-ID: <20200915183347.GJ478@uller>
References: <20200915173713.28098-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915173713.28098-1-sibis@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 15 Sep 17:37 UTC 2020, Sibi Sankar wrote:

> On secure devices which support warm reset, the modem subsystem requires
> access to the mpss region to clear them out. Hence assign the mpss region
> to Q6 before MBA cold boot. This will be a nop during a modem SSR.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> I didn't want to add any new flags for warm reset support because
> calling xfer for mpss to q6 shouldn't have any side effects on
> platforms that don't support warm resets.
> 

As discussed offline, I don't see a problem with unconditionally handing
over the ownership of the region during this time frame. So let's just
generalize the comment below a little bit and I'm happy with this
change.

Thanks,
Bjorn

>  drivers/remoteproc/qcom_q6v5_mss.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index c401bcc263fa5..cc5b7edc02c73 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -931,6 +931,18 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  		goto assert_reset;
>  	}
>  
> +	/**
> +	 * On secure devices which support warm reboot, the modem subsystem's cold boot is similar
> +	 * to an SSR sequence i.e the mba requires access to the modem memory to clear it out during
> +	 * Q6 cold boot. For modem SSR it will be a nop.
> +	 */
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, true,
> +				      qproc->mpss_phys, qproc->mpss_size);
> +	if (ret) {
> +		dev_err(qproc->dev, "assigning Q6 access to mpss memory failed: %d\n", ret);
> +		goto disable_active_clks;
> +	}
> +
>  	/* Assign MBA image access in DDR to q6 */
>  	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
>  				      qproc->mba_phys, qproc->mba_size);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
