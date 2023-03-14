Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBB2C74A44
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Mar 2023 03:45:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCNDp6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Mar 2023 23:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjCNDp5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Mar 2023 23:45:57 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4C14392B
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Mar 2023 20:45:54 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id y2so14088188pjg.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Mar 2023 20:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678765554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vWfZOB/vp5s9CQfk70psxpuLfStVwAPuG8vm3AXMbVw=;
        b=A03pzeGi/87a/CEGd3BSGBnVCHjVSIdVFN+Y9dTEyPE/i9Pa10dPsNKQlQSHTq2dCj
         n5e42F9zsyGnyNOo7rHjtUuOWTFndoq0Y5DDkWkY4DxmmQo6yA+29YRuftpzgzFRlEDb
         QM6BTlbBh+NqHj8d9DbH2s24m/CWUvFc1Mf046Pwm9V2+tM+eW5FvguW6b7CQJ46IISr
         B7CoJJXGvhu7tHC62xJeQ0PkgNSEpF1YFok5FF6AMvVvuXn5yeyDLCr5vA7dC0/YpMWi
         isxD+FrtKUL68lF8oM0IAqlBR9ZwX466SC8vXxyrR3CQbOt1/DSxSN+TLolb/1BGwRvJ
         Sh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678765554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWfZOB/vp5s9CQfk70psxpuLfStVwAPuG8vm3AXMbVw=;
        b=LAzb0gU5adsgnvnkeBPMVwBjbOlpMAOPjJ+/RF+hwmeZQSd2id2xXOweBWaXaQpISc
         NKgQzpzue0KtbmKknnL+4gNYH1dMA5cw7s46nnpwkQhSawDsOYRUEzWa0AB8Wng+U7Vw
         0/3O3AujkjDL5KOBYA3wkQXjgN9sp41H8wl6VWuBw1fc/iIkcMt/w6SWBhjnEpbFlzBb
         uRf4aWRY+dMw4Bj9Wv6V2IKeaqFUUEfn1I37tU8DHuq0CoWXKy2897UdDDHIX6++6yc+
         zFYHXODtP0sukQ2b0hjRs9XPtxsqfm4iIfCFOcUeDp1GnQrTkqk2fSqmNTAaEACiRE+5
         ifGw==
X-Gm-Message-State: AO0yUKU/4b39J8EJKL1IN5GvPeHz9iKO93hWl/roVaRwIqWUw7uXkn1v
        A6GNnXDrzGXWdCOC7j3O2S0LWw==
X-Google-Smtp-Source: AK7set90GKcN+w/4U0AuRg6iPs6d/KGH/W2GMNH+vKFp9MJfkZOgAGYBvq4hKrg93Y9OMQ8+BoXuTg==
X-Received: by 2002:a05:6a20:1609:b0:cc:d44a:bec2 with SMTP id l9-20020a056a20160900b000ccd44abec2mr42619757pzj.1.1678765553966;
        Mon, 13 Mar 2023 20:45:53 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c5e:4a3e:15d0:d540:3861:ef0e? ([2401:4900:1c5e:4a3e:15d0:d540:3861:ef0e])
        by smtp.gmail.com with ESMTPSA id k2-20020aa792c2000000b0056bc5ad4862sm452123pfa.28.2023.03.13.20.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 20:45:53 -0700 (PDT)
Message-ID: <55cb151e-b97f-43ee-e06f-63aaa376d6a4@linaro.org>
Date:   Tue, 14 Mar 2023 09:15:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: Add remoteproc nodes
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20230128054256.2100501-1-bhupesh.sharma@linaro.org>
 <5922cd55-060c-d1b1-0eb2-0875439e4268@linaro.org>
 <4b6df5f4-d5e5-30f4-dc1e-a8e5f8c66363@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <4b6df5f4-d5e5-30f4-dc1e-a8e5f8c66363@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 3/14/23 2:33 AM, Konrad Dybcio wrote:
> 
> 
> On 13.03.2023 21:58, Bhupesh Sharma wrote:
>> Hi Bjorn,
>>
>> On 1/28/23 11:12 AM, Bhupesh Sharma wrote:
>>> Add the adsp, cdsp and modem remoteproc nodes to sm6115.
>>>
>>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>> ---
>>> - Depends on the dt-binding and driver change submitted via [1].
>>> [1]. https://lore.kernel.org/linux-arm-msm/20230128053504.2099620-1-bhupesh.sharma@linaro.org
>>
>> Gentle Ping. Since the dependencies (dt-bindings and driver changes) have already been merged into linux-next, this patch can now be applied.
> Not really, it won't apply as-is. I suggest applying the version below
> which was rebased, the reg was adjusted for 64bit addressing and the
> -names were turned into vertical lists, I've been carrying it downstream
> for a while and can confirm it works - I even got Wi-Fi up on the Tab P11!
> 
> https://github.com/SoMainline/linux/commit/a34e0bf410318b573820254bd241fef0ea013ea1.patch
> 
> (this is a git am-able plaintext patchfile)

Please send out your version for review, without which remoteproc is 
currently not functional on SM6115 / SM4250 SoC based boards.

Thanks,
Bhupesh
