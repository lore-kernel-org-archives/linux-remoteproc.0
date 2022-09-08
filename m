Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7C4C6FA86
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Sep 2022 15:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiIHPfN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Sep 2022 11:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiIHPfL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Sep 2022 11:35:11 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED736B8EA
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Sep 2022 08:35:08 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id y18so5614192ljh.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Sep 2022 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8OzZ5Qs/lq21s5oBO2au1T9ozqLApEhv1uI4lX4d/8Y=;
        b=ftozKavWAs025mUeUmoP4qVbN/G+5+94RV5cmOqszL8ZKl4bKVuc+ZBCpmvwz9SjVZ
         VcKK8LwgJJD2Fa8Yn4lij10yek+JTEBHuhC+6YYTb08TSWvRGH7aquE36sylSguDiq30
         gD8GVKVgOjyQGfyt0jEzRi257E7/8PJlSIuNjSNNqZbKq3SO+u5sJNoSq209Q1Aek5J9
         2JioNdMukgRUJIzc7lbxnJvKbHQezJlBXG3/l1xegEXpglBrGdd+MpEjybDI2sNFij1W
         WHYO3n+7bHUZ2gVBluwS0tms35S2pa1Hso6nIkmfQdrPpbsztglxtDeSkcxFhftwH2Po
         73jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8OzZ5Qs/lq21s5oBO2au1T9ozqLApEhv1uI4lX4d/8Y=;
        b=bsTJXhNdcgzYmYK2X2HQvo4jhWrtJC3PEOWBKE3OXV7uhGQRiAI1Lo8RTKx7U4b4yV
         mN1+8+q33qba4COKaUYOcLiUnSbnB9cKf7lbSS45iw+2mAV9bL38ZJe3ntuqAUNcRpcp
         p2W7jfX2FBL4SZEvYyX3X6qJkOPod/8hAOCPYmrR7/RjL2thJ83MM2WKjkN2miVGSAk+
         aHPdV8QCf4N26T8OcqV554Hsg5ryPg3bQpPVSoAzJFIb7HnHLKJFPA3gjYJMJjmNN8+h
         2qOTQu3Np0aUnvU9JfagpNwUctL8Z0daFuxXdlzE/135trnHJNRnv9Xhmu1lURtHzQDh
         0nMA==
X-Gm-Message-State: ACgBeo2AolFqgzNCE0iWb0YiSKot2mFTFX9KykmOozAsP7anFSNNd09r
        NKRoM2/4V5/c+Rx/E3HIERmTlPWMAJxZZQ==
X-Google-Smtp-Source: AA6agR4ghr1ypXn2wb8f2Ux4j27NXPtCXRt7D4eCpNLaE4gxTa/3rNmpCKFnlb2c1ixMLtT4uDnsQQ==
X-Received: by 2002:a2e:8749:0:b0:25e:4357:8ef7 with SMTP id q9-20020a2e8749000000b0025e43578ef7mr2811610ljj.319.1662651306929;
        Thu, 08 Sep 2022 08:35:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e4811000000b0026ad316375esm566887lja.38.2022.09.08.08.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 08:35:06 -0700 (PDT)
Message-ID: <e4337c1d-e579-a200-35c3-7ca9d0a0ba12@linaro.org>
Date:   Thu, 8 Sep 2022 17:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFT PATCH v2 02/17] dt-bindings: mfd: qcom,tcsr: add QCS404
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <9abc956f-17c7-60c9-4672-d62fe581f516@linaro.org>
In-Reply-To: <9abc956f-17c7-60c9-4672-d62fe581f516@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08/09/2022 10:15, Krzysztof Kozlowski wrote:
> On 08/09/2022 09:50, Lee Jones wrote:
>> On Wed, 17 Aug 2022, Krzysztof Kozlowski wrote:
>>
>>> Document new QCS404 TCSR compatible.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Merge conflict.  Please rebase.
> 
> I will rebase. Can you check if you pushed your tree? I see updates 3
> weeks ago here:
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/

It seems latest next also has your old tree from Aug 15, so on what
exactly I should rebase?

Best regards,
Krzysztof
