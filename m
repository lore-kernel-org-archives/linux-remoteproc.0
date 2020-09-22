Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B33C4363D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 01:07:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EBF923A5F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 01:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zS2t9I4Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgIVBHS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 21:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728518AbgIVBHS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 21:07:18 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43021C061755;
        Mon, 21 Sep 2020 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=IRyDuYDjojtg055tU3K1OwNhO7te0/xwWWHnR7nYvnI=; b=zS2t9I4YJ5PtaGYAW0Qbt849D8
        RJLutzGjiuydQmJXlplbLoxfzBOHp11HQcfuOC1io4AVuI9mBeReML6lF2KBkCeLg0BkhfrLBuo7o
        CamKKPvEwF5VRF4v7P6QdI2iqZCtJx5HlnuFGsh4O4IGlVp0nZML8nAQ9Hb2e2hyegvxczewEBP3i
        VbXzIaYhs/J1M3L9y0LFpq6KnkMW1/OZSnS/YvRKRHjF8OqlOyRtc4L7Uao5QLPYsE4Wzdb0PTxeE
        IaBquFLZKt4R5KA+oQWO4JIWgqCp9rBFtcAPaeaXc+dYPmzD3j9FYZGIp8HmQy4EvIoGcqlriFJ0z
        RGdrRoNQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKWm3-0004mA-Fe; Tue, 22 Sep 2020 01:07:15 +0000
Subject: Re: [PATCH 08/10] rpmsg: core: Add RPMSG byte conversion operations
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, ohad@wizery.com,
        bjorn.andersson@linaro.org, guennadi.liakhovetski@linux.intel.com
Cc:     loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-9-mathieu.poirier@linaro.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <49d5921c-c619-f9de-3ff1-f2617d3c9594@infradead.org>
Date:   Mon, 21 Sep 2020 18:07:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922001000.899956-9-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 9/21/20 5:09 PM, Mathieu Poirier wrote:
> +/**

Hi,
This block is not in kernel-doc format, so the comment block should not
begin with /**.

> + * rpmsg{16|32}_to_cpu()
> + * cpu_to_rpmsg[16|32}() - rpmsg device specific byte conversion functions to
> + *			   perform byte conversion between rpmsg device and the
> + *			   transport layer it is operating on.
> + */
> +
> +u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, u16 val)
> +{


thanks.
-- 
~Randy

