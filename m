Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C353DECAAD8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Sep 2022 19:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiIUTSQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Sep 2022 15:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiIUTSO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Sep 2022 15:18:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53868901B1
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 12:18:13 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w8so10812475lft.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=j7Zzskc2rhkyZt4aqWcee91EDVAwF85JPaMAbyfab3Q=;
        b=Mhx8OwegiP6Jv0hMBn8Y4RWNWr0LVYQ32+KIyYLk1RJWq2KBq2Mk4lk1USxlERFZIW
         NEFus+5qn33Rf/D13z+fy50CZrm6onl+1DYRLTHZdqo0Xq0L1IqGoJCghDE+gUZNU6bX
         W+Lzl1WRkmIkcQVa8Xoh7eJ/9Qp3qmjj3JlCQ5aYwqgRbsOsbgnErp/RgfgOm2/3sB9q
         O87Shl/IEKEQKkfp54oqeP1Kb2ZVCM6hgZaCFQUUVIiCfjGvpze54xE0CaM/oXKOPC6V
         4JuBjShKyXo+WulWpCzCc1bCIWql5ijD9JGklxjn8eI1mk0AGsAGQFeIzHklFhMvc+vh
         b6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=j7Zzskc2rhkyZt4aqWcee91EDVAwF85JPaMAbyfab3Q=;
        b=OE8GLIG9PPkfSRVISu6oxKF5pdK7/NBkX7l8R0nPw/iA4PDMDLgfgOhp4R85a7jRLc
         xcaR0M0pj0BrDPzxen4vAvNxDRSgS0RVQXQb2nCG2eehAPshgfzpqQr8H+ZePNm+crrY
         LC7IKwVnnTZSiVWYofGzTs4MA1z4AjGT4qZMn+pbYsAv6BWCKSJW32sjLN1YNaMzXMHj
         YP7YdmxPFW1MG63/hj2Sf92PSh1Vrln7kWMf+sMpYAWDw8AkpLUNPrIqcZAGhnB4KbWD
         PIW8RjXspwO0yuVGceOQDkvwfPNUhVYaAQ7tP38FKKM6tsbukRNqT0PeHIO8l987KhFJ
         Vv3w==
X-Gm-Message-State: ACrzQf3k/pUEWi6YNgF0dV0v5oPa+0nF/Xh8xHyaPali0P9c0VIfq0LU
        /Biyh+Y7peRfEuQp9ryeSglNmg==
X-Google-Smtp-Source: AMsMyM79FUTqb3FH+w/AQyWA76aHLgd9cF6t83YWs9qLpGlQ1PFAP5b5BleFg8D2meqIKEtclShxPA==
X-Received: by 2002:a05:6512:11c8:b0:497:c19e:c709 with SMTP id h8-20020a05651211c800b00497c19ec709mr11719279lfr.152.1663787891679;
        Wed, 21 Sep 2022 12:18:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j12-20020a056512344c00b00494a1b242dasm567177lfr.14.2022.09.21.12.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 12:18:11 -0700 (PDT)
Message-ID: <e4e2b3a5-cbf9-86a6-681a-8089d4e22cbc@linaro.org>
Date:   Wed, 21 Sep 2022 21:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 4/4] dt-bindings: remoteproc: qcom: wcnss: Add
 compatible for pronto v3
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20220921043648.2152725-1-sireeshkodali1@gmail.com>
 <20220921043648.2152725-5-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921043648.2152725-5-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 21/09/2022 06:36, Sireesh Kodali wrote:
> The pronto v3 remoteproc is similar to pronto v2. It is found on the
> MSM8953 platform, which is used by SDM450, SDM625, SDM626, APQ8053 and
> other SoCs. Since the configuration is same on all SoCs, a single
> compatible is used.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

