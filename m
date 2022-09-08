Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000AFC6FA86
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Sep 2022 08:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbiIHIPb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Sep 2022 04:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbiIHIPP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Sep 2022 04:15:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A7C5209C
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Sep 2022 01:15:12 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bq23so26460681lfb.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Sep 2022 01:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=muuQhF45OaZyOm2z0HExOTDo4sMVAdp7hFpvyqoWEhw=;
        b=yPOvXpA1AHiFmr76cRX05B7gRZhuVGVWGDUIu//IKV6IO+JJN0vBDaIFkbdYB3GpSa
         XgcF6Gsyz8mqcdlizzur5nu+ok1MzQdN2p1+pqkbBFKnOKqLxXKcwQReZ11Vc6Fu/7+I
         qReST3geYLV3pXw8whw3+nKGQiN5SiFdfy163WLB9KfcNWaiW8Iw7D1sSQXGqd3O7vb+
         XjXqsG8IltrdpGCLSE0thqt4gq826HTFL0LF0jQQoNpMtTKsvb9zlJq2cFAU88l8Hzua
         f4XbF/DIoNB/JJQu2uaCBjLHOCsKOnXt/BJMqCokwf0umRzAuXwjlc4pcsxIEUOCwZCW
         voXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=muuQhF45OaZyOm2z0HExOTDo4sMVAdp7hFpvyqoWEhw=;
        b=sPTc0lTDQLlSutpPS9lAwLIZMrA5yDpkk4YROUIUmSWVdHbhLJPeY3aIEfPyydGW/K
         wEb4ZKR7OsmBGr8adz2zD9qN+q1VkGXGsIygI1pgwICIQGQxq5eHKTYIpLusT53t3cyb
         6Yd1Bh/RDOoNzrAvwfm57W/Wufkbdw/l/Sc9ZCeYNm/iKOA6qpUS2F9NQBCRwAm+nHFl
         tCKTXrfXopikIvgUMD9SXzqAbuRKM8oF/GBY44dvkopmXcvJXr1PzTBLSDzlec1iQWOM
         o3vzIZyacONuaegaczcQUestdGjp0+oPZOsTrYyQwczEP8UckmugRN22Xg0VdCxpNLbs
         FFJw==
X-Gm-Message-State: ACgBeo2jniC4ZSHJQsBnURtoZhLf8VTvr3zJTbWmK6q1xWHSLsX/RmGj
        JSvw+yNzzsn0/A93X60SPN7UaQ==
X-Google-Smtp-Source: AA6agR64n9V3ybonaiISQL54ikiAnmjYfX77MVIMYZZLkqFQRy4af8ei8POYGFVzSCQmLsWLpUbl/w==
X-Received: by 2002:a05:6512:909:b0:48b:954c:8e23 with SMTP id e9-20020a056512090900b0048b954c8e23mr2641912lft.670.1662624910531;
        Thu, 08 Sep 2022 01:15:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512215100b0048b17852938sm58671lfr.162.2022.09.08.01.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 01:15:09 -0700 (PDT)
Message-ID: <9abc956f-17c7-60c9-4672-d62fe581f516@linaro.org>
Date:   Thu, 8 Sep 2022 10:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFT PATCH v2 02/17] dt-bindings: mfd: qcom,tcsr: add QCS404
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
 <20220817145901.865977-3-krzysztof.kozlowski@linaro.org>
 <YxmetuNRIgDhutKv@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxmetuNRIgDhutKv@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08/09/2022 09:50, Lee Jones wrote:
> On Wed, 17 Aug 2022, Krzysztof Kozlowski wrote:
> 
>> Document new QCS404 TCSR compatible.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Merge conflict.  Please rebase.

I will rebase. Can you check if you pushed your tree? I see updates 3
weeks ago here:
https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/


Best regards,
Krzysztof
