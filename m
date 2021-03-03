Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04143C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 00:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D294064EBA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 00:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbhCDAuI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347377AbhCCU5T (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Mar 2021 15:57:19 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA9FC061762
        for <linux-remoteproc@vger.kernel.org>; Wed,  3 Mar 2021 12:56:37 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id t16so5462740ott.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Mar 2021 12:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3dEvE/fPUWfMbtjvKXk5HH/q/9Tl/G/Rxwp2dn0I2zI=;
        b=eicamKlMbyxNj2z4SPkbIcR9jO1XDO5kgSx/ksRuPblw1Hc0SgoTbaZoZDZ/Mcs1BT
         GXFiVvKVQKqIaE2to0AtrtL5Cb91J7HdYyiXVj112Fjp0PSGrKJMWJvUF/Ql/zKZudp6
         vzJ5rrq3PB59MkWs6By6h+nh81L0iXX9WwZ94nYRvYDJF1pmS2xFU5YYbPTdXqZcI+23
         TK2n7LWF83Jey7ctPGsMDFadAd78SbMlMmISnNqXz/WD/Z/elhbBdmEagHdIO6bsNxtO
         lDltKfDiZ68XdTgrV7GDpzIG4gkX09poWszf9lolZ5bBVUZwvNHbylrH3RxpUhrF7wTB
         rjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3dEvE/fPUWfMbtjvKXk5HH/q/9Tl/G/Rxwp2dn0I2zI=;
        b=sY6cAbOWXWz+z32FkDa9QxZwSGdrxKO0pQcrmNeTMA+hfklNgKQpvabmlccQg+SyUZ
         2Nmn2UQVQCWx1S0t94wtlbU89IJEf9Sg7rZ2YLFhLJCApLYi/Y0Vrkw5OrDjoCWPiiAx
         SilnJNMCISdOoYgay/u8cLRGVi/UMIJB0kB7KhdV2mBMneL69A3H5LPxtgUpZZ4zLsWi
         CQYwGZBY+nGJmPFCc43BgxBDdjrZpQ6fZH6l/dEqBImEwoXIB97XjyBlAa6RNM7d68W7
         8jn1QNd8cAS3I6/pmqbEqpZagrD8HDlllJy9twfA5DQvGduYHSFYLDsXT3CEHcHiBzLJ
         FRCA==
X-Gm-Message-State: AOAM533q8jxhXk20FM7mbsd/jLBM3P1iKkag7y7r8UurpF+PxfIQkxKQ
        fWd4P4jFSaBLok0izy+3aZHXkg==
X-Google-Smtp-Source: ABdhPJygTcrtcdyJIBSfhkFwBsllBLIYElTRHYBFeXXcuaARAoEGBSTKdgDQXKSdVsU7PkeN87MznA==
X-Received: by 2002:a05:6830:115:: with SMTP id i21mr813025otp.96.1614804996408;
        Wed, 03 Mar 2021 12:56:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g3sm4742488ooi.28.2021.03.03.12.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 12:56:35 -0800 (PST)
Date:   Wed, 3 Mar 2021 14:56:34 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raghavendra Rao Ananta <rananta@codeaurora.org>
Subject: Re: [PATCH] remoteproc: sysfs: Use scnprintf instead of sprintf
Message-ID: <YD/4AnjM6XCBivul@builder.lan>
References: <1614801698-25987-1-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614801698-25987-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 03 Mar 14:01 CST 2021, Siddharth Gupta wrote:

> From: Raghavendra Rao Ananta <rananta@codeaurora.org>
> 
> For security reasons scnprintf() is preferred over sprintf().
> Hence, convert the remoteproc's sysfs show functions accordingly.
> 

Thanks for the patch Siddharth.

There's no possibility for these calls to generate more than PAGE_SIZE
amount of data, so this isn't really necessary. But if you insist,
please let's use sysfs_emit() instead.

Regards,
Bjorn

> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 1dbef89..853f569 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -15,7 +15,8 @@ static ssize_t recovery_show(struct device *dev,
>  {
>  	struct rproc *rproc = to_rproc(dev);
>  
> -	return sprintf(buf, "%s", rproc->recovery_disabled ? "disabled\n" : "enabled\n");
> +	return scnprintf(buf, PAGE_SIZE, "%s",
> +			 rproc->recovery_disabled ? "disabled\n" : "enabled\n");
>  }
>  
>  /*
> @@ -82,7 +83,7 @@ static ssize_t coredump_show(struct device *dev,
>  {
>  	struct rproc *rproc = to_rproc(dev);
>  
> -	return sprintf(buf, "%s\n", rproc_coredump_str[rproc->dump_conf]);
> +	return scnprintf(buf, PAGE_SIZE, "%s\n", rproc_coredump_str[rproc->dump_conf]);
>  }
>  
>  /*
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
