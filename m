Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F21C43334
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Jun 2022 18:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiFXSoK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Jun 2022 14:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiFXSoI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Jun 2022 14:44:08 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF64A7FD26
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jun 2022 11:44:03 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o10so4700356edi.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jun 2022 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VX57bzNcj5z4sH662dwxPCfuAuhByjkAt4BvZ77sBWg=;
        b=MOcBReg0ICIq5qYDLdcmdE+4ehKszK3dO00drnWMdiRkCw0BWwYh0gt17NRvXenl/K
         mfDyDzCuQg6+JHfz8JSXZX5ejZDH9ogXrGpJvaI9ViY/YYne0QmIbnwIoRRRgZA6x0bZ
         8U6rllDjymhKOoU5x2gcZqNmNJ+84HkYhzgjXeT8/2OCnqYnP7eY3WUsWYbU21vrCkDS
         cfW4P5NKX1dRXAysCYYRoGECqGHnOLqbpANweOJjAcjmZ2w1s7d4joBsrHVWOx5guGuI
         U+lOSlRJnmGAbQ8lk/edWt4KoA7NaJtj536yktxmXTsmn69/UZ/I3giRSXDilYV445Dt
         70lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VX57bzNcj5z4sH662dwxPCfuAuhByjkAt4BvZ77sBWg=;
        b=lICyNP6BW3+lzLdhwRtsJFsEf1QamhpolLkmbVUYrEBOzef9ku1XMGjvySjQs7Tudu
         Lq2hN7xprdYlT0HLzid5JVPqh7t1iVp3kdt87v32eO1m2liTDu9EdE5u2nJ0v17aP1RF
         lXOT5M1GY3pGgv59M/YCrvAK2vV18/MiQgl9qWam4y4Z4fP7N/YrNP2RBx+PYAMUj0Q2
         ls5U6tXXTOUVEKUg6ZcPCrNWwtU+tjHtwWWpa91j6Ondl+58b9arq57Z4rj7erHQvtmh
         Y8wjLiyPxwh0PH7yYN/jsgNnfRtPJQXdEb5NEhNJ5E6iRHeu8n+N2Uc0DhG+KjBcoP8e
         jNZw==
X-Gm-Message-State: AJIora/G7mBkImIs3CnLlVmLz9P7VpFosQiWKsgHi4t2NyzmCj75j8d2
        6mFrZsZgrGVmPcCVTiWm+1Viy6IMmwvWbQWKNG+NwQ==
X-Google-Smtp-Source: AGRyM1tQuF2QNbugVXp1L9OpiKHyKWyjy48JI3q39qKPoOXbInafNPSi1BeW//br0G8KfiuhCGEXrSCeSeSGHiWxLyQ=
X-Received: by 2002:a05:6402:5ce:b0:435:65f3:38c2 with SMTP id
 n14-20020a05640205ce00b0043565f338c2mr581487edx.347.1656096242346; Fri, 24
 Jun 2022 11:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220624024120.11576-1-hbh25y@gmail.com> <20220624173621.GC1736477@p14s>
 <47db0cd8-c940-6e74-f8dc-8e3931e13d80@linaro.org>
In-Reply-To: <47db0cd8-c940-6e74-f8dc-8e3931e13d80@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 24 Jun 2022 12:43:51 -0600
Message-ID: <CANLsYkzT5ZROReZNQ_eYL-r49ijaZYZ5TzdMpqy1RK0_hvW3_Q@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: fix possible refcount leak in rpmsg_register_device_override()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Hangyu Hua <hbh25y@gmail.com>, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 24 Jun 2022 at 11:45, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/06/2022 19:36, Mathieu Poirier wrote:
> > On Fri, Jun 24, 2022 at 10:41:20AM +0800, Hangyu Hua wrote:
> >> rpmsg_register_device_override need to call put_device to free vch when
> >> driver_set_override fails.
> >>
> >> Fix this by adding a put_device() to the error path.
> >>
> >> Fixes: bb17d110cbf2 ("rpmsg: Fix calling device_lock() on non-initialized device")
> >
> > This is funny... Neither Bjorn nor I have reviewed this patch...
>
> It was a fix for commit in Greg's tree and Greg's pick it up after a
> week or something. I am not sure if that's actually funny that Greg has
> to pick it up without review :(
>

The patch was sent out on April 19th and committed 3 days later on
April 22nd.  Is 3 days the new patch review time standard?

> Best regards,
> Krzysztof
