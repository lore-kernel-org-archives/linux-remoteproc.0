Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DC7C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Apr 2022 03:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbiDWDtm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Apr 2022 23:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbiDWDtk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Apr 2022 23:49:40 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B086E13977D
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 20:46:45 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-e2afb80550so10652602fac.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 20:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VK+Mc12IDWDoCeB4UokFVRy/0yOeXXdrFoo8csy15fI=;
        b=rj1fWjvFr6UfrBYJZaadRrPi88B/qmQLm8ZzbEv6/alcfmDFmFeBGWnL4HKOjP37Oo
         XIMpB2qQ1V8TZ5PJZgcS9t0rwYLuCx/HXeYd46dXX9BffgCtszf+ujA7bpVEDTbTllKr
         9KuNVf4yaUNy1B2uLsiF1lj0wM19F15AdtbVlPC3DYFAWn8EYd5Wb3/cp0mY5gePmOY0
         uDlSHzgYy48VHrRChwQWIbKfAU2B7/G+sVEH4wDLIPfXhyL1qCG67Gokmjruh61W/Wkf
         ArAI0RkwHAhB9loPoYk+0/fRNf1D40UaO2lsgdjDih3yTT+SgLXv2D69dVSO4yoTT1lF
         9EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VK+Mc12IDWDoCeB4UokFVRy/0yOeXXdrFoo8csy15fI=;
        b=hOg+xaMwBwCV5ZkuE6pFL8dhHKAPwblifGfUw8s4zdU8ifOx8PCdW/p4oVpMI+oTL1
         PEJfxlK/1bAD9FydKHi2Qdpjn3CjpAJnqv7k7YvoG0PL6di7qAZLhDZ+al/jVudmsaTp
         CSxNtlCAaQqV/TRZYhjy9jhQPZVkauijiEqXfYhTrVStSlHF8uqYT4fQP66skD9jt1M+
         KzBSiBD1Dy+pIJxTbKSdk91oG+bzqB1mAA2lrqbtdhS3eep9YxNUKvcBMWFX8kdT5z2I
         w4+04hnS9rJd1O1agDM0xDGNiEahfjFn6WNPSHBVMZyhpA+kXfALycGImOpQ0khTxlgG
         fOCw==
X-Gm-Message-State: AOAM530vvzy8GiYmXn+B/84yx+TDpdWjPU4nwdkymd8K06vELA+0b+aV
        rhK30lOehtgZy2Wcz/w/41OYZw==
X-Google-Smtp-Source: ABdhPJwkRUj9ppkMSZqmz3YeDFf41/hx08RbxlEXevnET+FZzlP8mrOGYwNPSqQII5QEVaDRbcIT6A==
X-Received: by 2002:a05:6870:8907:b0:e2:a4fd:7539 with SMTP id i7-20020a056870890700b000e2a4fd7539mr7629021oao.56.1650685605139;
        Fri, 22 Apr 2022 20:46:45 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id b188-20020aca34c5000000b002da579c994dsm1440218oia.31.2022.04.22.20.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 20:46:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH] rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
Date:   Fri, 22 Apr 2022 22:46:41 -0500
Message-Id: <165068558593.2759280.17055526649115604333.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422105326.78713-1-krzysztof.kozlowski@linaro.org>
References: <20220422105326.78713-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 22 Apr 2022 12:53:26 +0200, Krzysztof Kozlowski wrote:
> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
> 
> 

Applied, thanks!

[1/1] rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
      commit: 1a358d35066487d228a68303d808bc4721c6b1b9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
