Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA84EB8FD4
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Sep 2023 13:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241097AbjIFNei (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Sep 2023 09:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241073AbjIFNeh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Sep 2023 09:34:37 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7066010F9
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Sep 2023 06:34:33 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so210051266b.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Sep 2023 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694007272; x=1694612072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUvSvKUaI9jM7APVyUfAw53E9ZhyDpJtbSHLwdTGqM8=;
        b=l/cCpz4oFGpGYiRgSD2cKZwFltpj/Ame8thJsY5UzmP2fiLRPQu9uLdFL+yV32b6NB
         J98i4xxn4eBXD/wHgagujTBqGGaT7M6qtNiKLEcxyFYZdPbPZCk+VFkK1UXP2Bns2w6F
         HGU22RsQ2sMpbBNIDO+pEyI/usVMvfpXYU/x5nWbqYiTVvtf+KlM5SQD1QY9WCAEkMg0
         0SnRpvEsAm3i9xk9kjMbUuR5inM6KsVTU2hBDbQH2bO3Z1SpkRshaLi4sv2U5OXJoSS1
         hy/BcPjjrM37Qt1BeFSwn1M3WgN6OaylYADxNviYIJgKBHa8tC8dmhgcTQRLf+zh2Jnm
         523Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694007272; x=1694612072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUvSvKUaI9jM7APVyUfAw53E9ZhyDpJtbSHLwdTGqM8=;
        b=b+/cI+JuCNHZVUuDlPqorASHZIQCwT1UYKQ6IPNKig9EWVY5Y/UupQGt9g8G8T3pI1
         3Rtrfm9/bjjzQXF1Rn/+1ZnkJ0dRb16VCWxwtVNcYawtQJiBpo1KopJcGD8ScI7qsBRt
         hEUrh7/OVSYOOV64Jer0fXzeWacTRBKcLEBWheQXQ3SfnM/rCUmkraKQzsE510/qzQcQ
         usxiv55mVg+PjArJ+Hm2n8653q+WwYulbGsqlqwQVq1nXqsPRBkQHujG5AJJ6zXJVO1g
         XBNc1gY1SfPkkfMnuGTyHZbJvRwNWcGWDN6kIWuepaTVXn80yNeTdj6dpNoREdFr4CPo
         k+jg==
X-Gm-Message-State: AOJu0YzkVcxIY0Ruy3hj+gJJP/ZTNA+MCenw/nYZIr0s4FsCgLunpT4p
        wYhDj9DBTBLHhTcjDxPoy99zVA==
X-Google-Smtp-Source: AGHT+IH0ewRIkYKg0go+8hBWldfPMNlrRyX/G/TxBFdICsMBmJS+8NZ3XjbC8n+zTti1vGaHWz2XGg==
X-Received: by 2002:a17:906:3003:b0:9a1:eb4f:56f with SMTP id 3-20020a170906300300b009a1eb4f056fmr3273088ejz.13.1694007271951;
        Wed, 06 Sep 2023 06:34:31 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id p26-20020a1709060e9a00b0099cfd0b2437sm9070145ejf.99.2023.09.06.06.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 06:34:31 -0700 (PDT)
Message-ID: <04bf71a9-cfa6-60c1-ecbb-c8e2865d8d15@linaro.org>
Date:   Wed, 6 Sep 2023 15:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: sc7180-pas: Add
 ADSP compatible
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230905-sc7180-adsp-rproc-v2-0-8ab7f299600a@trvn.ru>
 <20230905-sc7180-adsp-rproc-v2-1-8ab7f299600a@trvn.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905-sc7180-adsp-rproc-v2-1-8ab7f299600a@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 05/09/2023 12:41, Nikita Travkin wrote:
> SC7180 has an ADSP remoteproc. Add it's compatible to the bindings and
> refactor the schema conditionals to fit the ADSP.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> v2: Refactor similar to qcom,sm8150-pas.yaml
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

