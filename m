Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074A7C53210
	for <linux-remoteproc@archiver.kernel.org>; Sun,  8 Jan 2023 04:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjAHEaq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Jan 2023 23:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjAHEap (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Jan 2023 23:30:45 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9EEBEE
        for <linux-remoteproc@vger.kernel.org>; Sat,  7 Jan 2023 20:30:44 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-482363a1232so73323267b3.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Jan 2023 20:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kt9p2IMAmrSyERl3/U7i0v+zp4np9fq2eUdHApu7VTU=;
        b=pT9oB3gCOh9Olem1CL4ZptIfhZu3ih/w0CHNl5txBD6uDO8QZc5/YamNprQliZoQdn
         GpMmZH9faKqCTcf00MjGdwIdvu2ugw44fia5VL8KMrIBfoKtwN6FKALj0Yc7NuCpRIU9
         UyOZgNyiirnDctamK78u0sveWraO+Ewj4rbQI6m6+7eNdqtDIn4bSHzPaGobOvTv36IG
         9Uz7PKhWZr6+2WCYNS0TMyIz8TzykOMZv+mQXS9+6awNyr5m015mtPN+8GIMMfPj/EoB
         EN/4PcxZ7z/SYHaX/bXg7leyo1MY2W6JXSP8RDyPe4EDyO6YH98fFqG19PNe+Tx6CerP
         5xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kt9p2IMAmrSyERl3/U7i0v+zp4np9fq2eUdHApu7VTU=;
        b=Sxyt1SZGXoLIq/my0sZgX7csOMM5bonK2pi0pGwWPcVImCgMjH/lJKoJIZzayVpQPd
         sw1qBbGWFJjoV0muThR5H++jvf6JuWMuy4Kwr0Y59clpOB0oM6Rc9AssBTDypYWAUbAZ
         /dzBJCosaCzeK0tbBkigPjxVue/tLMIo1js7lIsKsYbo6NJw2BABy+YGDLf5ttFKmIYt
         jROLDzVWYNsyDJk/fsQtJjl4GYmbhZLZF9akZDTfQb6001krbdi1P6IPKdFO6CjAh4p1
         pIFotEr/1GdTMNa1GoDxlXws9OVgz5e5l3FCBlQA+dE4jRx/l5Rx3Yn1/KQrv9oio7L+
         yC7A==
X-Gm-Message-State: AFqh2kqqVk/NMp4oqxd37T8fz3CGNzelLyzfbTzAbirNM0lP3FYQ7fYv
        YZLrk5QeNmavSvaqJ6mqLCS0TsgbommqY+iMazqDbA==
X-Google-Smtp-Source: AMrXdXupKOrz3kfWpdoIVvgaHEW/1EFkbbRv7qhXGij2SiXMJYFOMgAAq+lAoxnV+wvlFubmGSDdQAW+GkFJDC7oHQk=
X-Received: by 2002:a81:6702:0:b0:477:b56e:e1d6 with SMTP id
 b2-20020a816702000000b00477b56ee1d6mr5927657ywc.188.1673152243641; Sat, 07
 Jan 2023 20:30:43 -0800 (PST)
MIME-Version: 1.0
References: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
 <CAA8EJpr0A=VjWEv6NPaZ-t_3TgNaWpsVO8_inJhxqoThry_zZA@mail.gmail.com>
 <17e2d99d-31e5-b29a-e729-4f4d70b2efbc@linaro.org> <CAA8EJprcVT=vyEhU0Nbtr4Wu1YxcGs+NLNxtpTaFtaJSTqvgYw@mail.gmail.com>
 <3afcb445-7a62-ced7-eb54-1b2d8a9085ce@linaro.org> <CAA8EJpp8jnZV1Wkw1T6g95s0QNZLKKN_ve+tqmNsFVCFo0wudg@mail.gmail.com>
 <dd8ce88f-63ab-274a-7992-268003411da1@linaro.org>
In-Reply-To: <dd8ce88f-63ab-274a-7992-268003411da1@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 8 Jan 2023 06:30:32 +0200
Message-ID: <CAA8EJprG9e_wHrM3BNs5bc+8dFbB22iYbJk7MWb8SZwuF=s5+w@mail.gmail.com>
Subject: Re: Annoying message on the console for the db845c board
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, 8 Jan 2023 at 00:51, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 07/01/2023 23:07, Dmitry Baryshkov wrote:
>
> [ ... ]
>
> > I've tested the v6.2-rc1. With the firmware from linux-firmware I do
> > not see these message. I posted the output of savedefconfig for my
> > .config to https://pastebin.ubuntu.com/p/t4KzQ4QWSF/
> >
> > Could you please recheck with this input? Maybe something is missing?
>
> Yes, with your config, that has been fixed
>
> Thanks!
>
> Would it make sense to ensure defconfig has the same options to run this
> platform ?

Yes, please send a patch. We might have missed something in the defconfig.

>
> BTW I noted a lock issue: https://pastebin.com/274Xz7Aa
>
> Thanks again for your help

You are welcome.

-- 
With best wishes
Dmitry
