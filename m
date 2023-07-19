Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8720EB64DA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 Jul 2023 07:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjGSHOL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 Jul 2023 03:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjGSHOI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Jul 2023 03:14:08 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D96B1FE7
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Jul 2023 00:14:06 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98e011f45ffso801426566b.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Jul 2023 00:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689750845; x=1692342845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSuzImj8Lb6e1WbRzxnhMveJALtbCQgV6WqSEQlBvUc=;
        b=i9XvFD9FoG1guW6kBV01ylznweERqqkNDGmEaH+pLF3Fi9mP3yc9wFhik2dyWNDpkn
         neaBKR3WA49JKbl7cnvTJMnlMP7VWe5JZ+YCBehZcrXnstTYUR1LDiIauBmnVD98d/M2
         eLCH8mIZcvZRbk41G7j4uBIh8GpQojw42JUJ6g0Mu5bqwxfh0CA98SLdrHWx4Z6Ui+N6
         N2FM3tt3t7FQw84cMXa0zkuLslMmMYASnbe5o2GzraHYJIxJx9XYaT4gB5G2y0qyCqkc
         9pSN0ewi6lB7lENkjkTGaPRaPfV3uh28NlG3Ldq0W5M0oUxACZJPIZYNgA9d52uYb3hk
         U3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689750845; x=1692342845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSuzImj8Lb6e1WbRzxnhMveJALtbCQgV6WqSEQlBvUc=;
        b=D6u2Wk3+27TUMV0rlQCocYkDKlkORfGouN07xeEGoBhbaVVT9TdUO3yy1gJVhz5JxJ
         B01AE55ZmjOaQSKGJvOEqcbEc2fsnQyMbLx5QFRZasrPKy16tYoVvL2BSigrzU43GM+c
         zH2ijku2+2mW8abotUFrePfgwxRN5ioKGZY9J410o5nw2pbuvkh/pnqO4ABFY4YuqFTe
         jcg69fvvoKSoPT4cQ9/oqUN+lcxp3ASrDEex3r/5X/cESiFcKeg3JHmoJe5utDPD6IFs
         MsnEN9s82LqPoFGS8q4dsK7DOVXpKrG9wZiZfCMruBYDxMZWhXOasDcfAYljnKFVoNTc
         Aj9A==
X-Gm-Message-State: ABy/qLbM2cda7b0GCON/CYMOoQeh/8kUkGmJHmndlGP3rVssX4rj60U+
        3v4aliNo/xjASWD16sLjRYmlGA==
X-Google-Smtp-Source: APBJJlE4Sxt9jUIzu7cgE+5AockVrEmUMad2CT7N9xqyjXG/icbCxz2K8Ype+QUrEHJMuw1mAQh1Ig==
X-Received: by 2002:a17:906:73d2:b0:982:8c28:c50d with SMTP id n18-20020a17090673d200b009828c28c50dmr1784098ejl.58.1689750844498;
        Wed, 19 Jul 2023 00:14:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id m23-20020aa7c2d7000000b0051def9be785sm2262403edp.85.2023.07.19.00.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:14:04 -0700 (PDT)
Message-ID: <9d473f0b-bd6b-f426-3bd2-2890e8a79431@linaro.org>
Date:   Wed, 19 Jul 2023 09:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [V3,02/11] dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring
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
 <20230718120501.3205661-3-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718120501.3205661-3-quic_mmanikan@quicinc.com>
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
> Changes in V3:
> 	- Rebased on TOT

No clue what is TOT. We have TIP, but you should not use it as a base.
Other used names are mainline and linux-next.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

