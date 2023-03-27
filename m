Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6839CC6FD1D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Mar 2023 20:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjC0UpH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Mar 2023 16:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjC0UpG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Mar 2023 16:45:06 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C852107
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 13:45:04 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l27so10106852wrb.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 13:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679949902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XXpwyfObowKcpaJA0Vcps/lEQSlDqJgPBHnabdYA9dE=;
        b=ZV+Wq94n+gfnQf6VM4SaSun9dqYcgE0HYiK03w4VOPgn45s6y8PCnTAzaezE08LQop
         wu3RA5wgkjnWCH5WQKnS/LQmMePGl+bJETF7tea9KQFRLWN6WaRfz+7aqqBrxLDWwOok
         i5wuxTVw9oCQqBSsTIybgZ6DkQqh7XZldehNDNlKshJ7cS1Ig5JvY+cPTefpbYYdF/R7
         lFx1oS//KMVzWyCF5qHsMuUpi8g2s6wMH+4l++U3ihsqgG0N0xQubM+rN3otL5UV6Wtm
         gctvqR22bF63D8FATQ+ImgagVcaOMebuKDTZ5Afdb5BGjp6VK38u+ykpnCgQKzbYD8iC
         4yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679949902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXpwyfObowKcpaJA0Vcps/lEQSlDqJgPBHnabdYA9dE=;
        b=26yhpZJOWT+8AIgbnK2hYVCL1aFNGDChpj9VubR9RufzhSJT9JCaSjMVBxqePJb8X5
         qFH97Ke8cHG5wxT+1FUNZ9Tqv3CawqOMmiLGjWLIjfCp/F3f7rYBJYDu3Rj+ZsqTBkxI
         06JcixV7Ej44cmCwBnyXVHaCAT9UgQyQH9is0enCJRcaVVfnCl+S3F3lfeWs4nT5+NTW
         RUIDgosbF6JwBMTaKvkjYkngHTu4kFElcVpg4ppI0MF7+osj3j1hUzJSDHjOaxN6ds9U
         3E4kKth5SQWw7uStKNIXaKdR9PZWYJCCVmYvtWtvKUlOPzk/wXO5gl56CXu9A+pFSDxS
         gihw==
X-Gm-Message-State: AAQBX9fX8ctq6BwT8B2CkB/7YYliUZr8yPNawUkSc6ggVgjdjPnX/Q4L
        VykP0Cj/0BZpIYtpPHLZfP/fEaAXgQ20Ynl1da+ouw==
X-Google-Smtp-Source: AKy350ZMyhBvj4PkrBDJXNkoE3OUydv5XuVNMSuO6RHmSUFmrOJ+S3NmUZ+XT4/2pJxtdIxe8n41OnsHneQDVphkmpE=
X-Received: by 2002:a05:6000:1819:b0:2d0:58f9:a69 with SMTP id
 m25-20020a056000181900b002d058f90a69mr2198643wrh.4.1679949902560; Mon, 27 Mar
 2023 13:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230313202655.1719587-1-bhupesh.sharma@linaro.org> <3cf8f543-d439-5d9e-5b07-08bb8991e774@linaro.org>
In-Reply-To: <3cf8f543-d439-5d9e-5b07-08bb8991e774@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 28 Mar 2023 02:14:51 +0530
Message-ID: <CAH=2Ntz3zJjFVLtCeuEkyGWjCdN=6=hNvZtYO0ScinOm9GzhEg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: Fix sm6115 pas documentation
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        mani@kernel.org, mathieu.poirier@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 14 Mar 2023 at 14:07, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/03/2023 21:26, Bhupesh Sharma wrote:
> > Fix the sm6115 pas yaml documentation to note that 'memory-region'
> > is a required property.
> >
> > While at it also mark that memory-region property supports
> > only one item.
> >
> > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof for the review,

And a gentle ping to maintainers for merging this change.

Thanks,
Bhupesh
