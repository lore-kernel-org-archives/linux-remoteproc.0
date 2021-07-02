Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F61C11F68
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Jul 2021 09:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33B2B613BC
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Jul 2021 09:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhGBKBr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Jul 2021 06:01:47 -0400
Received: from mail.iot.bzh ([51.75.236.24]:41450 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230299AbhGBKBr (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Jul 2021 06:01:47 -0400
Received: from localhost.localdomain (lfbn-ren-1-1868-231.w83-199.abo.wanadoo.fr [83.199.51.231])
        by mail.iot.bzh (Postfix) with ESMTPSA id 499B340082;
        Fri,  2 Jul 2021 11:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1625219950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JE7gPe9XcGjzopCju1Dyamc+jbwY/SH05n9p/kvNIPo=;
        b=u0Xsb/9TloZwFPFhIgcejgTw1SV474HjLhxm8Awk8/Gel1BSlEbCzMq71PV/QbW7clU1xY
        D/zOxTOsy8JNCtxGbDCvze9arRk4RYEVXYDn4WgoRwaeKdMxYf9Cb/5Afma7RP9kXc9l00
        1BSCGUa5I6tSBY+DFSKosxL5jUvCXhj737KwAM2p/GnJt1NC9Dn+uQtdRptsI05g1s+1oR
        u8JbvLHbHeDyv/Zr9gj/EUrbG3TtHIKLX0KbDT28rsgOPFhT0jYQcsKGds9rtwTjCtst9X
        s9dg+J/iQ/SxPGpVhB2UKmIc7CSXNRTjzfdvJ9RpfBc2FOBR3plEsH2yi3b/FA==
Subject: Re: [PATCH v3 0/4] rpmsg: char: introduce the rpmsg-raw channel
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20210701090413.3104-1-arnaud.pouliquen@foss.st.com>
From:   Julien Massot <julien.massot@iot.bzh>
Message-ID: <a38575b2-f025-4c26-2d94-c1bbdc304f9d@iot.bzh>
Date:   Fri, 2 Jul 2021 11:59:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701090413.3104-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

> 
> How to test it:
>    - This series can be applied on git/andersson/remoteproc.git for-next branch (7486f29e5e60)
>      + the "Restructure the rpmsg char to decorrelate the control part" series[3]
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
> [2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=505873
> [3] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793Just did test this patchset v3 again. With the same protocol

Works for me, /dev/rpmsg0 is created on NS announcement, and removed when stopping the remote processor.
I can do a repeated series of open /read/write/close, and got EBUSY if I try to open it more than once
at a time.

Firmware used for testing is derived from:
https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc/openamp_rsc_table
with:
#define RPMSG_CHAN_NAME "rpmsg-raw"

Thanks Arnaud for your work.

Tested-by: Julien Massot <julien.massot@iot.bzh>
-- 
Julien Massot [IoT.bzh]
