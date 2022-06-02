Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29591C43334
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Jun 2022 06:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbiFBG4z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Jun 2022 02:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbiFBG4u (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Jun 2022 02:56:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D5117C6B5
        for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jun 2022 23:56:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id fd25so5044951edb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jun 2022 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LLNT8sk8dg3VHgneMHOABUvZlztHfMnZmFwZtkukw1U=;
        b=eLk3Bz/WOkMAC5yq5sJ5oMDUivEuokRtM1ySrtMWvKp4Y4BziELJT2taA3PP2bm8qP
         UeMVFSoOT2Lt0CYHMve/e6VXkxGETxONlpWqtrhx3Wa5lK+5FjyM02d9aCc86zRkiebT
         JrxjbIy2gXE2FG3QsMt+FcOYCB4ZcTH8cqgu0cEFlQ2NWz0DXQEp6JdGDrlnB0ryNfrS
         A3dma775dm5cMh8pzel72tFzw8NfIFcnvhMRqv1YYnGmEZ2ZZyrjxOytVeNmG/5I3jyp
         6v5M28Cp2+zZKNspCKqrvZ94YSSKgt8grtqEusmCea4sBx0n7ZcRzMBDbnXAV8cmR3tC
         y4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LLNT8sk8dg3VHgneMHOABUvZlztHfMnZmFwZtkukw1U=;
        b=mT+MlPIQ0OGf1+3xZZ5gJt1FN7NDaqh/iG16OPOdkJ9w/CibLFZy5W+9jOXfyeTL3r
         b7x7rBHA3g0S/gFvWLvx5wwy1fx4gLK0Rbx3w8mwV6fNYnETONFb2l8gwh1jts6xex86
         u1eGfKR3YImIstXurWVW3MOzNiqhFlKoe+4pltcTo7XNqKL8e9qMrLhSDxrL/SN4Q34P
         na2HH89ILLvzON/JRMLMcpjmvEXhXGS1UUODLYIZ+ma8qYPbu0iMdWU7Mp+3T6FbSZT+
         BdQXk6zIElMoPH1s/wwVA7jd39FkTEDbYZbPKmiXYv0vedzamZfNxSWnuXz3J25o9hXP
         656g==
X-Gm-Message-State: AOAM530CaxYAQkLmUIISPBP8OsAGIwFBsspr6GO64czLDwdTNZAwBPOA
        xJRl6OCOJSuwM+3JnHzyC0BN9A==
X-Google-Smtp-Source: ABdhPJz1+2mpXym1k+JMKKxXiiS02WGQewk31DYid61d9z9HfjfO/qToqCsEwoJ0N1oEfO62KTycQg==
X-Received: by 2002:aa7:d1ce:0:b0:42d:cf0e:3389 with SMTP id g14-20020aa7d1ce000000b0042dcf0e3389mr3731445edp.4.1654153007050;
        Wed, 01 Jun 2022 23:56:47 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d10-20020a1709063cea00b006f3ef214e5bsm1428551ejh.193.2022.06.01.23.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:56:46 -0700 (PDT)
Message-ID: <be7c0ff9-e931-5a34-dfa3-f44071de71b1@linaro.org>
Date:   Thu, 2 Jun 2022 08:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 00/15] Add support for MT8195 SCP 2nd core
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Dustin L. Howett" <dustin@howett.net>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Brian Norris <briannorris@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <919ca8ee-4b01-e601-714c-26098647d5c7@linaro.org>
 <016eb93f0bee329c061725cb5096d49ab4240152.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <016eb93f0bee329c061725cb5096d49ab4240152.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 02/06/2022 05:52, Tinghan Shen wrote:
> Hi Krzysztof,
>  
> On Wed, 2022-06-01 at 13:46 +0200, Krzysztof Kozlowski wrote:
>> On 01/06/2022 13:21, Tinghan Shen wrote:
>>> The MT8195 System Companion Processor(SCP) is a dual-core RISC-V MCU.
>>> Current mediatek remoteproc driver only supports bring-up single core 
>>> SCP or the 1st core of a dual-core SCP. This series support to bring-up 
>>
>>       ^^ this or is confusing a bit.
>>
>> Does this mean that MT8195 has three RISC-V MCUs?
> 
> My intention is to express that current SCP driver supports bring-up,
> 1. the single core SCP, e.g. MT8183
> 2. the 1st core of dual-core SCP, e.g. MT8195
> 
> 
> Perhaps rewriting as follows is preferable?
> 
> "The mediatek remoteproc driver currently only allows bringing up a single 
> core SCP. It only supports bringing up the 1st core in SoCs with a dual-core SCP."
>>

Yes, that sounds better. Or mention that single core case is for MT8183,
because that part got me confused.


Best regards,
Krzysztof
