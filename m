Return-Path: <SRS0=6AeO=56=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18480C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Apr 2020 12:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0D3F2076D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Apr 2020 12:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VOfdVdO0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501937AbgDNM1W (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Apr 2020 08:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2501927AbgDNM1N (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 08:27:13 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5F0C061A0F
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 05:27:13 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id f19so12978873iog.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 05:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lZl+SzAixlt/zspP8CIXqhi3WqXdw0DhseejXVx44uY=;
        b=VOfdVdO0snAnBN6PceKWVDGj0o/mgGh/ur/Um8PrvA7IfdIXAgOxCId+c3VbdU5mV5
         PFRg/STwB6ik9vzkbJ1cfkSgux3Ytvw8HeqrbGldySqfVxRhLOyviptUgCrE6qB7s44A
         WI3zG5XJsIrZQkFxy2sWjMIXWvSBe9KF3i7D1FyEQwDGIFDhnDnYS1vi+ZMmnMeK6hpt
         55M+qVYhnht8fgNf/bd8pkPuOivNm70zrAxljHbubeT0+envN4hB0KhMoQr5oNnZW+tg
         3s/pTW9bP0CGd6IbHWc9Z0HJwiCDyG6HTQw2WCbtSc21Rl2MhGwbTmr7bIcT85soZpfz
         7okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lZl+SzAixlt/zspP8CIXqhi3WqXdw0DhseejXVx44uY=;
        b=s66qXwB7DbDZPy5g3b7+lUTXd1pTRI4RUyzEDkukV/sbgBkvfxczxSuzeMV32BGCwl
         Xt7TORxXEvMdzRaeQO8D98VPuBaFGdiZM2nFpzNr0WSIxtv6h+hLEIMv5f17F2Xvw6IX
         Zd4behRxiSrkelB0n202ddxkHFpA+7cVIbrf1fysEXEkfVGMjlpTgq6oa4VdufExDG+B
         XjRzJRxWDlzjgF9kE5n0eMN0f2wf7XoWyTsf97+qJWvobhlsFKJlbM0fTdi4UmAYT26t
         nXSO8XJb2H+smK/L2hfe5XL9nXT7InMwNTMaq+wU392z4BeYJLd9iAv20gu2eaiO3oVE
         rtAA==
X-Gm-Message-State: AGi0PuaiUGNiASKv/bQpJLNLRy/Dk+nzpnBz62SubIRMr6yXSylk4wXo
        gwG7XOGS1un8dORLdhTI+cKX9A==
X-Google-Smtp-Source: APiQypLg83FQI9KhxvuPMipPhJMLS+L2BK8ZKU8Cd24vD3HTM/7oNStucxBWjFmryrVSK6IH9K5u6A==
X-Received: by 2002:a05:6602:1302:: with SMTP id h2mr21094447iov.186.1586867233023;
        Tue, 14 Apr 2020 05:27:13 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id s22sm1069084iow.40.2020.04.14.05.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 05:27:12 -0700 (PDT)
Subject: Re: [PATCH 1/4] remoteproc: Fix a bug in rproc_alloc()
To:     Markus Elfring <Markus.Elfring@web.de>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
References: <e459f807-4c61-257b-b7b5-dd767202c435@web.de>
From:   Alex Elder <elder@linaro.org>
Message-ID: <4b05d794-095b-7efe-c71c-42dca785ca49@linaro.org>
Date:   Tue, 14 Apr 2020 07:27:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e459f807-4c61-257b-b7b5-dd767202c435@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200414122714.HyGAIb0EltGfPMI8qLM8VYb6qtFamGN-8Ci5dthzCAE@z>

On 4/14/20 3:24 AM, Markus Elfring wrote:
>> I'm not actually sure this case causes an observable problem, but
>> it's incorrect.  Fix this by initializing the notifyids field before
>> calling ida_simple_get() in rproc_alloc().
> 
> I suggest to improve the commit message.
> 
> * Can the information “field initialisation” be more helpful than “bug”
>   in the patch subject?

No objection, though I personally would have spelled it
differently :)

> * Will the tag “Fixes” become relevant?

This bug was present when this code was first added.
Fixes: b5ab5e24e960 ("remoteproc: maintain a generic child device for each rproc")

Mathiew, feel free to add that.

					-Alex


> Regards,
> Markus
> 

