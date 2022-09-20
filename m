Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E217BC6FA8B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Sep 2022 09:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbiITJzK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 05:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiITJzI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 05:55:08 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71D632EC9
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 02:55:05 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z25so2898024lfr.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 02:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=z8BAJYzTxwQkxNTXquMiGdFp81D/pb66WDZUNPfEkuI=;
        b=QbIkT6i8bBtZZ9J0/CBwrNYeWNn4Vfyfkla9VK1KicPGWCR+A+KtPlPxLNE3cV9ZYR
         1jdVSRb+uq8bN/5IeDfvyl/0VYd+zDNX6GaQtHUwAG/xGpywDYFduE/qQIvHl4tDbnRx
         oXkcNteH6ch31/i0t2SqUEu76Rsck0qWxDrHoA5eqGlEHI1Qfuj+MyKVm77GotH5BWE+
         V1VgwQ9R0amuS1Lt593rAeaU/te68SuZ3yAfdYX8s4zHDDjHzjAuVgPZw4WQbwVeYeNj
         TPxBj2Amda3YS83HArpE4AH/lFQoMhvp0Ix+XVcyNPC+RNtOPDlbcnnBT52mCUrSg1V4
         VqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=z8BAJYzTxwQkxNTXquMiGdFp81D/pb66WDZUNPfEkuI=;
        b=648m+YYiqTH2CIdFEbQ9mQOOaNzyPX9Fc0VynjSRlNzk+bvFETOi9UUHwqrccEHoVL
         FhRJV5LnWja4FvBWMK2EIxKfptPQBODqnzt7q3Uk7LDd5s/Dg6idDaiF4LlIC8c2M0SH
         Trsu+JC0GxiM2Z74AZNyrcRyhXfLr7nDuf9kW8D8OSmLmTP/IV6vdtjt93/g65+ftcBY
         uQyVioZXNaTrFiTw24ptY+/u2UiPqJITKcK4ePXzpVKLSaqQ0zMD9+MNlLX+p1SwCNgE
         vDtUAdHe8Wo0RjDLF2zkHTZ07IfhOFDiVTt15I8Hoz7g+OKANrXu0FlAhnFXvL57Qkp7
         5U7A==
X-Gm-Message-State: ACrzQf30j08v+Xf4XoPHikaZSXJLS+2KtVSEs1xLCDLa+QdxMyK88Stw
        hOJchetpuNDIkNteiMu1iopJRg==
X-Google-Smtp-Source: AMsMyM4sEHNH6e1YvKrEnI0IOW4O9mXySnDeH1kJQZdElA+uK7gaUttz+o+Kuo6RtBN7V0VXp959eA==
X-Received: by 2002:ac2:51b8:0:b0:497:ac71:736a with SMTP id f24-20020ac251b8000000b00497ac71736amr8334735lfk.510.1663667704293;
        Tue, 20 Sep 2022 02:55:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y15-20020a05651c106f00b0026bfadf87e3sm186923ljm.20.2022.09.20.02.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 02:55:03 -0700 (PDT)
Message-ID: <d1c6093d-5f3b-176e-56d6-a46af4c13c5a@linaro.org>
Date:   Tue, 20 Sep 2022 11:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/4] dt-bindings: remoteproc: qcom: wcnss: Add
 qcom,pronto compatible
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     andersson@kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220920030316.1619781-1-sireeshkodali1@gmail.com>
 <20220920030316.1619781-4-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920030316.1619781-4-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 20/09/2022 05:03, Sireesh Kodali wrote:
> This is not a fallback compatible, it must be present in addition to
> "qcom,pronto-v*". It is also not documented in qcom,wcnss-pil.txt.  This
> is the reason for documenting it in a separate commit.
> 
> This compatible is used in the wcn36xx driver to determine which
> register must be accessed. However it isn't immediately clear why the
> wcn36xx driver relies on this extra compatible string rather than just
> looking for "qcom,pronto-v*".
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

It's a v3. What are the changes?


Best regards,
Krzysztof
