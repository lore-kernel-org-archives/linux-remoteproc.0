Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2393ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 16:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiIIQaV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbiIIQaT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 12:30:19 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32BC40E09
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 09:30:14 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s10so1852300ljp.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KS7Ek8iCN3lrgl4YnrQljjj+R07+91jXLXTWcqOkyNo=;
        b=CIJfHiBa9Gun3EcbV+AjzzytebfMe0I288IQ4TB1dgXBrMkio6UpCdO74mF1lZxQiy
         KNtr4ZEETiaHJPYB+JSh5NKxlfuRO1BSB0V75pSKViGoK12Ci+cb/UwnJqoGppP/5Kkt
         2cT3Vkb/9JmZaQ99r2PrcVKHCvk9sycYGjSM3Qkas8MTlZhwUN/esIcgJErhJPvHSw7H
         Xn1wyYv7FqH9SaLwwb1dJawAyR5PFCbYGsQfAAlaRFLamLFIZCADmGzRCwEYS310xtQg
         a8w4WLoUwZOR++kgk6X8lDWGIKKqV0IJmfTe0botCFmOn3JSM2mObegzxkce5/qEjCcE
         PXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KS7Ek8iCN3lrgl4YnrQljjj+R07+91jXLXTWcqOkyNo=;
        b=tnR8XUwQdh6ChmwFm2knPzEKUxUoVUgpepq9jsBWIivMN1wfAJ70nAmk4o5lem6cAT
         L2ulr1w9q7CJDrmtvnuwS8+sSw6SkGDIxqkMvSu6YhM9VHK9fNFLDIMBw30jdcKZdu9k
         vegYscyXN7YHNefuSSftYUO3g8xsFdUvbniyRd2JRkfhqPCth/6m4fC9R8aAyHacJjAj
         9q5oMo84VzcXFmtGJsyO0Gxc+2CPWr6ZCVFnchU2YOZJCA3ecGwfz019cVMSnNavSY8F
         nqcg7nE6ZOyxQ2q+2pasNjmkwJFqkwHqprswvkA4yOAevOsqvRcs5pcTo53ijZmOQQv1
         F3LQ==
X-Gm-Message-State: ACgBeo2FWq1IQbuQkxUURrN3aJYvomYyRA2dGQNkzstfXObmDF9/xBSS
        hdhCRLZx398lDMVx0vGJljzlmg==
X-Google-Smtp-Source: AA6agR5w4gFACKfJPJ3tzC07YwCiKgef6NFVfH2ae44Tqx4vvxcBvLlpPsXfVflocWv30PxupwXH6w==
X-Received: by 2002:a2e:8e90:0:b0:264:65ed:8c14 with SMTP id z16-20020a2e8e90000000b0026465ed8c14mr4027803ljk.24.1662741012858;
        Fri, 09 Sep 2022 09:30:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y24-20020a199158000000b00498f67cbfa9sm145231lfj.22.2022.09.09.09.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:30:12 -0700 (PDT)
Message-ID: <0b6f5b4b-247e-7573-04fd-05d037533aa3@linaro.org>
Date:   Fri, 9 Sep 2022 18:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
 <20220909161652.GA1448908-robh@kernel.org>
 <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/09/2022 18:22, Rob Herring wrote:
> On Fri, Sep 9, 2022 at 11:16 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Thu, 08 Sep 2022 20:14:32 +0200, Stephan Gerhold wrote:
>>> Similar to qcom,glink-edge.yaml the smd-edge can also contain
>>> apr/fastrpc nodes for functionality exposed by the modem or audio DSP.
>>>
>>> These nodes are already used in existing device trees, adding them
>>> fixes the following dtbs_check warnings after converting
>>> qcom,msm8916-mss-pil to DT schema:
>>>
>>> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: smd-edge:
>>> Unevaluated properties are not allowed ('fastrpc' was unexpected)
>>>   From schema: remoteproc/qcom,msm8916-mss-pil.yaml
>>>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
>>> ---
>>> Since qcom,fastrpc.yaml only exists in Rob's tree right now and
>>> a similar change for qcom,glink-edge.yaml was applied there it is
>>> probably easiest if this patch goes through Rob's tree as well.
>>> ---
>>>  .../devicetree/bindings/remoteproc/qcom,smd-edge.yaml  | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>
>> Applied, thanks!
> 
> And dropped for Krzysztof's series instead.

Technically Stephan was first and his patch solves it in partial way,
yet still self-contained way. I am fine rebasing my patchset on top of it.

Best regards,
Krzysztof
