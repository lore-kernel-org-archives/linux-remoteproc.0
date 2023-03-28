Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA1BC761A6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Mar 2023 06:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjC1GpD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Mar 2023 02:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjC1Go6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Mar 2023 02:44:58 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AAB1BC5
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 23:44:56 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id i5so45576860eda.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmTvziNt2VFrSmXaXHn7cfTQldiBzclyda4PoCjJxWE=;
        b=KDvjJ+sJSVFfF+ax9cNRTuZm3PPD4QOVnSoLIozYu62wHnN0LvthEFWDLtXVvroHmO
         UG9miq8QhrSuSD27nq641NkuPALs5ipEHnV2igK6U9zVyewBXLMQOl9i+yOXyBoC7lO5
         +RWiBPkGLmNJk6NBYnc5sgw9mquFl1aSyyfIb0YeNCzFf7oPSekfsQhhlM7O4frh3zA2
         mbjauxBgowvPV19/w2zFI47p57F/g/8S6qlIcTdtJ7NDO09LanXxtC3z2GTab4qNsumB
         F9bLEszOEd2ps5tmD3bCfc0BI90KsOK12rR+l5AvfV/oKzqwipnPXF382hkkXduQ1Hu6
         LtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmTvziNt2VFrSmXaXHn7cfTQldiBzclyda4PoCjJxWE=;
        b=r9l0froh56C5a8yaZ/eGNny2UAQobAvc9kV/2eFgBuX53G9tCG+UlBt6BVZm79h3wN
         L71lSLxq8FgGiSpsMJybXotwW+b8seXR7mriitohSv8k6HdthcU8SAPduQS9QMyjqDax
         wddnlKPb9JMa7uI/lE4o120UhuM3W0REXrbPGxTxdzT04gh2uxhRHsQ9hceTg281pdh2
         AlhEKpmrRa9tkvcbGXqdml4Tw7ikhAsKVkZsdS2Q5ZIPwygJWe/HE4Jbgxgs+m8+Mhps
         fbsmVjVeWdKFbFcW4VTtVAqKMXxe3CMsoQlwplXGa94tiSPurNSOafWhVfn/XYnU9Tkc
         m3CQ==
X-Gm-Message-State: AAQBX9dsoZZ4SUJMLsiUiPcw0hxCH2LwjewqbsvFnUnUNPBihkk7Cr3z
        szNHgiohnfiXeThnGhYbmD27tQ==
X-Google-Smtp-Source: AKy350Yo2Rt1rOFhXVKxwzhnMFISblPFU1CUUdS7F8h8GwafujSMEOGbp0rS44wexna8I2I5SC9t/w==
X-Received: by 2002:a17:906:9f04:b0:944:8c30:830d with SMTP id fy4-20020a1709069f0400b009448c30830dmr7483214ejc.42.1679985894744;
        Mon, 27 Mar 2023 23:44:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id k2-20020a50c082000000b005002daeb27asm15465414edf.37.2023.03.27.23.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:44:54 -0700 (PDT)
Message-ID: <06919af5-a518-2da8-5cd0-ac657948b6c3@linaro.org>
Date:   Tue, 28 Mar 2023 08:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230327170114.4102315-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170114.4102315-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 27/03/2023 19:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

