Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EBFC71153
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 06:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237776AbjIDGkh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 02:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjIDGkh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 02:40:37 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC5EE6
        for <linux-remoteproc@vger.kernel.org>; Sun,  3 Sep 2023 23:40:32 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99c3c8adb27so170384966b.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 03 Sep 2023 23:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693809631; x=1694414431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ln6iy2vpesj9vkVeD945ywUL7jWVYDR4q5RNUFWQJwg=;
        b=lVvBjJaQ2zgKPhU/+dPa08gyYExRJDJwiMOIrZp8RHPicNjR1ntVp/A5yZgWbeWOxX
         SBZF7GqqnxPpn9vM1DRbutgjq+Fzf6+SzkO8gTWr3kmvkU5AO27Mw+UwFsBipvzfzBQ9
         LCu0GHmLfWmG+Yy4+vGZtLQdky+vnxfxQPKHv5MEXwwAFUiDT0k0AEYw3I6B/6B1Mpo6
         b0lN/N1MTj0I3wUjiluej4GidZkaAx7E6lDtA/VMgkogSluy/gq0wSKshbWnKTnrPVwS
         zAfpwDOEoDjghtLPxozcU9jHGMKM9qxCWyiYRJOSUTvRIN8QuwF3d7g65+qNY4l3xg/Z
         wz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693809631; x=1694414431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ln6iy2vpesj9vkVeD945ywUL7jWVYDR4q5RNUFWQJwg=;
        b=Pw6hfx93VjGwPyGVk5O+EKsewzNqiW9cOU9witZlR44fyycxuAg1h9RqL/MkWheK81
         zjOqOBFg0EveypWEaenPmi07wcVIDR75Gr49DqY5WPWS5C3XikEBf7QZ3zdU+w9aTDtR
         mtnEH4UeNXwRGAcLg5LAz2Y2XZnCzU69dsIP4cv5MLpbLvQvUdQx7lDyJeeizrb3vIax
         mu1JlF/fRGUl3DCriiaodZKwZC1Cqg8Ie4eEgQ2bNlZSHrTm1QNQ639KOwijZLKmTwN3
         dgG3ERcWrqk8JbGiV4vi4g6U/VWf3E6OUAzgvQC3n0NLoaxpL0JZa7ciJz3LDbDEopUH
         7/cA==
X-Gm-Message-State: AOJu0YwJzOrZ5Dvwy2aSKIZvem3WN+uJ6+oFOq6QaFQHNebQzihs+tuN
        Ys3cIEZk6npS5RkJjyQ/SLvh9w==
X-Google-Smtp-Source: AGHT+IEEsbwofxQHFtc312dDFAuxOwANF5Ag/tDLHGOKo0BqggtDDKZuvwJWZe0h+VY6Phfi1spQfw==
X-Received: by 2002:a17:907:271a:b0:99b:dd1d:bc58 with SMTP id w26-20020a170907271a00b0099bdd1dbc58mr6984278ejk.41.1693809631395;
        Sun, 03 Sep 2023 23:40:31 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id l14-20020a170906938e00b00992e94bcfabsm5685445ejx.167.2023.09.03.23.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 23:40:30 -0700 (PDT)
Message-ID: <9380d42a-2c24-89ad-14ca-99e0f1ffcbf7@linaro.org>
Date:   Mon, 4 Sep 2023 08:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: ipq6018: Fix tcsr_mutex register
 size
To:     Vignesh Viswanathan <quic_viswanat@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ohad@wizery.com,
        baolin.wang@linux.alibaba.com, linux-remoteproc@vger.kernel.org
Cc:     quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20230904055010.4118982-1-quic_viswanat@quicinc.com>
 <20230904055010.4118982-2-quic_viswanat@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904055010.4118982-2-quic_viswanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 04/09/2023 07:50, Vignesh Viswanathan wrote:
> IPQ6018 has 32 tcsr_mutex hwlock registers and size of each is 0x1000.
> 
> Fix size of the tcsr_mutex hwlock register to 0x20000.
> Also, remove the qcom,ipq6018-tcsr-mutex compatible as this maps to
> incorrect stride and mutex config for IPQ6018 in hwspinlock driver.

This is 6018, so if 6018 compatible is incorrect... this does not make
any sense.

NAK


Best regards,
Krzysztof

