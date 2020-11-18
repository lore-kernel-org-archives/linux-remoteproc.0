Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FC7C6369E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 16:16:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26BC3247DE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 16:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYXxpYOZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgKRQQa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 11:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgKRQQa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 11:16:30 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E97C061A48
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 08:16:27 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id y18so2434952ilp.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 08:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6r7TUcFKHzpP6/Vq07kiuTKHa5WLL8VvWtDcmajR8g=;
        b=TYXxpYOZkvZXHUz+FHr13epLRA8eTYHEPLQl9PS4wDZTnWizPUAMyuknStt5LjMqyG
         NMBnqOPRTdaaCvePhAiUrwLSl3siNOVzF3YYrOzlMJD/O6M78cwxsMHvzymNOqASKxOV
         FFRpuJyco3cOWn9m6pbWIhdzNhQAWJw9BDvDkQXx0upo3N9OOf0XKf26duheog80jO3L
         F7dtHLbJbYDScUEXALebiigLI4pHfBJ27dnhNnsIXSivJlT1bbp336PY9B3zrkuysLkX
         jKm7xmcrh69BtHHTT6jQQvrBqKl1mYB27fVmOIY+veCdx0Hmn/ovXa1kmycM/DXge/GA
         kbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6r7TUcFKHzpP6/Vq07kiuTKHa5WLL8VvWtDcmajR8g=;
        b=g6gR/szKqLHM1POX4dv2+dRkOaZhw7QhwFSIYpOjHqStrtVog3s5zFJGfYkYc/dcyy
         c44kfN/OtXQcnJbD5eac1CMrF/6qsloOUkAx4M/juw3Z5vpeJmaXvYKyRsONBAUg7JiS
         wybck+8JRBUYZkHsdtjodqb2X0cmg9TR+2RrAk8TWEuDNpR4E3j+j1gGVi8jEEt/XTyY
         r1ZBH1JfJ4Dgqcoa5JLRT/tsLvpWifEdPq8HwapbCv2zkHefo6gqwZgYyn2k66EcdWI6
         AwV+C2WZtmDC4bqYDb4ZN/KnxM/ysP8+ilXhMzwk8ug854Pjw5pDYNl1ZPQ2WrkFCtPY
         CrrA==
X-Gm-Message-State: AOAM5321nzyRJg97A3YQENYs7+gc6WREHF6Kv5hY092LSB5BL2BEYygJ
        cmPHuAC+Xf4luKSHH7aHeBeG8SLoqOIofQEduC7Afg==
X-Google-Smtp-Source: ABdhPJyAjgpX5wY/NtFJaXw+W8vZeafIfip+iAW8DYHfqNoE9p74VSv+qjZaJXOrdInYKGebWL5hYAgNZKvr3TfKCi0=
X-Received: by 2002:a05:6e02:47:: with SMTP id i7mr16770879ilr.57.1605716187125;
 Wed, 18 Nov 2020 08:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20201112115115.GA11069@ubuntu> <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com> <20201116151028.GA1519@ubuntu>
 <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com> <20201116224003.GC3892875@xps15>
 <50549519-d9ff-9048-a3d8-dab02bfda096@st.com> <20201117160330.GA15538@ubuntu>
 <a653c503-7fd1-7b87-88a5-88c9002ba410@st.com> <20201118000647.GA4113759@xps15>
 <20201118070836.GA19190@ubuntu>
In-Reply-To: <20201118070836.GA19190@ubuntu>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 18 Nov 2020 09:16:16 -0700
Message-ID: <CANLsYkzeEp5h_3ObJCHaa_g8snRQ17_BFNA3Am-zjM7PExgu=g@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 18 Nov 2020 at 00:08, Guennadi Liakhovetski
<guennadi.liakhovetski@linux.intel.com> wrote:
>
> On Tue, Nov 17, 2020 at 05:06:47PM -0700, Mathieu Poirier wrote:
>
> [snip]
>
> > I confirm that all this is working as expected - I will send a new revision of
> > this set tomorrow afternoon.
> >
> > Guennadi, can I add a Co-developed-by and Signed-off-by with your name on the
> > patch?
>
> You can add the "Co-developed-by" tag, sure, if you like. As for the SOB: I'm
> not sure if this is a proper use of it? AFAIK SOB is used when that person
> "transmitted" the patch, e.g. if they developed and submitted it to a list,
> or if they received it from someone and forwarded it upstream (maintainer
> case). I'm not sure about this case, but well, feel free, don't think we'd
> be violating anything since I did send versions of code, similar to parts of
> that, some with my SOF, so, should be fine.
>

If a Co-developed-by is present, a SOB _has_ to be present as well.

> Thanks
> Guennadi
