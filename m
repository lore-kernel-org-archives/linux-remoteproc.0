Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38059C77B7D
	for <linux-remoteproc@archiver.kernel.org>; Sun, 14 May 2023 09:40:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjENJkc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 14 May 2023 05:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjENJka (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 14 May 2023 05:40:30 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829DB1992
        for <linux-remoteproc@vger.kernel.org>; Sun, 14 May 2023 02:40:29 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bc070c557so21627699a12.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 14 May 2023 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684057228; x=1686649228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUW5Igqs7LC8kFWD+gx7NXGPi2rebIGLbHvwwwSiejg=;
        b=qXXhvc16BjYtVI3RbWOmC2jcpEyJzngGFk7rTOlKurSjGDFWBpYgdEvBtpF7PbvqPk
         LcF8bPTz/Z2ubuDmYhgV4xpBsUpjue1LmwZElZ5UBB3Ko/KlU8ajA0UnrVTl7a6MrT/R
         8ZFK0CXEPdUAYwSd9NrcTMyzrHZRaCaEjkk/f8HcdW4jOnbwkRi+iFozOOjGzTn/WjNP
         EMVB013lxv2F6V1fzPbMtP4n/+dw/vhcALq2AUFAFTngW/dtGKYKjRISLzCtnwDsoa0L
         rNozicmyV8IeEo9P2/2j3Gntpa75d5DBBMc1QToOBDpLjhFPh5WWT9e59MeOz8xE+zL4
         1FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684057228; x=1686649228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUW5Igqs7LC8kFWD+gx7NXGPi2rebIGLbHvwwwSiejg=;
        b=gdIEvyvqolH4ZrpWOzlZe+XViOMTA5mxW6xZZiX0c68WgsL9RcEFRGt315qls37709
         cmop12iXagloPRRznoPLbeZMH2uac827ZcZcu+TRSlRHa5/Ym5s+YCCcT4YEnYkvaIpL
         ZYilfOYLc8d6qzFjpHTgz+297nKraQeWO3aD6HSEoTBuiFAq41gLHet1AIovu2gfH+/R
         cvKL7JTVgrj+V8JUDo5dy93N4I5GNzIvrp6pGPK+hey1jWZJcnSby1DyiLvAbUjomm0v
         gqDaAU10rHufnvB0nZIfmFCJNiIWOufRmHfLjZOcOZKCyLFokmxUKlu839cg9xElD/ox
         N/Sg==
X-Gm-Message-State: AC+VfDySuSMneFW4uIrzdv1xBx8IyH6x2DQA6EQdCKHuEL+BkIYUIsNp
        HKZDhKwD30OdZQluF/vcaSEdvA==
X-Google-Smtp-Source: ACHHUZ5tvbL4jEsqJPpeimvea31dJCAToYMyDZrxSAb7ema2CejXD77WW74NrQEAUWZyA9z90xWIjA==
X-Received: by 2002:a17:907:1b29:b0:94f:2d5f:6949 with SMTP id mp41-20020a1709071b2900b0094f2d5f6949mr32171616ejc.42.1684057227954;
        Sun, 14 May 2023 02:40:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:715f:ddce:f2ba:123b? ([2a02:810d:15c0:828:715f:ddce:f2ba:123b])
        by smtp.gmail.com with ESMTPSA id w10-20020a170907270a00b00965e9a23f2bsm7882998ejk.134.2023.05.14.02.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 02:40:27 -0700 (PDT)
Message-ID: <e61d2168-9114-6f95-2607-a553d1046caa@linaro.org>
Date:   Sun, 14 May 2023 11:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: st,stm32-rproc: Rework
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
References: <20230512093926.661509-1-arnaud.pouliquen@foss.st.com>
 <20230512093926.661509-2-arnaud.pouliquen@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512093926.661509-2-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/05/2023 11:39, Arnaud Pouliquen wrote:
> With the introduction of the SCMI (System Control and Management
> Interface), it is now possible to use the SCMI to handle the
> hold boot instead of a dedicated SMC call.
> 
> As consequence two configurations are possible:
> - without SCMI server on OP-TEE:
>   use the Linux rcc reset service and use syscon for the MCU hold boot
> - With SCMI server on OP-TEE:
>   use the SCMI reset service for both the MCU reset and the MCU hold boot.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

