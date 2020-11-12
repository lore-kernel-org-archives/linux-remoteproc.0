Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E3FC55ABD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 18:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A55FB22248
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 18:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="bpKjXi1W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgKLSAe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 Nov 2020 13:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgKLSA1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Nov 2020 13:00:27 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36862C0613D4
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 10:00:27 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id m13so7345140oih.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uNJ5eMTuI/eF0JED79RYDzkiBDvoiLGjhKrBZ4BVH/g=;
        b=bpKjXi1W+7OBeRaFRnHuyva7vt7de03EhDO4l1KRgRfsi4PR8atG2KPUgUW0C3S+P2
         4Fc3rBhV60E4AART4sG84XPoyL02q2a51kJsRXE9ay5zj7XqXvm33BgwFm1bD5mJ+jIw
         ML/xM/X4NqJH2p6C4rDMO+0tUliuifjXr54gXESFza2avo4Fyiw0V6VvrpThJNObWwUw
         nblbiFSFY1pQ6VmkB5QKgtA0J9nikuLzCAcRxhXf7zVieYUvpEcluI4AL/UpA30s5+eQ
         DxQYMvxZG+32e3Xkqtsf7QNfdTHCUwgttkjFYReNs+f2IUzE927yxatxZDrEhwhPQ/tt
         1A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uNJ5eMTuI/eF0JED79RYDzkiBDvoiLGjhKrBZ4BVH/g=;
        b=nL5b+T9UhkRbtyGsIu7w0PdFTjp8otC2kvvdnBtXdrqVtOp9DODR4WIYq1vnnUQAme
         ClmHerjtCoHnZ8zTSVY2RKuzCBVKuUuP4MgJ0egUnQWCSLZATPYK4JTRt8AGGdRM02UJ
         4vl6syqRa9e5jfEQWCyjnv0IOnSrKvZ1TH35uUQMnh10rV3MhbhPZXNPeNNBh6ps60IC
         jMjW9jRfM9Ty9BHc8x9FM8xm5tVK110068TOHbJvSDQTxDVTiQRr1lGx7nqneWqk810W
         5+ll0SBWxkXQif4ubGqo/qEmxDEXcYk05T+89NXd0B10qhuFGJh1+nPa6acaybyh4tXB
         Va7A==
X-Gm-Message-State: AOAM532V06C7a2aVa4wOWW1g9kqXOWoxGUd2fRSI7z2f2/DKP4r8JB9+
        jxzbEC236Oq2uMkUjloXBptSpw==
X-Google-Smtp-Source: ABdhPJzmasViwKQcggqVMiR+zuDeXJk1dwXzg05U2KJzVyPiW8p1HperM2EU+rRnO+PKHbvjs4NXUw==
X-Received: by 2002:aca:6004:: with SMTP id u4mr703107oib.8.1605204026605;
        Thu, 12 Nov 2020 10:00:26 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id k13sm1397131ooi.41.2020.11.12.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 10:00:25 -0800 (PST)
Subject: Re: [PATCH v2 0/4] remoteproc: Improvement for the Qualcomm sysmon
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <71bd287c-a48a-11db-354f-0aee07ba2eeb@kali.org>
Date:   Thu, 12 Nov 2020 12:00:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 11/4/20 10:50 PM, Bjorn Andersson wrote:
> The core part of this series is the update to the sysmon driver to ensure that
> notifications sent to the remote processor are consistent and always present
> valid state transitions.
>
> In testing this I finally took the time to fix up the issue of the SMP2P based
> graceful shutdown in the remoteproc drivers always timing out if sysmon has
> already successfully shut down the remote processor.
>
> Bjorn Andersson (4):
>   remoteproc: sysmon: Ensure remote notification ordering
>   remoteproc: sysmon: Expose the shutdown result
>   remoteproc: qcom: q6v5: Query sysmon before graceful shutdown
>   remoteproc: sysmon: Improve error messages
>
>  drivers/remoteproc/qcom_common.h    |   6 ++
>  drivers/remoteproc/qcom_q6v5.c      |   8 +-
>  drivers/remoteproc/qcom_q6v5.h      |   3 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c |   2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |   2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  |   2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c |   2 +-
>  drivers/remoteproc/qcom_sysmon.c    | 121 +++++++++++++++++++++-------
>  8 files changed, 109 insertions(+), 37 deletions(-)
>
Entire series tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

