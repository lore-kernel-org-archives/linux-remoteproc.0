Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25119ECAAD8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Sep 2022 19:18:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiIUTSx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Sep 2022 15:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiIUTSw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Sep 2022 15:18:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15019E2F9
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 12:18:50 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a2so10865158lfb.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4K6JbV5ZwU/7mQCZXcGP3t4pUNp3SX7Jex1JLDsoBRU=;
        b=zDhkW4sUuaJHrN8n9JuLa/iVLeeW2yQFpz47ihw9miQv+EzlXs2Hy9WbDHfn8GqZ2K
         I3OEB/LrDi/G4QBcx9DvUM/wicO+9RCOErO0VmA+BuHEEBU3IjG5fSip0PwypoHXpBz2
         MLhf4DY1zLerO3YCYBiBGI26FzJaObxi50rJXx86W4lB7sBGiECgdHArhwSHzFM1rKHB
         oNmNCT/09cRKbwtzbMME57sZWEyxt2w91i/3MzaoyjIgdo8jOmnO6uMbieMOqvrsbDoi
         S1SOJGfE8mhH5tUM5wdAWAHt6ZygSLpmXX8/a120Juvch+pjwkXR+w1NnAFwneupappT
         1A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4K6JbV5ZwU/7mQCZXcGP3t4pUNp3SX7Jex1JLDsoBRU=;
        b=lNOtJhzpgdJzp1jsaOSecY8RCwIGqb86qTEYjMIMmqb0iukN7BoXACxPeUVB+Q/9VY
         HM2DPfw9XXSzTVzHPD+nkG3CBpYNCKFs1WQ/Kgd5BwY7H+DIcg+JvQS3hxqBBEmiKszT
         mw2jArR/gRiv9hZzTcptHUhEuLJ1FlbWneXi9pLX3VEi6Lyb9/GbOztX19Xlgyl2Etsm
         Yfct9n+dNH7VeUA95U1TcHcV5PC9lE3ZC5Jy6rUJfsgZyu8fQh/o0STlD1XsMtPJmtC/
         sBbS+xUDbU0SAoRz+wUddsxkZp69LiNwF1z5cU4nrjY5cQ8i8jGI/5l/ipvuIVj0jrld
         0ftg==
X-Gm-Message-State: ACrzQf1+pYGBa8bVxRRc4+LBC4Bn3ixgirEp2EVly00NJH3fCdarthG7
        pl6aW1sfs8MyZm9hDSPl9Ld1cA==
X-Google-Smtp-Source: AMsMyM5Za7gbwIymx5nD8zXUtkkscdjID6g8aEvDflEe+xhj6/0NmEK4gdMsA2vZ4vV3wht4IwIehw==
X-Received: by 2002:a05:6512:308e:b0:49b:9015:e76e with SMTP id z14-20020a056512308e00b0049b9015e76emr11626400lfd.393.1663787929329;
        Wed, 21 Sep 2022 12:18:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i1-20020a2e2201000000b0026c0158b87csm561903lji.29.2022.09.21.12.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 12:18:48 -0700 (PDT)
Message-ID: <39dd7679-3f60-ee65-a6aa-cd426cd78fed@linaro.org>
Date:   Wed, 21 Sep 2022 21:18:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 0/3] ARM/hwlock: qcom: switch TCSR mutex to MMIO
 (msm8974)
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
 <4768567.31r3eYUQgx@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4768567.31r3eYUQgx@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 21/09/2022 21:09, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Dienstag, 20. September 2022 17:04:11 CEST Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Remaining patches from v3:
>> https://lore.kernel.org/all/20220909092035.223915-1-krzysztof.kozlowski@lina
>> ro.org/
>>
>> Not tested on hardware. Please kindly provide tests.
> 
> With these patches on top of 5.19.9 everything incl. modem still seems to work 
> fine on msm8974pro-fairphone-fp2:
> 
> (2/3 & 3/3 from this series)
> ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
> ARM: dts: qcom: msm8974: switch TCSR mutex to MMIO
> 
> (picked from linux-next)
> hwspinlock: qcom: Add support for mmio usage to sfpb-mutex
> hwspinlock: qcom: correct MMIO max register for newer SoCs
> hwspinlock: qcom: add support for MMIO on older SoCs
> 
> Tested-by: Luca Weiss <luca@z3ntu.xyz> # fairphone-fp2
> 

Thanks!

Best regards,
Krzysztof

