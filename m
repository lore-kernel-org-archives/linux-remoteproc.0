Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4597C54EE9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Sep 2022 13:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbiIMN6i (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Sep 2022 09:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbiIMN6f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Sep 2022 09:58:35 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E984BA5A
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Sep 2022 06:58:32 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id c22-20020a4a4f16000000b00474a44441c8so1914809oob.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Sep 2022 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=j4b3AwKXnbNOc68U591Ba49SYpbjEmsPStwHugruFXY=;
        b=IY8xOwXpGjE0SdIJPzybMxmP4m2T8KAbKGM7JrPns4diuJRzQQdTrR9uBMLZMZ1lZO
         K/HcgHm2G7ER+vdjQDjBa7FWLUTbtkNCQz2jT5oIF9qIbknckvE+l63mEgLKqMIJlf5J
         fC+8+JnPKboKqHH/11hZPFYExWokI2U45amkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=j4b3AwKXnbNOc68U591Ba49SYpbjEmsPStwHugruFXY=;
        b=zbv4KrUcGIcEzPShbTu2/DMKt3f9K6c4eKnjFuP1lKQoMVAeNjtl576c9L71PW7cPK
         77yA8fX5Q2Aq+rsQkfzv8Uk/ZJHML0Y2dy8mPGIw8Dy44cWoA4TTZHu0079tRyICSzhx
         ObRI4NBw5UOcMAj5PKLpPKQbmDSQhmUtszsIrIcYH2F8g0F+aKnt08qrygZCuE5T3wap
         lk9jH6Is+FVntZuqyeChxGfAAuYEl+WyekfiJHyyUW5j5TGH8ynt1PfSwKHAmOdVSBl6
         JT4evxEwa8qJ3wktwVdee1C0y8pJvrJwXyeaMlcB2jdPEZba7fyCiOQR/9R3MtL3w2TL
         gZXg==
X-Gm-Message-State: ACgBeo1F73STPHljOUzCLGnh2owvXnBv+/ypqvCD0i0HSyzD6KN4qBy/
        925pxIdK0rvUIk3R/itMDnYUwA==
X-Google-Smtp-Source: AA6agR6Tr6upEAKirqfcck1pCLrIPjxxEXBfXhURgmYde0fXkAmfIiiM2LtbTbWlyIGlUU6Bd09Etg==
X-Received: by 2002:a4a:8e81:0:b0:475:811f:3f9e with SMTP id p1-20020a4a8e81000000b00475811f3f9emr2603836ook.35.1663077511837;
        Tue, 13 Sep 2022 06:58:31 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id k26-20020a056808069a00b0033a11fcb23bsm5212658oig.27.2022.09.13.06.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 06:58:31 -0700 (PDT)
Message-ID: <f2fa19a1-4854-b270-0776-38993dece03f@ieee.org>
Date:   Tue, 13 Sep 2022 08:58:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Make QMI message rules const
Content-Language: en-US
To:     Jeff Johnson <quic_jjohnson@quicinc.com>,
        Alex Elder <elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Kalle Valo <kvalo@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 9/12/22 6:25 PM, Jeff Johnson wrote:
> Change ff6d365898d ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules to be
> const. So now update the definitions in the various client to take
> advantage of this. Patches for ath10k and ath11k were perviously sent
> separately.

I have had this on my "to-do list" for ages.
The commit you mention updates the code to be
explicit about not modifying this data, which
is great.

I scanned over the changes, and I assume that
all you did was make every object having the
qmi_elem_info structure type be defined as
constant.

Why aren't you changing the "ei_array" field in
the qmi_elem_info structure to be const?  Or the
"ei" field of the qmi_msg_handler structure?  And
the qmi_response_type_v01_ei array (and so on)?

I like what you're doing, but can you comment
on what your plans are beyond this series?
Do you intend to make the rest of these fields
const?

Thanks.

					-Alex

> This series depends upon:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=ff6d365898d4d31bd557954c7fc53f38977b491c
> 
> This is in the for-next banch of:
> git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
> 
> Hence this series is also based upon that tree/branch.
> 
> Jeff Johnson (4):
>    net: ipa: Make QMI message rules const
>    remoteproc: sysmon: Make QMI message rules const
>    slimbus: qcom-ngd-ctrl: Make QMI message rules const
>    soc: qcom: pdr: Make QMI message rules const
> 
>   drivers/net/ipa/ipa_qmi_msg.c    | 20 ++++++++++----------
>   drivers/net/ipa/ipa_qmi_msg.h    | 20 ++++++++++----------
>   drivers/remoteproc/qcom_sysmon.c |  8 ++++----
>   drivers/slimbus/qcom-ngd-ctrl.c  |  8 ++++----
>   drivers/soc/qcom/pdr_internal.h  | 20 ++++++++++----------
>   5 files changed, 38 insertions(+), 38 deletions(-)
> 

