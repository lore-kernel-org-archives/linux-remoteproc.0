Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51640C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 16:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18D9123103
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 16:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgLVQqt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Dec 2020 11:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgLVQqt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Dec 2020 11:46:49 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCF1C0613D3;
        Tue, 22 Dec 2020 08:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=yDaEVa5/CN2aXuAdrJIrpXOewRldlkldBKhnrVTMj/k=; b=FpH7nfB6UoVtvi7p0R0fTVNGTH
        Jel+akEJk9iE4s7FJ4zytcKKZH2uSePzwZeM9BeUO4OqCrHwrm4Y7ArWDqpdaEkaNTiwFcpTlG/f6
        F7pSihyaTb+TsxArfYhQKt3Jf2Cc9Hi1D75+q8pYG+eqzeHT4FmaUnmE4Ffy2Lr8T3/Hl9K3eKqFK
        p0wTCdGQVYnwVw7Pk37clLAf5KJqiT9wsam0R6NMjS3Ee2Y3HJsvOOljxW2Ndn17Um4Og0OEbaaVf
        B9cvwHEzxQycbEmQcDoWTSvTokYoIuoqrQhiMAWXrZ3qTCmtdvav8tpJm6nb9T1iuc5zfiQfrgwWi
        FAtZWFAQ==;
Received: from [2601:1c0:6280:3f0::64ea]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1krknT-0006iD-MH; Tue, 22 Dec 2020 16:46:03 +0000
Subject: Re: [PATCH v2 01/16] rpmsg: introduce RPMsg control driver for
 channel creation
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <154570b1-cf26-6d7c-1641-d6a3528dacad@infradead.org>
Date:   Tue, 22 Dec 2020 08:45:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/22/20 2:57 AM, Arnaud Pouliquen wrote:
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf13..c9e602016c3b 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -23,6 +23,14 @@ config RPMSG_NS
>  	  channel that probes the associated RPMsg device on remote endpoint
>  	  service announcement.
>  
> +config RPMSG_CTRL
> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the /dev/rpmsg_ctl API. this API

	                                                              This

> +	  allows user-space programs to create channels with specific name,
> +	  source and destination addresses.


-- 
~Randy
