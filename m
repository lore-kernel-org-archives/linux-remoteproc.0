Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163A9C83F3F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 06:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352393AbjIDGnA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 02:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352391AbjIDGnA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 02:43:00 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4522813D
        for <linux-remoteproc@vger.kernel.org>; Sun,  3 Sep 2023 23:42:34 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4bdso1407925a12.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 03 Sep 2023 23:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693809753; x=1694414553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SFckxZovG8hERZczdTqOPoyLhqCtfVRQH4CiHaOqB78=;
        b=IonUCen/rFOojAKQBKV6SHCqEr4ArA7QcR3aSjRzB6FtO0oIKIPMYEsutsYoHcUFGL
         wiNsVkV/ykjNGUQ5y8TJnujaaz+aTDwvM+zuz3pPgtZcJV/jweajMoC7zDhBdAeCRnm/
         IvY/ZXyc9DJFcq7HXJ/iuin4fE118uUu+OETeeLKNCBICIivcPP9xV6+u5Kq5I+lTSaH
         RbGksDw9jYRpj8RwWxb42Hus4hWjr4BrmEWSOEYAZfL+iejE+ATgGYLTsnTaUNc+rGya
         eKY6Vr4QGC3jVQrNtfCuIRF7eAreZyt2xey5tYJasvZYFs9i9xjIx/E2iT3tEQtm11HX
         bOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693809753; x=1694414553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFckxZovG8hERZczdTqOPoyLhqCtfVRQH4CiHaOqB78=;
        b=P8sDMxBOUe/3sOB4LfddD8WWEOizkd7aPFdK/waKxkIpzcrJfuQzuKsjzDi7YBkd2V
         AQl45hoM/xzK1sGwu1riQDAPvFXb5H2wYe3hcY6hh82UtyhmMAAhS6JJrQ7y7VzqrwH+
         f4158XAFkPRkBW9P6uD3feDt3Rqh7KyIgu1Bk+jwl1f9qqJc7oLPsBeotGK0XE25L8jo
         z/ttZEAv7IiTcg9aGEN68ys6nzCcuQXFzj/rIZqLcRVTcjBGbScwv/Va5VDl5CT0p0DY
         qSEpqjIJbUrSbUGGuRX0i9SagxGj7tcGpY/ve+W2N105HNABbEmh62jfNz2nmQFIMC3I
         IrbQ==
X-Gm-Message-State: AOJu0YxeTxvsMRrXH/ox/caCQDET0MldTRZONRvxMScun8jGTBZ5JTr2
        p34M9OklUI+I8bTfPvmGAnVvxg==
X-Google-Smtp-Source: AGHT+IEuNvN4d3PTnjOQ2RILNCS2fZinvtPKWXogUUEa2JKDXSOuIksDgmvT3W2lRw1o88Z0VvPDrg==
X-Received: by 2002:a05:6402:5170:b0:522:ab06:7213 with SMTP id d16-20020a056402517000b00522ab067213mr5669004ede.27.1693809752773;
        Sun, 03 Sep 2023 23:42:32 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id r7-20020aa7cb87000000b0052996528b81sm5300883edt.45.2023.09.03.23.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 23:42:32 -0700 (PDT)
Message-ID: <b53d89a4-1024-1961-f95a-c9fcd97aaf79@linaro.org>
Date:   Mon, 4 Sep 2023 08:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] dt-bindings: hwlock: Drop unused
 qcom,ipq6018-tcsr-mutex
Content-Language: en-US
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
 <20230904055010.4118982-4-quic_viswanat@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904055010.4118982-4-quic_viswanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 04/09/2023 07:50, Vignesh Viswanathan wrote:
> Drop qcom,ipq6018-tcsr-mutex enum as this is does not map to the correct
> config for IPQ6018. IPQ6018 will use qcom,tcsr-mutex compatible string.
> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> ---
>  Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> index ee2726149cf3..a595396fd3f9 100644
> --- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> +++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> @@ -22,7 +22,6 @@ properties:
>        - items:
>            - enum:
>                - qcom,apq8084-tcsr-mutex
> -              - qcom,ipq6018-tcsr-mutex

NAK, this is a correct compatible for IPQ6018.

Best regards,
Krzysztof

