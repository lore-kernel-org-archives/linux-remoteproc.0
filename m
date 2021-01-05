Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22410C43333
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jan 2021 01:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9F5B22ADF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jan 2021 01:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728875AbhAEBDz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jan 2021 20:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727748AbhAEBDy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jan 2021 20:03:54 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8D7C061795
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Jan 2021 17:03:14 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id w3so27865621otp.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Jan 2021 17:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SBBTs+bvU9iy9EBWJDnY4qaMDeMg6PPS2w0qpSY3yQE=;
        b=cVeolfQsOycUWSJbpwu3LkQMr/DS38odCyzF18UWKZFcuNylWnEvj4z12vyjZ7a5aA
         PDgx+jGr3pbE7+4ADo/tkTsXyO3qXvwkwntexOQhz9OniKuSGUkbgHH4ehEELg/aAFTU
         rRwIoiTQaepYfpmHscGiPXYJcC49U9e4JrhxOXoE/5poWr/pI6aCKBQUJ+xAwk5J5A6j
         ph/caoL745Grhz4V5VdPDOFJC8MdmAv55Sfd78CE+UNCWvjNY0BSEAZ4ZsLuoAg8ugSS
         NIQwK67EXYyHV94dhjTcqQJE10R+nApS6oYqOUd6ixRamAAKs1pQ6+Fj1ppYKA+ePA/f
         RL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SBBTs+bvU9iy9EBWJDnY4qaMDeMg6PPS2w0qpSY3yQE=;
        b=Df0ThlFmKGWFAOJ/jPonTfErnzBEBmWzupZrKhwuN3oN7gxgyQ0GGPrZpSdkn/0YPV
         AxrOwXGwIyJPgP5PdLWno/ujM0OL1q7x3ZSnvLRl+91HrR5lLyq2zBy9bjDp3/mn1FVJ
         NTgnuHehEaXT8A+6gfCx08ucxuaaat0Gc+KPPjBE+susuuwwhV7/GFMF8K6RnB9cQWXF
         GwIli65Nig001knQ0HT9aSn5Co2ydxX+tIZnewd62D5MiUXGDWf4f4UmJP0yoGTsVqMZ
         FCBaV0NzKyDCJV6itV5CTi3ScI2MmPoN2AChSj2s6lWTV4i4VjZ3gP8g7y4vXv1Kq6yn
         NSIA==
X-Gm-Message-State: AOAM530QZdRS4UceRKqtKJ6PYmCyyFsOSX2MqSt+YBMsq9rD94px8CP7
        /P01VLfgnSO549e0h82D+ny+Mg==
X-Google-Smtp-Source: ABdhPJxCHMQuo1VLdZ9IiJnuuTZHNgMeEvrX5FkkWNXHfJzJv7EHGtUi2aT9wnaNlZemU8tohsfnDA==
X-Received: by 2002:a9d:6c92:: with SMTP id c18mr52506972otr.232.1609808593676;
        Mon, 04 Jan 2021 17:03:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l6sm13572775oof.3.2021.01.04.17.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 17:03:13 -0800 (PST)
Date:   Mon, 4 Jan 2021 19:03:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 11/16] rpmsg: char: check destination address is not
 null
Message-ID: <X/O6z6ngPmML3nOD@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-12-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-12-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> The name service announcement is not sent if no endpoint is created by
> default. If the destination address is not precised by the
> application when creating the device (thanks to the RPMsg CTRL interface),
> it is not possible to have a valid RPMsg channel.
> 

In the Qualcomm transports, the chinfo.name is used to identify the
channel, so there it's valid to create a endpoint without dst.

Regards,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 4b0674a2e3e9..8b1928594d10 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -305,6 +305,16 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	struct device *dev;
>  	int ret;
>  
> +	/* There is not ept created by default. As consequence there is not NS
> +	 * announcement and the destination address has to be set.
> +	 * this limitation could be solved in future by adding a helper in
> +	 * rpmsg_ns.
> +	 */
> +	if (rpdev->dst == RPMSG_ADDR_ANY) {
> +		dev_err(dev, "destination address invalid (%d)\n", rpdev->dst);
> +		return -EINVAL;
> +	}
> +
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
>  		return -ENOMEM;
> -- 
> 2.17.1
> 
