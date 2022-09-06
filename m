Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCDCECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Sep 2022 19:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiIFTq2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Sep 2022 15:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiIFTq1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Sep 2022 15:46:27 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DB680EB7
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Sep 2022 12:46:26 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id p18so12300144plr.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Sep 2022 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=IBPdQANHf97tWgxor5PJdhaZzkDG3IihFINjxVsoED0=;
        b=tLjM42w0h79oeklJLb6AxmbcJsxdaIdxPqO8qOG7XxoD7I85xW2QcdBt7Lxb0lDdnd
         9a/DSLKMRsB0+/Gd1u0nvnI/4i79IFtQDsX3uBISupvrvBBVmw0LfkXv7ezkBzGHQ9jw
         hHTPnqnfx8FAmeNJ7IQuOsCOiQKP1pczrX4HE3JbXpryGkncjDWde3KOG1Z2OpSY++B/
         fJrycDcdz7R68wWzCM13qah3X/Pv9LBfeXeO1Aff1pO2VqwTW8cHY11+3PuSGn/hc99V
         OuWD5c6lOhMfaz81qoO07RT/npj5jE52BzsLt6DHxlJqoHl5/s2lhdJiVxdBXyyfkPOA
         au3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=IBPdQANHf97tWgxor5PJdhaZzkDG3IihFINjxVsoED0=;
        b=vQtoeZrEPBGDy7bYWpQZE10CBZl+VphFu4HAuErlGp1Pwmt1kqRklxog7Bt4LFrAUj
         VJxhGO86nH6HBBg8bNgXSQlGAZIbCBJcerYgQGQ8HHhOfmU8oeV20hUg0UgTJL07Fw2/
         3COto0KoKlS4w/BK8ehhAqaqAkOYlaiyGCmUONlChriu/65Up96YHUXvS3W4ZVtu6Lvk
         eY01sEJdygqQjgaFlbMli6uac77mNWbuYbM2ie1CGQ7s3VGJ6SrfJhU17OY0iaiBZTS5
         VFxiXGhatLpw9jEmRmqwYp1CYZ3Tutu/Rb6kbhch7pPI0GWWmug3LYiOTAfnSt8Gkdki
         jnTw==
X-Gm-Message-State: ACgBeo1UTnzAnJ9gEEHR01cfnrABfl+iturTwGoIe9VuvZ5oJBu4IOku
        KCXZVSC+5bTSFOU7a3CLr5Vtgg==
X-Google-Smtp-Source: AA6agR5YVyvasPcVBbYqwjNdZ26vZr0t8z4gFVtE75jAQi4oOwLt88qoGwedD23/sop/xKnwVeYZJg==
X-Received: by 2002:a17:903:230d:b0:176:d7ab:cd1b with SMTP id d13-20020a170903230d00b00176d7abcd1bmr221477plh.172.1662493586079;
        Tue, 06 Sep 2022 12:46:26 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090aec0b00b00200b12f2bf3sm424007pjy.51.2022.09.06.12.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:46:24 -0700 (PDT)
Date:   Tue, 6 Sep 2022 13:46:22 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: report firmware name on load failures
Message-ID: <20220906194622.GB64477@p14s>
References: <20220831161736.749932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831161736.749932-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Aug 31, 2022 at 07:17:36PM +0300, Krzysztof Kozlowski wrote:
> remoteproc error messages like:
>   remoteproc remoteproc0: request_firmware failed: -2
>   remoteproc remoteproc1: request_firmware failed: -2
> are difficult to debug as one actually have no clue which device
> reported it and which firmware is missing.  Be verbose and print the
> name of the failed firmware.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e5279ed9a8d7..71cd7ed7a970 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1923,7 +1923,8 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	/* load firmware */
>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>  	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> +		dev_err(dev, "request_firmware %s failed: %d\n",
> +			rproc->firmware, ret);
>  		goto unlock_mutex;
>  	}
>  
> @@ -2023,7 +2024,8 @@ int rproc_boot(struct rproc *rproc)
>  		/* load firmware */
>  		ret = request_firmware(&firmware_p, rproc->firmware, dev);
>  		if (ret < 0) {
> -			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			dev_err(dev, "request_firmware %s failed: %d\n",
> +				rproc->firmware, ret);

That information is already available in sysfs but if you are really keen on it
please do the same for rproc_trigger_auto_boot().

Thanks,
Mathieu

>  			goto downref_rproc;
>  		}
>  
> -- 
> 2.34.1
> 
