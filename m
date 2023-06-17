Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002F7EB64DB
	for <linux-remoteproc@archiver.kernel.org>; Sat, 17 Jun 2023 08:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346251AbjFQIFC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Jun 2023 04:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346284AbjFQIEv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Jun 2023 04:04:51 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892702720
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Jun 2023 01:04:45 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-985b04c46caso239777966b.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Jun 2023 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686989084; x=1689581084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJrsf2pwoMXl3PeH2n9Eu8zL86w1f8iDhqh4pji1Kuk=;
        b=TWts4lPBT8wmpu8xEy/41MsKVIzbCajbsglH9p9R9Vu0ARwJfbqMpZ0mmceE6qYCIl
         iMvOYfxplWhTK3W5PdRiXkuZt1/4wTrfQI3dAMxrz9RxGDLDNNOuC3amY5ULF4OvfiVy
         nNFgI/NelFKPxTo860DYlZQm9vOyXAO/Q+AklHg5aYuJABxgVMPpWhDgTz8rnWaaSn16
         Lar82GOunRuu3Pb4QQS/UZEZqVOSzSjFw83q9Zqu01hDBlaq300Xu+ByOhnkwRencpjL
         imlF3HWljBUsO8xbZqsDZfhcVf+Lo6xPLkCk66CpjjUfIGSfKvb2/kaC0LkmANPLPyaa
         RyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686989084; x=1689581084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJrsf2pwoMXl3PeH2n9Eu8zL86w1f8iDhqh4pji1Kuk=;
        b=f8eaEpzHqmOaR1/499ieLhzYARm21sC4+uvttTJ9iADkzoGM9K2rGta6nFsPKALfWy
         BY4G5VLH9XqraR1eSxXbEYs/HFgVX52vayU5XtDMK2h2o3lFdCYCUsvMYo40ri/5Uk8M
         wwwn7m3sr3BT4y4cv6oWdGhyMt0dWmOaO2mgrQmgHBFKnnUG9FXOITsnqXeMRrEWSYXr
         2sC+w4JE6Vb6VY6lEJnGPtpdaomzpbP2zKh6zTz08h826hO1HjGLHovaxdFV/f/eZPad
         eUXlYIyJb6InzQjjqifAO6avFfEQLL/clQcvNcjPYtGRigj9J6QwuNUlJSt2onENd6kJ
         Eo4g==
X-Gm-Message-State: AC+VfDzr0LXsmIsu5hJ5wyW3rlAvTOCaOqTb2lXIp+yfNp7i6mHpgt5G
        8w9O88jh+/neAKHbqIPP9kP3+Q==
X-Google-Smtp-Source: ACHHUZ7tfsqu+22+UNCW+G6AYFrV7goBkQ5VBIhB+LhrccM00EVCmocaQdT96lk/VxA3oP2U6Cofkg==
X-Received: by 2002:a17:907:704:b0:974:e767:e1e7 with SMTP id xb4-20020a170907070400b00974e767e1e7mr3815136ejb.28.1686989084099;
        Sat, 17 Jun 2023 01:04:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n25-20020a170906379900b00977cc473b41sm11917947ejc.142.2023.06.17.01.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 01:04:43 -0700 (PDT)
Message-ID: <f2c19379-4d1a-e5c4-1452-103dd693735b@linaro.org>
Date:   Sat, 17 Jun 2023 10:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 05/13] dt-bindings: remoteproc: glink-rpm-edge: Use
 "glink-edge" as node name
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v3-0-a07dcdefd918@gerhold.net>
 <20230531-rpm-rproc-v3-5-a07dcdefd918@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v3-5-a07dcdefd918@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 15/06/2023 18:50, Stephan Gerhold wrote:
> Semantically glink-edge and glink-rpm-edge are similar: Both describe
> the communication channels to a remote processor. The RPM glink-edge is
> a special case that needs slightly different properties but otherwise
> it is used exactly the same.
> 
> To improve consistency use the same "glink-edge" node name also for
> glink-rpm-edge. Drop the $nodename from qcom,glink-edge.yaml to avoid
> matching the wrong schema. qcom,glink-edge.yaml is always referenced
> explicitly from other schemas. This will already ensure that the nodes
> are being checked, so it's not necessary to bind to all nodes named
> "glink-edge".
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

