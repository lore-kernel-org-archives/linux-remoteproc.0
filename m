Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E05C54EBC
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Jan 2023 14:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjAGOFJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Jan 2023 09:05:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjAGOFI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Jan 2023 09:05:08 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6756E419
        for <linux-remoteproc@vger.kernel.org>; Sat,  7 Jan 2023 06:05:06 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id z5so2641572wrt.6
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Jan 2023 06:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOJ9jBAr8EM/qZhGcPKg/28tNVL1EhgfIU/MStrLkiA=;
        b=zOKFtZTrZcPCFOYIns7I8L63CLCFHBOM38x3xZULXs6Xi253rPRUOFLtUi/WfA3yFE
         cXPQnSrEK4SKnIhoKyR3Yh7LbF+d8Zq6IoRIWhvABerGxyMQx5d4GLj+sbCXjikQIeS1
         0T53ZXBhUSVmMCgMGs2Q5cftMtAkm9D6XnUsywL4tMnNg9Gw4KTbCRTRUjCe25q6mlXW
         nk5M6dz7GQ3UpU9rpmEfm644LJH1K5Wu0Sd2QDZqKZLtZjWSTBfELCDCbfhE6w+F2b/i
         wWuaWibDF9i+xSqJsS6nRhdc8z74r2lRCdhUyJD78zMCb7zSi34hacSDI+HRxvl3qP3x
         YmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOJ9jBAr8EM/qZhGcPKg/28tNVL1EhgfIU/MStrLkiA=;
        b=jtp5X5UVpK+zUKHx65BfKvCYlKZ6xmsUInJKczi5fn+Fi+7MuFQLhqKMo7WsQ3BYYy
         4LP5xg/lvE6tx2UsPFVQmzQOpw1AF82REpEIvLLfjPNQze0nwG/FBu2SFUo3W08dBGZn
         H/aRhRxvtz5g9n6Ds8HW+/w2kqrpSX0W1nFuTD+Hogxkdt1YW+Itz5WzWV9ja8N+jfCy
         gEC0brgff5OwcqrKCE2tZEkS8v9PL3lK8nenzQ3rEfijOoU3C9nn/YZtuntqo2ec0O/j
         l7VhZVqjv04h7eClJVR2df/3XVzhu3oyh6f0nASNfqMINpuKj6zfHB7JcnyY9sMpjUmE
         s2ug==
X-Gm-Message-State: AFqh2ko0tFESAuATZLcNfnBhrwR18Wu9OgULPgq8TCuVfp5fIBsKvoT4
        oIq6m4omgWKuBnMosv6e1fhoAw==
X-Google-Smtp-Source: AMrXdXsX1CocpfHnrpgfFQseDjTvezF1FvpnDpBU0nSsT6ASpWYxMn5As7IOsikN961m0WRp4/ZCgA==
X-Received: by 2002:adf:e34e:0:b0:242:ac3:87f4 with SMTP id n14-20020adfe34e000000b002420ac387f4mr39038652wrj.50.1673100305445;
        Sat, 07 Jan 2023 06:05:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g1-20020a056000118100b002755e301eeasm3877973wrx.100.2023.01.07.06.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 06:05:04 -0800 (PST)
Message-ID: <61f05268-6b7a-0884-c885-1b737d3ec5b9@linaro.org>
Date:   Sat, 7 Jan 2023 15:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8150-pas: Add
 SM6375 CDSP
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230107120623.1903056-1-konrad.dybcio@linaro.org>
 <20230107120623.1903056-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230107120623.1903056-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/01/2023 13:06, Konrad Dybcio wrote:
> Add entries for SM6375 CDSP, as it's essentially identical to the one
> on SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v1 -> v2:
> - Rebase on top of recent changes, move to 8150 pas yaml
> 
>  .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> index b934252cf02b..082ae70a3fcb 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,sm6375-cdsp-pas
>        - qcom,sm8150-adsp-pas
>        - qcom,sm8150-cdsp-pas
>        - qcom,sm8150-mpss-pas

I don't think it is maintainable to keep sm6375 once here and once in
sm6350 file. If it does not fit one family, then probably it deserves
its own file.

Best regards,
Krzysztof

