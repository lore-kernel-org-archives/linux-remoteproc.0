Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E4BC38145
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Sep 2022 21:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbiIGVsY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Sep 2022 17:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiIGVsX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Sep 2022 17:48:23 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E6FC4807
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Sep 2022 14:48:21 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id dv25so4167524ejb.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Sep 2022 14:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+/R8XTGRvXQTqvAr8XML9xdzybq9kmOE4MfJixg2MLI=;
        b=BTcxONqs0yhXF+8dWjfiLFdOKd/xUabSvAO7NqrhEHtZGoYQ2KGmDrVRbsynKidinm
         JEl8FINmdPf4Tq54yiD9FWNgsAzRf4/kuC+9ExmgscTOpEqMq/PttvPNuuDyxQmt83ng
         SLsZ9j55agxBr/StLo4iPYaJK4rP4owe/bJT3f7m1CXVc+euPeTii0VulvZnOut4dd9j
         xtJLgk2j4oe8HF/WqJlR2A845oq9NsdBssjoS/ULF0Rkr4i2w/7ex4m3IIHKYKzvl9QH
         RTk86241OLYvGKkn1daSEwLN5wnH4IGEN13w7WyHhg5G0+D5jg7Y9mgWqHjfXi82i4Es
         hF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+/R8XTGRvXQTqvAr8XML9xdzybq9kmOE4MfJixg2MLI=;
        b=Kdl3ZI+U1GVowAnC6dRoQDwN2AKb90lVrgHt7jwUPAIZX6gVoRv4xJnOXfRPWYFkOR
         7u/kgH2UhxLw9UckglDn1C81rHDLjlL8iL1sNvl94T2yoQ9guTyw08PWNj4bql4IUi4v
         6+6NrhVm6cbuItmoqGenhJ25mIKVdkWgrKJK3Imym5qUlNCqp0dea0tcxR+t8FlRgRBa
         RJSUW87WW6Pez8U1liEYNpSpJEcIfjtI46o87+cX08UtOLHrtM9lhLVi3+qGcJeMtXWw
         PiqmeV/vEAZAp7kynzdQKukBlNNc+GOz2Sy2mOBHd0zvF9xly4Fo8sUqCMj06vV0AmlE
         7mvg==
X-Gm-Message-State: ACgBeo3/eggEo/4zhDE9qAOnZ3OKIvJQujaywiDVAsG7QBmo3rAuhu9T
        /c9IskTG2YZq0ABM5nN2Slky0Cc/PBQ+vkxam/Yt8g==
X-Google-Smtp-Source: AA6agR45YzgOvEABURG6+iYvf+WmW5H2jNOcAjhQrckuIdcu1V6NSk2KkiOw4zMEqgoSv6z8gP2a8acsKlEO6ez6f1o=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr3800336ejs.190.1662587299605; Wed, 07
 Sep 2022 14:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <Yxe20ehiOnitDGus@google.com>
In-Reply-To: <Yxe20ehiOnitDGus@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Sep 2022 23:48:08 +0200
Message-ID: <CACRpkdaDc1YwdS+Z4R1LEM=tzuMvCoy1qxWix-WaLRHsrZ=SUQ@mail.gmail.com>
Subject: Re: [RFC/PATCH] remoteproc/keystone: switch to using gpiod API
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 6, 2022 at 11:08 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> make private to gpiolib.
>
> Note that there is a behavior change in the driver: previously the
> driver did not actually request GPIO, it simply parsed GPIO number out
> of device tree and poked at it.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
