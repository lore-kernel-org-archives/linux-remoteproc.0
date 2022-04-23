Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8672C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Apr 2022 03:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbiDWDtl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Apr 2022 23:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbiDWDtj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Apr 2022 23:49:39 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A533718B0B
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 20:46:43 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-e656032735so9371848fac.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 20:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ra9WJazw1Fb231ITwJYo6ORz8hO6Lpwzm+CXlVX1y8g=;
        b=ls81e046Y329pYLiVwNLstXqUPs0QoxJgkmm8Jwi1/eMAxVPJeGRRi2Ja8swO68Foq
         j6TbsZKnPxb5ow+ubbQTvD5FkjUS0Db6yPvmZIrHN/+h6VJtioGFkBTTFV6Bqb58/A7K
         7jWxV2Ari/oJfxhfVxo8tqOe088o9SlcZ2gBVrUpL9L5Nceq8lhKSKc1zPlLWHzWHOtq
         0SJyniKHQnjkxYOlSkYay7J9Mlc17fjE29QWq8ZrGVcUR9IqW864anxqfhPJEmEX74sI
         uXfFCtEJPtBjBow0EGICmrq49pNwQ7OwIGU1krSdDIUa/ibEnBq3DmFtPD4so4Za/xaw
         xuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ra9WJazw1Fb231ITwJYo6ORz8hO6Lpwzm+CXlVX1y8g=;
        b=YFAc4QHYGf3QjfWcScgK2AnafexQcWEwVGw+ckY+trzbNIa3Flyk3P7NSh/K5XC/U5
         t/7ta/rH4Kx31RQE7AMrXUtVtldn0upira52DYSVQwq0yqXxnJd1mkkXdFI51dz4GqIt
         qSUpjce5ArndvPp19vA9zn/VeD4q4O99tfmsZYbLIt4PVcI1OIPW9J6L/iQj76NtwSkN
         jl9OQn4bqfzakNvVwHnRxgpVAQZ7uMukgVKk+ZjIjJ+/7gOlMiPGU0gJt3ipzAFJtZgJ
         vj4A7XFah6nF6MuCNPEqwPVwJNHJOp0Z8GXRVploL3P3folWJDWXWYrcZc33vhPsmxqj
         VrKg==
X-Gm-Message-State: AOAM530wkrtAP6czeSykvcb6X7Dbcvrn9aggLTrHyOC0E6eqDM4Y2GPM
        nA8z2FDkIwmNUiMXp4a1/bwVcQ==
X-Google-Smtp-Source: ABdhPJz2Ri8u50Iv8oX2URJSf7giYX7VYds+V9AepF/eSWczA+mNngCA+P4sge/OTQ2auhRzKgpvKA==
X-Received: by 2002:a05:6870:d620:b0:e9:11d4:7529 with SMTP id a32-20020a056870d62000b000e911d47529mr1100194oaq.32.1650685603065;
        Fri, 22 Apr 2022 20:46:43 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id b188-20020aca34c5000000b002da579c994dsm1440218oia.31.2022.04.22.20.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 20:46:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add sc8280xp adsp and nsp pair
Date:   Fri, 22 Apr 2022 22:46:39 -0500
Message-Id: <165068558593.2759280.1092230425379952109.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220408220539.625301-1-bjorn.andersson@linaro.org>
References: <20220408220539.625301-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 8 Apr 2022 15:05:38 -0700, Bjorn Andersson wrote:
> Add the Qualcomm sc8280xp ADSP and NSP pairs to the binding.
> 
> 

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom: pas: Add sc8280xp adsp and nsp pair
      commit: ee651cd1e944df7d1553bb2c5593e887f12d6cda
[2/2] remoteproc: qcom: pas: Add sc8280xp remoteprocs
      commit: 4e55a6cf48119243ca05c16bcb3bd3887a3c68b5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
