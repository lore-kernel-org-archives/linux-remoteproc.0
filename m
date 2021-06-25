Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4A9C49EA7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 22:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8667461952
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 22:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhFYWS5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 18:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhFYWS4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 18:18:56 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01A3C061767
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 15:16:34 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso6352721pjp.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 15:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cKLeDqgF/d1wJHQRtqrvqm49xREPWVE19Y0DcivdW5Y=;
        b=RobRa4t1Af2CzwsffYwDgaErvkEdEIQFb9MZ+PvejHsSQemqHPPP76bPWtgu8bkhwG
         qVfcsD6FoT/fMuOLFSVsms4+7aW5uIm22Dv9bPEcGBz8igDDfXyBYOArWNxiS/+JbZEm
         R0y1y4NiStCGfZTwfKj4eXMlmM8W7f3XXtNRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cKLeDqgF/d1wJHQRtqrvqm49xREPWVE19Y0DcivdW5Y=;
        b=fXs5rixlWBc3G317I/bYlcbYYKbIU8vSyS0UfZ97rAEpw52koVl4xRub6IR5qUfMek
         N+HwCIPKWNlUcmkQiFm7jXFkxKtb3QxXKYO8qoM/rAvbJ1ODVs0wbF6ym6HzmoGVagrP
         riCsw24l8cyYcYwAJmyilwhAfC6+c+T8B+bLjvzThwkpCnUgLIKAXATKTUFQgendLovl
         qLZYzTiWzDxMh89Vsjzpdm1sEftBIFiQdkJcEiK+ZXQvq3R3knwxuLKtp8vlr0FQHAoI
         zUH3hezQwmV4U/7wW4zoBz9ylRZq6bhcWnKbGg5POMs0tzcDsQJIzEZMP7tnF2qbgccF
         ks3g==
X-Gm-Message-State: AOAM532Kif9eB9QXqhYKAKPK32hy9P4YUOMrdIPsZnZCCEl/zpVATFJC
        JvX3p+FJdE1YA7fVVjHfejGxHg==
X-Google-Smtp-Source: ABdhPJzHeSkIAfh/79eXGw5+RiWEALb/cU5J9NAouA8tQ8MroXGzl3useRdbITo/FmYnxWAoXVTLkw==
X-Received: by 2002:a17:90a:b792:: with SMTP id m18mr13547916pjr.140.1624659394313;
        Fri, 25 Jun 2021 15:16:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id n69sm6950280pfd.132.2021.06.25.15.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 15:16:34 -0700 (PDT)
Date:   Fri, 25 Jun 2021 15:16:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 13/13] dt-bindings: soc: qcom: aoss: Delete unused
 power-domain definitions
Message-ID: <YNZVwOab7cX58TOI@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-14-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624560727-6870-14-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 12:22:07AM +0530, Sibi Sankar wrote:
> Delete unused power-domain definitions exposed by AOSS QMP.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
