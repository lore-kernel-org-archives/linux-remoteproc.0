Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10F3EB64DA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 Jul 2023 07:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjGSHPc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 Jul 2023 03:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjGSHPb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Jul 2023 03:15:31 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9361735
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Jul 2023 00:15:26 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so60447265e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Jul 2023 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689750924; x=1692342924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSD4oXj3W1W0X/B1/8C0SFn8Fii6AalniSnEduWk8+g=;
        b=ALCPJGJsxZaDFBx/rWo1J1fy4HbQGLM6oXb3NGlTLNrI/JnNDb2GB59C4btFXcib1B
         de4zuxqB+xOLfUTEPJT6mehV+6mqOhSj1uYsS4Yc9/wSvSxZ9SGZjcfrA6VlEKafCN3L
         rvYnru0l6ahfOUqp2JFvfYC2llhVOEYdFub485iQ8tslhfCTlbvuxWmwAX5iIMR9DkjK
         Z9BVWA/FiQ2a50PZRWve1TraFl/ATzAVFi2aqSJTt1dSX+h+WgnXh7DXWCx7mKB85PfL
         JOTD3YTMvvh2oLsjT56Vqmus1dE58QTqwGhhCuF8d3/9gpJtL5Np8IBzZ8nMaAdjg0cK
         Vqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689750924; x=1692342924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSD4oXj3W1W0X/B1/8C0SFn8Fii6AalniSnEduWk8+g=;
        b=NkgIn7UQ7ufM963C1nGZKl7knVbfOOoEInZ4nEVbo0Hkb4OtYwGH0KfjuDttK1gXB3
         Mmc7KNbQIWQ9lOxvjysi2QmV9dEL3daX12+vC2/ypfFf/np67OJ/w0FE0R4ycuaD4eO2
         yDKQdjyOPQqdCPWy04t4yt5uaqsXGRIgwgtASX5GaKhIF3Cw47aywtViMOLa0G8c+uPb
         aWaoZe5vR7RkA4DC3VHlZ+9FFmitMR/Cvm+x3vSde5h7gtxF2x+Y8hWkhguOYlOe+M2Q
         hQ7yljb8fPNhR7i1vpDVSxasJYw/DgX9twAdt1NQUyNXVYkntRmts9FFeLYxqL9onjPZ
         WuxA==
X-Gm-Message-State: ABy/qLbLoNHtdPpv0Aq8+TTVUdWEm63p+600BdIublTvwSkkmcNDj/zT
        7IIaZYLaCnmQD2ZiTbejeNzMXQsR3M6IG0V9B5ie1A==
X-Google-Smtp-Source: APBJJlH7+EEhGrtoo4pHXOdKSytcZJ94BuO2zI4aOFPiixCW4Uf/FcIG6QYPrIznlzhS2dH0SiaUeA==
X-Received: by 2002:a17:906:10cf:b0:993:f83b:43d2 with SMTP id v15-20020a17090610cf00b00993f83b43d2mr1594487ejv.24.1689750904563;
        Wed, 19 Jul 2023 00:15:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c9-20020a170906d18900b009929ab17bdfsm1901790ejz.168.2023.07.19.00.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:15:04 -0700 (PDT)
Message-ID: <499d1134-869a-050f-c18d-9e7460d87989@linaro.org>
Date:   Wed, 19 Jul 2023 09:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [V3,03/11] dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring
 up clock macros
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_eberman@quicinc.com, kvalo@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com
References: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
 <20230718120501.3205661-4-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718120501.3205661-4-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 18/07/2023 14:04, Manikanta Mylavarapu wrote:
> In multipd model Q6 firmware takes care of bringup clocks,
> so remove them.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  include/dt-bindings/clock/qcom,ipq5332-gcc.h | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/qcom,ipq5332-gcc.h b/include/dt-bindings/clock/qcom,ipq5332-gcc.h
> index 8a405a0a96d0..da9b507c30bf 100644
> --- a/include/dt-bindings/clock/qcom,ipq5332-gcc.h
> +++ b/include/dt-bindings/clock/qcom,ipq5332-gcc.h
> @@ -96,15 +96,7 @@
>  #define GCC_PCNOC_BFDCD_CLK_SRC				87
>  #define GCC_PCNOC_LPASS_CLK				88
>  #define GCC_PRNG_AHB_CLK				89
> -#define GCC_Q6_AHB_CLK					90

This does not compile, does it?

Best regards,
Krzysztof

