Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C33C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 17:35:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BA3960203
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 17:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238595AbhBDRe6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Feb 2021 12:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238576AbhBDRdj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:33:39 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F540C0613D6
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 Feb 2021 09:32:59 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id m20so3291101ilj.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Feb 2021 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p0Q2uFdsPG2m597Q9FFih/IKz1kEOh3l14NqTe6ccy4=;
        b=mdksKdq/c8ZM+W9H8aGvPmb5nCMKi5nzFzgGAZFAhYG0HUWHHDvDk5YacZq1DW2tbb
         oGNN62OhAkyE7P7DwhJIZLi2s3rJpelS0iwJfYZvAF1DLAxnWC6yA2IKsVHIxXHHcdn3
         LPaIwsSoDEoz0THRbJDJW+cw4YBo68ZbticCnLZGiT5eW32sMvKmaU+DgC43Sg3YY073
         lZsNWWTQ38AHLjKPxHNFi3VnRUEy8R66m4v1d+7WUufuwNr+WN1pMit+ZEUHgXu60vkD
         pWGJ9SxVdk167I+UX/iMc0axVDA3SOlaaR0ofMxQVBJ2c84hSpPDadOyVf/mjajkbUGl
         nxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p0Q2uFdsPG2m597Q9FFih/IKz1kEOh3l14NqTe6ccy4=;
        b=CBb0PLVF16EXlQqWeEn6Mv0gvCoAkiA42UAH2VO0Nh92tJElS/mIt69QxOgrikMjKC
         jvNypSAvLu1myBHcYYJ7Vi837C5i9npGmrxetzkKwun3VCZN4t1TqRDwv3/jI3nT4mK6
         kT6S0yVMpVdXCE48sEs1FV+HtiAvZbNMuKLow+VlDFHQcNdiMxTFL20KSKHOOMO3Rq43
         2/Edbib4WGNWt3tHfT/Igu1rGCIbSkgKDn6GuvbwFjJ6mx52JpQLafQMHZsqm9MfrfD1
         I4H3fZJha3+DCX4j4T8Qv3loIAZBYJu22vcsSwNlpEepjJdHfk0zYsy+EqLa3YPHmXVU
         pnKw==
X-Gm-Message-State: AOAM5330oXwoQ/IclbwJL5k/MljG0lkoRJLaJVLWrsOvLOpC6Jiwer+d
        /MW//xv/QSZoUUgZRYBVkwBOtA==
X-Google-Smtp-Source: ABdhPJxxHBTxw1u7BUN3/k+DkEdi8I+kF9ikRlGjWN8uogW9/4ZZnAtUFf1/kEs7CZfVkcXigtO84w==
X-Received: by 2002:a92:ab0d:: with SMTP id v13mr169165ilh.119.1612459978950;
        Thu, 04 Feb 2021 09:32:58 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x7sm2959431ioa.48.2021.02.04.09.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 09:32:58 -0800 (PST)
Subject: Re: [PATCH] remoteproc: qcom: fix glink dependencies
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <clew@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>, Suman Anna <s-anna@ti.com>,
        "Andrew F. Davis" <afd@ti.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Colin Ian King <colin.king@canonical.com>,
        linux-remoteproc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210204154010.1585457-1-arnd@kernel.org>
 <c326e5c8-e394-88bc-24f4-4dd8e246db3c@linaro.org>
 <CAK8P3a24WPVX3t4_X=muLfYUXtK6UOOHATrLQT3y_tWSb2XYrQ@mail.gmail.com>
From:   Alex Elder <elder@linaro.org>
Message-ID: <6fa5b9ca-8afd-e6f6-84ed-1e87d3a3c95f@linaro.org>
Date:   Thu, 4 Feb 2021 11:32:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a24WPVX3t4_X=muLfYUXtK6UOOHATrLQT3y_tWSb2XYrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2/4/21 11:16 AM, Arnd Bergmann wrote:
> On Thu, Feb 4, 2021 at 5:16 PM Alex Elder <elder@linaro.org> wrote:
>>
>> On 2/4/21 9:40 AM, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> Building the remoteproc drivers into the kernel while the qcom_glink
>>> code is in a loadable module results in a link error:
>>>
>>> ld.lld: error: undefined symbol: qcom_glink_ssr_notify
>>>>>> referenced by vmlinux.o:(glink_subdev_unprepare)
>>>
>>> Add a Kconfig dependency to avoid this.
>>
>> So if they're incompatible in that way it's declared in the
>> header but not defined in the kernel so the link fails.
>>
>> And at issue is anything that calls qcom_add_glink_subdev(),
>> which is qcom_q6v5_{adsp,mss,pas,wcss}.c, and those are
>> selected by CONFIG_QCOM_Q6V5_{ADSP,MSS,PAS,WCSS}.
>>
>> But I don't see why QCOM_WCNSS_PIL needs the dependency.
>>
>> Can you explain that?  Other that that this looks good
>> to me (and I'll offer reviewed-by with your response).
> 
> The problem is that QCOM_WCNSS_PIL selects
> QCOM_RPROC_COMMON, so qcom_common.o is built-in
> whenever QCOM_WCNSS_PIL=y, and this will lead to the
> same link failure, regardless of whether the function is needed
> or not.

Thanks for the explanation.  Maybe that is something
than get fixed, maybe not.

Reviewed-by: Alex Elder <elder@linaro.org>

>        Arnd
> 

