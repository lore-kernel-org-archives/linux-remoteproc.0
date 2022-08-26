Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E904EECAAD2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Aug 2022 06:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241159AbiHZGT1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Aug 2022 02:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244864AbiHZGTY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Aug 2022 02:19:24 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D025B940C
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Aug 2022 23:19:22 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m3so725853lfg.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Aug 2022 23:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=IWS8JKWz75o/tyFJVlcO0u3nY2nMGgxlstXU+vNhUYY=;
        b=PTOX4eZo3au7x2ua0rwkqeVyPaYl1sms+TYrAkEO5uQdVHn8e43gb7K/YH3QOioTIT
         vYZ4ipsviVMQDruLeDkFaj3ZyVUxZc+V8J37aJiYlOp/xWqeoyhAhclnZP/rZsBlsehH
         qQRBefEbYs0HQP9vl7vLqXmzGbtlk+UOZ2iJ6QPRel0Ii5cbKJt2+5u1UB8nSqaA6Z99
         4R56+Y6xfFowmnvg7whmI7ggQTioviUFGaeONEP8IglZW+j8TlTEkXxl9RGMVuHUh7e9
         I1R+KnAj+nxgDbFVWjbDznUlcPnyXVgu5DrFs01AuRlXoa3Pjf9NtOpdp6UD/0J8LeQt
         fYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=IWS8JKWz75o/tyFJVlcO0u3nY2nMGgxlstXU+vNhUYY=;
        b=Y1n8miQ27e9vm4pLjJgpkpk7OylBGq+0YaV8Q5wSLjkvu/OdBW15QyLr+t3sUsJKYx
         VdTMBhNmqSgEtSN+FgoYoVB8Fo05LYI7T8ze/bFSK2wFErzpZvbXpqsr5VqnHflWYiHF
         l2StW/+58p5yIbgh6nKZdGtksSSyf75Yld6GWEFW/jTkFxT5Xg7AC9tyG9KSrez8xe3e
         nDa447yMOF0LXUyV+haCFVmM4ytbHsMS3DkNHrES/1O6RV7CCN7poHvzP0uGn79D5uv1
         MGTEMIQbq9rT/Mn2Anuig71NIEr/ZwHp82PeXGP3fZv2kOounLOL4gXUTwSnkLUSlLdM
         2yqg==
X-Gm-Message-State: ACgBeo31mhUTdHNersLZvu7jpJXkpPje6Qq2etWW+2bd0x+KyoRod7+z
        QriLWuamQMjvx0vOEmiNsxIb/A==
X-Google-Smtp-Source: AA6agR4EGgyGn1ent3TwSlY5F52Gh3VviAOmzGSwXgW4lFYhiNuN7BSGLZIdYaDikQzy1JSZqF+/TQ==
X-Received: by 2002:a19:7714:0:b0:492:df83:8a0b with SMTP id s20-20020a197714000000b00492df838a0bmr1882594lfc.104.1661494760801;
        Thu, 25 Aug 2022 23:19:20 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id c26-20020a05651200da00b0048b1d92991asm240700lfp.303.2022.08.25.23.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 23:19:18 -0700 (PDT)
Message-ID: <15a997b2-966b-3a6f-aa75-3a21b268351d@linaro.org>
Date:   Fri, 26 Aug 2022 09:19:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: Add missing
 (unevaluated|additional)Properties on child nodes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220823145649.3118479-10-robh@kernel.org>
 <1491c83f-cd75-4de3-ec26-86db4adb2ade@linaro.org>
 <CAL_JsqJx1s5ez-ojP8ZK_MPBWuuLRyekjK1qhHd6Ezaimna8JQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqJx1s5ez-ojP8ZK_MPBWuuLRyekjK1qhHd6Ezaimna8JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 25/08/2022 16:13, Rob Herring wrote:
> On Thu, Aug 25, 2022 at 3:23 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 23/08/2022 17:56, Rob Herring wrote:
>>> In order to ensure only documented properties are present, node schemas
>>> must have unevaluatedProperties or additionalProperties set to false
>>> (typically).
>>>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  .../devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml      | 1 +
>>>  .../devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml      | 1 +
>>>  .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml     | 1 +
>>>  3 files changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
>>> index e76c861165dd..e4a7da8020f4 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
>>> @@ -140,6 +140,7 @@ properties:
>>>
>>>    glink-edge:
>>>      $ref: qcom,glink-edge.yaml#
>>> +    unevaluatedProperties: false
>>
>> Is it actually needed? The qcom,glink-edge.yaml has
>> additionalProperties:false, so I expect it to complain if anything
>> appears here.
> 
> Perhaps not, but I'm trying to come up with a meta-schema to check
> these though I'm not sure I can get to no warnings which is how I
> found all these cases. The main remaining warnings are bus child node
> pattern schemas which can perhaps be handled with
> 'additionalProperties: true'. The rule I have says if properties or
> patternProperties is present then unevaluatedProperties or
> additionalProperties must be. To handle this case, I think we'd have
> to walk the $ref and check it.
> 
> Anyways, we can hold off on this one until when and if there's a
> meta-schema in place.

For me adding unevaluatedProp:false everywhere with $ref is okay and it
makes the code easier to read - no need to dive into referenced schema
to remember if it allows or does not allow additional properties. It is
also a safer choice if referenced schema forgot to set additionalProp:false.

However if referenced schema has additionalProp:false, then
unevaluatedProp:false here is redundant and question is whether the
redundancy is worth additional readability/obviousness.

To me, unevaluatedProp:false here would during review save time - no
need to jump into referenced schema to check what is there. If we make
it a rule / coding convention, then I am in.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
