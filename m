Return-Path: <SRS0=ZQLr=DD=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D772DC4727D
	for <linux-remoteproc@archiver.kernel.org>; Sat, 26 Sep 2020 03:36:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 879D020866
	for <linux-remoteproc@archiver.kernel.org>; Sat, 26 Sep 2020 03:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KU3kek6b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgIZDgf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Sep 2020 23:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgIZDgf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Sep 2020 23:36:35 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC49C0613D3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2020 20:36:35 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id m13so4228536otl.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2020 20:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dyiwYFWGmDujhI5GwhY+kCTzE/oqCxO3zN0ObNzju24=;
        b=KU3kek6bssktGJqESLUk7dWYnY2hrP5Bj4aBKShvkGg0VmjV+BZvEpeECS4iScnoT/
         tXIzgDi7Hmjsh5n8zgzuMK40brSTC/I5TI/Rw4t+qO8bMv6gXEd9Usnc+i49Pt1vKz1/
         MrDugj06KhyE4CDlbkrQWt5Qy6jPA370ehHQpgRr+5km8JtslHkNAD6J6px7bDdKBZmW
         dgdzKZwegxtduOeeHeu7B+cfFpk0NyLHozl1fceG5dS+EinNe35SYbBiNeTdbf0HqiJx
         5XyFQjcBxBAJSeSdinR+dgSAB5DhkSw11bi+NWrBGFNkOg66qEB1UP53ak3ueqBUgMqs
         HSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dyiwYFWGmDujhI5GwhY+kCTzE/oqCxO3zN0ObNzju24=;
        b=rzBWc/yuuYD2jzyXrMfklKQS3LR9mcQVD7mU0HT1M+GLaBqDxpnoo0R/gMlQYg6JNC
         u+2xDY7TBW0dmZfxcWl2/QzXwdr0Wyp90INKDv7RU0Tfpbsv8ZP2Ub9SxWsqHa9EkXoB
         5OGaC+w3Pz9iemxdSKSXaHzK8Oma9EJzqq7i4/y0N+oKjyl3FiNzLP6/hkLSheBcDpTQ
         p9jMbOcX9DKJgOpLxD9ws+iwsbeltbza5zayKmU27cw4kBHQwl1LlfwjEZsuausfxISy
         FEuopxz33E2NsbQB6TF08BR42715tD1qkWmFadap02AII5hl9ocOzLK/KLSUOmkwg7ah
         26vg==
X-Gm-Message-State: AOAM532FArBSYIe2DPOmd3s+tn7NV2KHL1zNB74Rb4x1oFhMQ9MU/rvC
        8CFJbiDv3XWLZkeqgj7ckb81f85esOs5bDwC
X-Google-Smtp-Source: ABdhPJxYkJC896CZZeUCE/Rk5suCyN+1W/Q2lhCFbJapSfBIvlU8SiMsZlosT7AufHamFCcd+pXpMg==
X-Received: by 2002:a9d:241:: with SMTP id 59mr2482555otb.151.1601091394974;
        Fri, 25 Sep 2020 20:36:34 -0700 (PDT)
Received: from builder.lan (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id z20sm333999oor.3.2020.09.25.20.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 20:36:34 -0700 (PDT)
Date:   Fri, 25 Sep 2020 20:32:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v5 1/2] remoteproc: Move coredump configuration to sysfs
Message-ID: <20200926033201.GB10036@builder.lan>
References: <1600449731-3056-1-git-send-email-rishabhb@codeaurora.org>
 <1600449731-3056-2-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600449731-3056-2-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 18 Sep 10:22 PDT 2020, Rishabh Bhatnagar wrote:
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
[..]
> +static ssize_t coredump_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct rproc *rproc = to_rproc(dev);
> +
> +	if (rproc->state == RPROC_CRASHED) {
> +		dev_err(&rproc->dev, "can't change coredump configuration\n");
> +		return -EBUSY;
> +	}
> +
> +	if (sysfs_streq(buf, "disable")) {

As pointed out by Sibi (somewhere) this should be "disabled" to match
what's returned in coredump_show() and what goes into the recovery
file.

> +		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
> +	} else if (sysfs_streq(buf, "inline")) {
> +		rproc->dump_conf = RPROC_COREDUMP_INLINE;
> +	} else if (sysfs_streq(buf, "default")) {

As I pointed out in a previous review, I think it makes sense to change
the default for dump_conf to "disabled" (a separate change). But in
doing so using the word "default" in the sysfs interface would be
misleading - and once it's part of sysfs it stays.

So how about changing this to "enabled"?

PS. The change of the default value of dump_conf would, in line with
Mathieu's ask, be a separate/unrelated change.

Regards,
Bjorn
