Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80EEC77B7A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 May 2023 11:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbjE3LCB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 May 2023 07:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjE3LCA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 May 2023 07:02:00 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B98BB0
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 May 2023 04:01:59 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96f850b32caso837155666b.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 May 2023 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685444518; x=1688036518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqiWOENTW3CXASLaJvgBSl36DYvfzKWd32k4rlj7DMg=;
        b=H5RC3j865FAkcJKpJ/ImrNlvbdo31/emM6ok7cpJchEr0x4ZdnJzW73LU0aJHGocVV
         iXaCR0WcQn3vCAOZafxYLlnBmYIwdwfhegTN3434QMDH0ofJnlsFWSY7NhSZdrmeMK0P
         zE/7APOBqhl3uaLroZfRizOOBWKccBdmyEl4KH6C6tSg5NLHeuWwdEFOjont8awy7+yz
         6Z3f8LrJSxqkVXGzlP/qlF21fPBe0wBiKcTlsTC006jJMmYxHouEfwhb7Zbj/lXLA3G6
         hT3BarKJkSqwZnPwBaK/Zz+2hGEJVD1BX4TuH8BQaKJKOLKuVfVXjeencjTVOumwne2T
         Vqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444518; x=1688036518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqiWOENTW3CXASLaJvgBSl36DYvfzKWd32k4rlj7DMg=;
        b=KBuTjO9XpyhJ6CgsTsKQSp87u5Y+s4E+qWT192Od50y7GZK3Ck8LxKRfD/hwJbQJA/
         kLDt3t/GuEqqF19+OmzsWoMxk/j6cXVb5e9CxizJAy9oxg/+jxI6/m4SbNaZntJL7L+A
         yfEdoxo19UtJThfelQVhKiHBUr3Edzto7WmomvqyXZ1oAMVXHbvrtdclSjlkBwqIaAo4
         6OE4xnRSSVOFREHWrPkU9jea5a6LxqTbYW93Zol6DyvZVK6jB9M2ajy5OaK5zaiO5RwA
         mR2/0swsX3oMarxThCKpCr+70AMuBjUWHTfknLcAms/9UTNZSLClRXKDt0thhV2Q95gh
         jUTg==
X-Gm-Message-State: AC+VfDyuKKMnrphEKiHsQscRWVq7/5w1XKcgEh0Ba1dR8ioml1kvWqKb
        f6aKbp9LePoXAVd1gaiP2cSZ5Q==
X-Google-Smtp-Source: ACHHUZ7EdPsQUATI97T7TTNuUDnDStW+T3FEAeWPo+yfm29Wp4MOkToA00AJYrowOetUBHDSlDJRIg==
X-Received: by 2002:a17:907:2d9f:b0:94e:e97b:c65 with SMTP id gt31-20020a1709072d9f00b0094ee97b0c65mr2301544ejc.60.1685444518085;
        Tue, 30 May 2023 04:01:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id kb9-20020a1709070f8900b00967004187b8sm7195515ejc.36.2023.05.30.04.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 04:01:57 -0700 (PDT)
Message-ID: <514a9e26-aeb9-ce05-1055-337646098ec1@linaro.org>
Date:   Tue, 30 May 2023 13:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 04/13] dt-bindings: clock: qcom: gcc-ipq5018: remove q6
 clocks macros
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jassisinghbrar@gmail.com,
        mathieu.poirier@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_eberman@quicinc.com, quic_mojha@quicinc.com,
        kvalo@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com, quic_varada@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230521222852.5740-1-quic_mmanikan@quicinc.com>
 <20230521222852.5740-5-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230521222852.5740-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 22/05/2023 00:28, Manikanta Mylavarapu wrote:
> Since Q6 firmware takes care of bring up clocks in multipd
> model, remove bring up clock macros.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq5018.h | 21 --------------------
>  1 file changed, 21 deletions(-)
> 

I am fine with this if it still compiles... I have doubts about it,
unless of some depedencies (you mentioned three !)... but then it gets
complicated.

Keep patches doing same logical change in same patchset. This dependency
dance in recent submissions is making things tricky and prolonging your
upstreaming process significantly.

Best regards,
Krzysztof

