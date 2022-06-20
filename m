Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BD7C43334
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Jun 2022 18:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245045AbiFTSfy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Jun 2022 14:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242914AbiFTSfy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Jun 2022 14:35:54 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD101EECC
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jun 2022 11:35:53 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id g25so22750971ejh.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jun 2022 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DyuNPVuSNowzrm63j1zsZJOThbj5GObu7cLWAKANMVc=;
        b=pbdIFkiuQqNLXWDkXm0ZZlPgMwWln0kuPO3GqebuD6FpRbecakmMC9pmVmX9e7g/gr
         z7rxpqJjJePcy5F/YNjdX0w4ynSTIr61n7l+DWPCwX20nXn05QyvSI4lQZMjE0wazSPb
         EZ3+oHePxJcAmU2lNDmbGpO4zaQqKLwrobBerU4FQeUOWcEKVZMeXbk0eHXJi0xXQpds
         JBd23DA5ctC/COOo3SEX4YDX1Dupd7P8rehz+AuWb+/w1L+pigbtyqwDxD58dfEFWV9N
         C94bWle+erS3g6LzNvYpcpeVVEz/jNhBW/26pIOGT7xnqcGWrjvLUBGB5aa85vAgmZU2
         FXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DyuNPVuSNowzrm63j1zsZJOThbj5GObu7cLWAKANMVc=;
        b=Mw8pgDqhAjKC1s8XL0wP6k2r6uSuaKSdTLIEnTFSYLKYMsJUkepfN5ANSxt91vwd7J
         jXrQj/OhmEhb7qGnymkWuDbRxXfbgtjDCPpGf+iXHpghH+v+SDdYdrUvB8NBFokZtghZ
         YWNW7Dy2tHYfa56g6Afzh5VFVLhRhjPr2XCQsGGusa1x+kq9dIJ19nrVECD46Jr+B1mW
         8wLMq7d1rST0FfjmQt34/6XIW3Lbzw9QGo1FXgxyzTFqVMXYzmbDGKanA8WPs+x3vzXA
         76tod08q5XAJ/waApadB7W8av258nxE9lhGfx6868tGIVOu0805y1483AIt9MXcx0RHT
         EYYQ==
X-Gm-Message-State: AJIora9anGpMq11beb/NiE5GHXHjQ4njuGkrkJdvCu3hPMzpym5RlyUO
        wy4qZ+QjVM7nbvNQK4M8GhBZcA==
X-Google-Smtp-Source: AGRyM1vRDkQYO1pg9ZiRuIjA3okLtAlzs+qA/W4WQkKiGYLXITM9Otidvg2yY0cS5IPwrALT6s/X3g==
X-Received: by 2002:a17:906:221b:b0:708:a007:5a77 with SMTP id s27-20020a170906221b00b00708a0075a77mr22461190ejs.566.1655750151701;
        Mon, 20 Jun 2022 11:35:51 -0700 (PDT)
Received: from [192.168.0.211] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906315300b00704cf66d415sm6481779eje.13.2022.06.20.11.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 11:35:50 -0700 (PDT)
Message-ID: <c92b0b51-0e59-72ab-5306-ccec92b0cb94@linaro.org>
Date:   Mon, 20 Jun 2022 20:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] remoteproc: qcom: correct kerneldoc
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>
References: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 19/05/2022 09:33, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings like:
> 
>   drivers/remoteproc/qcom_common.c:68:
>     warning: expecting prototype for struct minidump_subsystem_toc. Prototype was for struct minidump_subsystem instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> 

Although these warnings are not that important, they are still warnings
we want to fix to be able to compile with W=1.

Is there anyone willing to pick it up? Any other comments?


Best regards,
Krzysztof
