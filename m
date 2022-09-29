Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2F4C433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 29 Sep 2022 09:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbiI2JSe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234661AbiI2JSd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Sep 2022 05:18:33 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037B014355B
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Sep 2022 02:18:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 10so1333252lfy.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Sep 2022 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kc3ZUAL7WQah+/Fhr7W6V5w2wd3MWGg+6pISLsDcInI=;
        b=JbmOPO8O2IY9w37qC7AVYBpBYGgWcdUCkEiLm8j+zcd4hRAzkLPmZ+c3bnIosKBndN
         wK9E3rxJR3x6JVVKBgsSD24SB7hLAzlfYm5Zti4nsPymgLjh34ONJr8ZvIhzIW8l0iRH
         S/YDDAvInXynnGoumULv4WmWN4VcLm+8nQe6S4y0+S/9kugebPCatJ2TwiJfA3EgO7Zy
         5TaExbvcociEVLuC2CTFYxkmbowZTquZEMXY7wVD6y8ygxGe72teB4jISwpqVSJYPvUr
         kQWlGiETkGNtN4b9klUQgx+6YhEgaZ+5v+h3dgh5DJSIlodlzDGlMUf0olH2yUE7qq/y
         2ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kc3ZUAL7WQah+/Fhr7W6V5w2wd3MWGg+6pISLsDcInI=;
        b=rK+sR030y87HGxueoNs+f/3cHGWNK3uVYsbNElVQ/l9dK4ImNmSsJzen3TjznT67W+
         9gNfAb0gytcR1MC7qPX7TCkZL80ZFeP+jSQum+tbVHdO3sJx6up/Dc6VI6q5lTXLaFRv
         glo+n2EMdd4+HrFZQ+688t5uGOuFRDj1is8/CI5xWaNahq8QCLKnTcpl+8UCspQu0twM
         Kjk8qKZ9h4NS6YrKsGzL/ZlVsbCkc3TjWAlbZ0idlyVp2856UHR8amQkoSNpXKGX1MGc
         x0cCIW2PBQkCLafV/Trqa/XwC7eWY1gwBz7qTQR7KKZk1jP7se1Lvih84TXO2u7+2wN2
         njzg==
X-Gm-Message-State: ACrzQf0zLsyivY96ytyhZpecLh8HUmRTarYcnPPSM+HctlWi/0fRwAwA
        58eTaVLdcFE1ultKe4dC/S0aDg==
X-Google-Smtp-Source: AMsMyM4EF0p2/Ik6h93Z4rtV/D0MipOZQ/7AOh7OhdvB4Fu2GeKp4pWrtAvsv9AbEbQt1WQhZM2aog==
X-Received: by 2002:a19:5015:0:b0:498:fe6c:39de with SMTP id e21-20020a195015000000b00498fe6c39demr857252lfb.263.1664443110397;
        Thu, 29 Sep 2022 02:18:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k17-20020ac24f11000000b004896ed8dce3sm729637lfr.2.2022.09.29.02.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:18:30 -0700 (PDT)
Message-ID: <3bef6840-9d68-68e5-0a7e-7e8c06c31025@linaro.org>
Date:   Thu, 29 Sep 2022 11:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/5] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
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
References: <20220929050209.1464526-1-sireeshkodali1@gmail.com>
 <20220929050209.1464526-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929050209.1464526-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 29/09/2022 07:02, Sireesh Kodali wrote:
> This is a direct conversion of the existing txt documentation to YAML.
> It is in preparation for the addition of pronto-v3 to the docs. This
> patch doesn't document any of the existing subnodes/properties that are
> not documented in the existing txt file. That is done in a separate
> patch.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

