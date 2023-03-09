Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADA3C6FD1F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Mar 2023 08:16:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjCIIQt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Mar 2023 03:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjCIIQ3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Mar 2023 03:16:29 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CDCE8256
        for <linux-remoteproc@vger.kernel.org>; Thu,  9 Mar 2023 00:12:38 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id s11so3651426edy.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Mar 2023 00:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678349556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYm9P1JkEDejWKuqMqpfHHenbNm4YviIcvuWWtmhvow=;
        b=QC3/LYCdp476HZFI7aLNfH0My/Uv9YwaEcU+Za6KrBg86nPd0Qt6ihaE9n/CupJqg/
         cYhnoYFCjZMmMXZ5+j0usBXjqvBuPT7MuFTPpkJFHpela5HxsriY3gTip/VFT9A4hmfZ
         5VZZMqarRzAdxhO7zZHTBCVck01k4ABsRfPjBkOfOqY1I6HsW1VI2QXWyKEe3vIZ9pWT
         p0kcktw/fQXr0C/R2tdFWi6dP+Tc5lVCjS6wvKlZOuIhOyQsERCZbtbp8bFO6kmzqKlk
         KR3Pup0BeWX7jQCV828/5EcbUEXG86J6KhmkX7jY7GHl0OCso3WLBpNHaasckvhcALZ3
         WUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678349556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYm9P1JkEDejWKuqMqpfHHenbNm4YviIcvuWWtmhvow=;
        b=els6EmOS4jbYq+Um3yLQ7hudvBluiEAWdxHNAZmRPCfrqVnvC3OQdw0JFuOcLrX28d
         097ANOk/zR3uIJ6A65lsIzp0ntZvoOGhIV021gRSzJBSAbrZm1E60xPC8e6Dk6WpbTq6
         4MQ18SIhm1i2zo+KmA0ygtcD9t0OWQpjEKwHSWcvU5CR3Qa0cwBAHVGXLVtPRSjmt6OS
         mJ8HKkKNZgmRNgqk+3/yMvD8gvZcQiY6OrSgSLS+vzEKbxLvHblnlIprT4YNmJuE7zoy
         YACDwxzeg3huhdX34BfwW1ZMPRNqmlaMGHYAlt11oU3xNgF+tJKv7cNCu3mpZpQGy3cb
         rjOg==
X-Gm-Message-State: AO0yUKVp+VhyXht8rOVUprScw6mMmwUbwR/C46MpdfVqc2+bgUxtb6M8
        7jmkkZS+qfeUkYD+UrJXzrx7Qw==
X-Google-Smtp-Source: AK7set/qe5GBqABr4mK0/ODbegQ7W2jBFy0I8L1wJDsX7DeCizSHPxON59pp/33fyjgaTU4kp90Bfg==
X-Received: by 2002:a17:907:7e9a:b0:88a:a27c:c282 with SMTP id qb26-20020a1709077e9a00b0088aa27cc282mr27844083ejc.47.1678349556084;
        Thu, 09 Mar 2023 00:12:36 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id i9-20020a1709063c4900b008d427df3245sm8554756ejg.58.2023.03.09.00.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:12:35 -0800 (PST)
Message-ID: <b60455eb-ec43-2e94-24b1-31fa94b2f7f2@linaro.org>
Date:   Thu, 9 Mar 2023 09:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: qcom: aoss: Document
 QDU1000/QRU1000 compatible
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
References: <20230306231202.12223-1-quic_molvera@quicinc.com>
 <20230306231202.12223-3-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306231202.12223-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/03/2023 00:11, Melody Olvera wrote:
> Add compatible for QDU1000 and QRU1000 aoss devices.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

