Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31512C47088
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Dec 2022 10:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiLAKyl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Dec 2022 05:54:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiLAKyU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Dec 2022 05:54:20 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245AEA0BC9
        for <linux-remoteproc@vger.kernel.org>; Thu,  1 Dec 2022 02:54:19 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id l8so1403029ljh.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Dec 2022 02:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUkuT7qxE8kAYriHyId/rWUFIG2b9T6cl4/xtuThfoQ=;
        b=vt/ZAmUlrh/n3TVWFqM1sCBqY6z1kF8RYKwBpsD+IjHIhgIZFLTK1yj3mmbIcnu7By
         D3pxw8lCsXm56THUPu817sf7S4RCY5eV+80RtSzMv/gdQx21xpYCoG7p+TEkJBdUe/ab
         Tb01K//EpKTo/raZZlSrA++FFZfXnpHLJ0LHXYumQyKr7ePErgF7XBuW8lkCKWM85vOU
         VZmrlr3tG9+pIZoCCg5bXpp8SGVK0dP9CYUE2IDF6BYwRR4zKKsrfDkq36GhRVhc/UA2
         tISXUczHUi+jgHC/z0WyBqlkYzlhrWm/t9BOwaPj+Xc3LADUrdQcfJUtOFZM7fZHwKjA
         efbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUkuT7qxE8kAYriHyId/rWUFIG2b9T6cl4/xtuThfoQ=;
        b=PcWhPhEwCmDRVZ1ozPJD7PbObspcLsydCuDlB0Wo3Yzu2oKFM4FX5IFNlNeSwwsveH
         fB/kxeerItEuKjP4yVi0RjvQugc+weeOdl3zWWsPpk5br2Kajs/i0pfA4+mYiSrYAek2
         Ci3c8bnplAkmJO2mLC0CbxSlytg2m7UAiSEm/2W4IkB0h9/40zt2ZKH4VUOIoW0e/Eii
         sxin05rtNPM1xBXCGobps5GNnVJDBDqMUWk1/0HTXEw3Sdx/xOT3o8QnLOCkK/AX8SMT
         cXnWqpUJ/l/wV972y5t5JKF8AkuROm+YTqE3EFd+Fxzv9hcg+jMALl6XcXmtkcWfjDqU
         7asA==
X-Gm-Message-State: ANoB5pmjJzTGumhuc24itCYunWG0KrLkFEQI5xUyqRW7YehmYIzkIVgV
        O1FJapZhi1FKkuJ1/Av9AJ5Jow==
X-Google-Smtp-Source: AA0mqf5hX2bRGEmUHMhFXC6kE7q+UjEwENOExnYTivLz5oSpfXpXJygPHjtuuOi0RVR/lJZ2voGr3g==
X-Received: by 2002:a05:651c:244:b0:277:d86:a36d with SMTP id x4-20020a05651c024400b002770d86a36dmr20635600ljn.288.1669892057521;
        Thu, 01 Dec 2022 02:54:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v1-20020a197401000000b0049876c1bb24sm601236lfe.225.2022.12.01.02.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:54:16 -0800 (PST)
Message-ID: <a221bcc0-9cad-e2ad-62fc-a97fa3aa804c@linaro.org>
Date:   Thu, 1 Dec 2022 11:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: qcom: adsp: move
 memory-region and firmware-name out of pas-common
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-remoteproc@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v2-0-12bc22255474@linaro.org>
 <20221114-narmstrong-sm8550-upstream-remoteproc-v2-1-12bc22255474@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v2-1-12bc22255474@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 30/11/2022 11:29, Neil Armstrong wrote:
> Move memory-region and firmware-name definitions out of qcom,pas-common.yaml
> since they will be redefined differently for SM8550 PAS bindings documentation.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml       | 4 ++++
>  Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 8 --------
>  Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml | 8 ++++++++
>  Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml | 8 ++++++++
>  .../devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml          | 8 ++++++++
>  .../devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml         | 8 ++++++++
>  Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml  | 8 ++++++++
>  Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml | 8 ++++++++
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml | 8 ++++++++
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 8 ++++++++
>  10 files changed, 68 insertions(+), 8 deletions(-)

Looks good. If my patchset is not merged soon, I will squash your change
to my set.

Best regards,
Krzysztof

