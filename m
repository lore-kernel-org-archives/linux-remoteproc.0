Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A11C678D5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Mar 2023 20:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjCHUlz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Mar 2023 15:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbjCHUly (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Mar 2023 15:41:54 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949D26A2C9
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Mar 2023 12:41:52 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id h14so16614101wru.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Mar 2023 12:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678308110;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hg0czcAq2mo1WyW3NPHhyOcRKW1f2YWOlW29ixlK1pE=;
        b=hWevYuCsmL1rKMW4NCY7tjVZYW8hIECXeXqZMxG6QTynKbGaP662Y4vOjPWJqliq5+
         pBQu4iFM9EK37i1OMnZ8V9zsCX/qJlhNSk4xmMp4+FgAXEdemM2SKm1eVNF5pMgmNXKn
         qM7VVv5YBKCVsG+v+APTn+kcpNuw262rbD7QgByAOcK1samv/koCc1sBq0OZhkMYzdez
         mNtZphL3kjr8mOsq1962nL9lsAV6BUFMDgMQzjTo8LY0Jnhb+yz5fhDdQiCwwz8Tnylw
         cMppxrINKjWhyXjhLvgNGGYP6sxcS2PcobJRqeQZGkzDgW7hUT8ikiFtDwhQmUQfSg8X
         jaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678308111;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hg0czcAq2mo1WyW3NPHhyOcRKW1f2YWOlW29ixlK1pE=;
        b=7hFmbINzg4l9C7czTSnwTNqVdXTe/hmDGffqkovqwg29OpDDRJdf/bfBRvduQx93eF
         08DPe8G3KPC/6f8cvtJF6HXoSJcZINngwfIl9E7ESFstfBo/xJTm8kiA+Cv5yQ6Q47hc
         Ltkmy8UulC/6c7J2bIeqC74RKeWOSkLw2lt8EiTiMciI8GZhE5LizF2nnEN2aBoTVo3m
         sOxRO7J8sFzJNHsgm8guCruDsyYVBTqFlYabuDqpN+D40LfvOOyl135AgIpo7c0TmuuT
         zuirCTh7hFrpcnglMtEU1uJOVVnc6s0TqjBh7Dha7n2uwpYW0qW2zIO9vEDSvY1FJSoe
         cBrg==
X-Gm-Message-State: AO0yUKUH2a563pvFL23YJVQdZoX/f8koS5NOIMPM7dPsFrgXSfLAyMBK
        +c6ao7Xdt4VtGBKON9iWYHuOnBAvXa5z4GcvK3C0EPzZFTtI0/RLF4Y=
X-Google-Smtp-Source: AK7set9cr7qK95JlvAuQtTXhvawj9SRPjd6mdcxJhq+VqZsrjJkpwtGHriScSe2M9aDBBHNmG42mmmneSpSYPfWmszU=
X-Received: by 2002:adf:db0f:0:b0:2c7:1745:77ec with SMTP id
 s15-20020adfdb0f000000b002c7174577ecmr4414059wri.2.1678308110694; Wed, 08 Mar
 2023 12:41:50 -0800 (PST)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 8 Mar 2023 13:41:39 -0700
Message-ID: <CANLsYkwSMpBCL_Ng9GaDXfQEUDdQ0fpwBRgNhXTcyN2+XmRK+Q@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for March 8th 2023
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v3 0/3] TI K3 M4F support on AM64x and AM62x SoCs
[PATCH v8 00/11] Add support for MT8195 SCP 2nd core
