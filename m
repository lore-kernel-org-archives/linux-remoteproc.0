Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF674C61DA4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 08:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjBNIZK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 03:25:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjBNIZJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 03:25:09 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BB7A5CA
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:25:06 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id n33so4393048wms.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6YzbHeijVYRLJ+k+ysFkY3qZGUT24eM/SXq0u2hpl0=;
        b=zc3a2TNGE5lhWMT6/1egKMP6QQC2JoaLrNPh92Zha2FwXDhNacfwKU59fU8R2y4MB5
         9OdCjIWcp8QrBrI3BVPkpYGGXRs7zoiQdAXhyjG4gxcQx0SFTbQgDd1UVJyoJHONINW9
         21kKq89dLVQnfZAnvTIIGmESqyo0B0n1bf2FCz+fBumOznrCl6cEcWyLLXDlz0dSe9Fb
         /7HENpCmmQ1Co5WvRFl6lku18FYGRwMnGX31VyikC1YHLydfJI3yRjvR4SfrZ0QDr+8e
         GavwIr5tCzr5jJ07YU5JpMxoLkNO/nRPx9dGIwTKNNHZbTcVIYyqJehz9TZLdEIXaIMO
         Mfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6YzbHeijVYRLJ+k+ysFkY3qZGUT24eM/SXq0u2hpl0=;
        b=nVEbEflE4a4owwomc+cIv9NXHuv8aiBH1AM+9Hps939LgGZIgvdTwFMTz4ALPkexxA
         JjX8gYwUEAcuGMFCg2jhN9AfTGHg9DpN8BA4bG+J+XNVY3zBGPyS+Howm55eZuE5+YhE
         lUCyvUse6jutyTBWzVJvQsvugEZUxdo04Hd44Uz0cM7RQb0u/3QPqmzzq9m9v5+Vocgj
         lPRcM26vL2D9ny/HiQuU73+Zm6189F373SS24CPiGZa2mFxuUiZdIx4pPPh6rICHcSdU
         QqbYAd/RxUNpyYd00z+2qRIj/tT0Pc/iqVru5Zkd1ZIbv2dIOCcIPHV1O62p01pcOsHK
         9iyQ==
X-Gm-Message-State: AO0yUKWFeEURhxhnpcT7NVizFVOwq4oVmw7F8dFUsP24wtJDoO5VD2rP
        wN5K6VXZwP2gqA2dDIePMJMk8A==
X-Google-Smtp-Source: AK7set8ke1aM1nENCGqcij6HydhlyUcWM8+QrxYrQ+b6qRNZCSEisG5R7jEMFjOeoDhgNTaHgB7QAw==
X-Received: by 2002:a05:600c:4b17:b0:3df:eb5d:c583 with SMTP id i23-20020a05600c4b1700b003dfeb5dc583mr1389270wmp.17.1676363104749;
        Tue, 14 Feb 2023 00:25:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id hg8-20020a05600c538800b003e1202744f2sm13504837wmb.31.2023.02.14.00.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:25:04 -0800 (PST)
Message-ID: <86f5121c-d9de-250d-b845-fee70f28c1c6@linaro.org>
Date:   Tue, 14 Feb 2023 09:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/9] dt-bindings: soc: qcom: aoss: Document
 power-domain-cells for aoss
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230213185218.166520-1-quic_molvera@quicinc.com>
 <20230213185218.166520-4-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213185218.166520-4-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/02/2023 19:52, Melody Olvera wrote:
> Document "#-power-domain-cells" field for aoss devices as required
> by power-controller bindings.

The power domain cells are for power domain providers. The reason to add
them is because it is a power domain provider. Power-controller bindings
do not require drivers which are not power controllers to become such...
and this driver is not power domain provider / power controller, is it?

> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 4 ++++
>  1 file changed, 4 insertions(+)


Best regards,
Krzysztof

