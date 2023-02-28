Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E253C64ED6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Feb 2023 19:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjB1TmX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Feb 2023 14:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjB1TmW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Feb 2023 14:42:22 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09593344D
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Feb 2023 11:42:18 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id z5so11506921ljc.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Feb 2023 11:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677613337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMgz+8i9lDRHkxwEIJDwxwFLj+KDr4M+MCf3M/7tTJM=;
        b=fnVIH66A+T4loHjEJBk1eiwVsFWwySA0EjMRv4mNph/d634x+vZzQ1t1ZXX13PZK+A
         lleZg6r6viA8nRna6Mky0+OOpu/CZbfDb5FukQBWRhQ7h2r2QCkW2PaXPrpBnMtmVp6p
         MO2O2n0KmmOBAIGwNoOv7yDQ3GMdGfYW5ZOUuSnO475AnuGBTOgSPoDFmbRHiY3igDxV
         C+6DWEYACQ4h3cx/Y43Gial10PkcLiH2ghVSsaFHZVidKovbKEh5Fne9vwBaAGhG47WS
         AeeWx4qwR+cXNGXv78VuUfpYPsViDVz515M8Bfk4OaJ+wiYovt31AIVDEs7yABO767jA
         iOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677613337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMgz+8i9lDRHkxwEIJDwxwFLj+KDr4M+MCf3M/7tTJM=;
        b=ktlpxeBOSMZBsV6W0TN0Ct1Shjg8K/rfqJbTKYDbMYItmzoXC+DSPVgAN1XOYZRWjk
         5E8sgdltR3tYLoxCiYqkoNtHu9wLKYnOgWG3fUihjoY/3kEyNKKptSsDGZgjOCs1zQJD
         QTBnf9sMPh9hw+RWGm7EucvZy8cG6hmwNMwaNVa2Ht4Qi9Gvh2Dr3go1y7yCRZRJowQw
         86qK98Ot0k6OZciiNOwTdc0XpsVbhFQiRnrUseOLeaBmD95OQB35yFPUWH4rsH3nKZHb
         NGp3tHb0syOM8xbuVEvBjTzKGae9xY9rqbL9vYom2WTsMFYV793cG64fkaA8GxC2CscJ
         wv2A==
X-Gm-Message-State: AO0yUKWvUABraQDslPsWwNcKq3yGn6uTgE2R2T4n8Issy5ZaKVal3Wvj
        ZYMz9eXcxd3EzaTNZTt7cEbUqA==
X-Google-Smtp-Source: AK7set/YlENBCLqy77hHQCs4r1R/UVJNkdC2/9KL96Gc9ETxmc68JgoSYc5bsjJctCMiQPe+e97TMg==
X-Received: by 2002:a2e:3510:0:b0:295:a391:7b48 with SMTP id z16-20020a2e3510000000b00295a3917b48mr1149818ljz.26.1677613336957;
        Tue, 28 Feb 2023 11:42:16 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id p5-20020a2ea405000000b00295a2d07558sm1328602ljn.112.2023.02.28.11.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 11:42:16 -0800 (PST)
Message-ID: <b280c6a5-04dc-8a4f-459c-4703e567fa1d@linaro.org>
Date:   Tue, 28 Feb 2023 20:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V5 0/3] rpmsg signaling/flowcontrol patches
Content-Language: en-US
To:     Sarannya S <quic_sarannya@quicinc.com>, quic_bjorande@quicinc.com,
        arnaud.pouliquen@foss.st.com, swboyd@chromium.org,
        quic_clew@quicinc.com, mathieu.poirier@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <1676995418-19358-1-git-send-email-quic_sarannya@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1676995418-19358-1-git-send-email-quic_sarannya@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 21.02.2023 17:03, Sarannya S wrote:
> Added two new RPMSG IOCTLs for rpmsg_char- RPMSG_GET_SIGNAL_IOCTRL and
> RPMSG_SET_SIGNAL_IOCTRL, to set/get the flow.
> Addressed review comments for changing variable names/ desciptions.
> 
Hi, your changes mostly don't apply on -next-20230228, please rebase
them. Not sure if I didn't miss anything, but I did it locally to test
this [1]. My Wi-Fi chip on SM6375 seems to send quite some signals calls
and applying this series got rid of "unhandled rx cmd: 15" and the
corresponding timeouts.

Also, please consider using b4 [2] for sending patches, you only sent
them to a couple of people and it didn't even reach patchwork..

Konrad

[1] https://github.com/SoMainline/linux/commits/signals_rebase
[2] https://b4.docs.kernel.org/en/latest/contributor/overview.html
> Sarannya S (3):
>   rpmsg: core: Add signal API support
>   rpmsg: glink: Add support to handle signals command
>   rpmsg: char: Add RPMSG GET/SET SIGNAL IOCTL support
> 
>  drivers/rpmsg/qcom_glink_native.c | 63 +++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_char.c        | 58 ++++++++++++++++++++++++++++++-----
>  drivers/rpmsg/rpmsg_core.c        | 20 +++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  2 ++
>  include/linux/rpmsg.h             | 15 ++++++++++
>  include/uapi/linux/rpmsg.h        | 12 +++++++-
>  6 files changed, 162 insertions(+), 8 deletions(-)
> 
