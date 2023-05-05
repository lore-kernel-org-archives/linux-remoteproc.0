Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1169EC77B7C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 May 2023 07:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjEEHN0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 May 2023 03:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjEEHNZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 May 2023 03:13:25 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DABF14E56
        for <linux-remoteproc@vger.kernel.org>; Fri,  5 May 2023 00:13:23 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-965ddb2093bso55771266b.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 May 2023 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683270802; x=1685862802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LjPti0SVf6hmj4N0H313/55MiUrWdpZNvzPtpM8uR3Y=;
        b=KSRYsw+W1lrvQqIyAomaDqVEM8xAGeLseIR/4uBsLmebPEyJUBuQBwvCTXEzpOMq9u
         AFiPu0uEzbyPyzn/5fKp3RBeQMnx7feR/ep6QzWHp/2GN2vv3/We/tZUk1tgEgcKNSIp
         mXSsfR6GbTtiv2QRS62IWB/gi0a//k2zL+Cdpz66A6DgxenD1aLu3730CP0th8T9h9D+
         6oOFUvslt6PzDG8AIJ9JtBmzRGaXUmxuf0JRYaj7trhS36t9EBUtFLHhzruYWePdnZyv
         fEXX4eXaza5nVCYWycGrLxXoIt9a+fmY08OiLyJNT1E0gcmJfkZSunZD/TsWGrmAh2/I
         Sccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683270802; x=1685862802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjPti0SVf6hmj4N0H313/55MiUrWdpZNvzPtpM8uR3Y=;
        b=k/yTDJncnqLerYp02ihUYNsKDuiVWLL3+JMFf46rDzFJv4rMxXNyNyOxbpY/0mhESQ
         rZ13AzU1GPfN8AKHJFGMNq30HoSrE/cOwJRr7YIvINTmM6M8G8KElXh5U6e+mxRt79zL
         cIcVTZxnLDDeCpAmNt5nEhBvFJU6ehwmLS0TvrThtcLpPGAPpsc8U5vTyvxsWqT4PZeS
         L2JmLWtgW/m8O0iWbJnT/2JbOh2TOh+6bHOAjF6kkfVVPiYWAcGIXqfJcRQIEaCmnmcU
         3IrJRin6sV3nlNl4YJN4t8plQpygl/zqA71MxNBSXPlmWKXrP5pY8LUu2DHAZ5jZDZHf
         SGdQ==
X-Gm-Message-State: AC+VfDzziXPyodqdbz1D00jeURbXqZYhgXRZEZWlkuBeUMRNMXoXpgDE
        kZeq+oa8qEaZ/JbnRzNOt7+KbA==
X-Google-Smtp-Source: ACHHUZ51C0pF2OmSh3ZV19RMD0Jz6GfDImw2bVfTjB/4HVx9UvCSzaKvElz8ivKA9nmTvCyMTvu8Tg==
X-Received: by 2002:a17:907:98e:b0:94a:5c6d:3207 with SMTP id bf14-20020a170907098e00b0094a5c6d3207mr320366ejc.44.1683270802121;
        Fri, 05 May 2023 00:13:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id n22-20020a170906b31600b00965e9a23f2bsm205645ejz.134.2023.05.05.00.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 00:13:21 -0700 (PDT)
Message-ID: <66d344b2-899b-3d00-2d8f-5dd86f0af985@linaro.org>
Date:   Fri, 5 May 2023 09:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: st,stm32-rproc: Rework
 reset declarations
Content-Language: en-US
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230504094641.870378-1-arnaud.pouliquen@foss.st.com>
 <20230504094641.870378-2-arnaud.pouliquen@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230504094641.870378-2-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 04/05/2023 11:46, Arnaud Pouliquen wrote:
> With the introduction of the SCMI (System Control and Management
> Interface), it is now possible to use the SCMI to handle the
> hold boot instead of a dedicated SMC call.



>  additionalProperties: false
>  
>  examples:
>    - |
>      #include <dt-bindings/reset/stm32mp1-resets.h>
> -    m4_rproc: m4@10000000 {
> +    m4_rproc_example1: m4@10000000 {

Just drop the label. It's not used.


>        compatible = "st,stm32mp1-m4";
>        reg = <0x10000000 0x40000>,
>              <0x30000000 0x40000>,
>              <0x38000000 0x10000>;
>        resets = <&rcc MCU_R>;
> +      reset-names = "mcu_rst";
>        st,syscfg-holdboot = <&rcc 0x10C 0x1>;
> -      st,syscfg-tz = <&rcc 0x000 0x1>;
> +      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
> +    };
> +  - |
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    m4_rproc_example2: m4@10000000 {

Also here.


Best regards,
Krzysztof

