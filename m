Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB459C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jan 2022 21:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240510AbiAJVKE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jan 2022 16:10:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240728AbiAJVJx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jan 2022 16:09:53 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103E0C061748
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jan 2022 13:09:53 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id w200so5077420oiw.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jan 2022 13:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=B8Wl1/0bYCLBh9KqS7zg3u3DS1RzQkdf13GtspqUjvQ=;
        b=dSnhflHblnBTSid8mWTYk0a8FMa/B+P5wdp8qpMAVbJShFtNIH2UbvuJulg75r9p8U
         20L7parFFg/RtcPpg0iNhmr+2bRcao/vDiJnUk4vmDfVwyV0+ClRGbQDrxYdo4gKRgWM
         gNwtJ+MX8N0K1gbTd0Q+n7Sj6jVXLntMTPQyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=B8Wl1/0bYCLBh9KqS7zg3u3DS1RzQkdf13GtspqUjvQ=;
        b=3KkmnXmZn8bncI5jMNLfBi6YSYHkcahh9cR1EZprfnJ/pBX8Qz0+tefzZoK/9ePirL
         sb0FLaTEcuYvHpgtCykz+ltt4hkJDsGC738SgRcBnwQM1ALifE67am1G5CKxZqvgmFBZ
         NAfftBTbLBwmGU+WUmbJlQv46ujhqSiyFgAl/+EDTt1y5pSXrrlKzU74n72Tuq6RYnzi
         0QR85Gx8mFXHVO61OCUdOZO/0gQMT4Hf86rH63hcmqpLf2qMoLWY713iRxJZHAoEzsSc
         lRCAAKDIhxyozGQvhlJ6EP09ii3jGDLZ8PqwBi5BQA3h9ZeK/G+ooDuof0Gc6pMjm0NO
         iiFw==
X-Gm-Message-State: AOAM531l2RNe3Ks5taaFRzIslikplS1fVoShViwzs90scwcl1jFZvPYQ
        uG6CQyXtO13HFxLi9RPjy2XFVq+ZvkS9ye+q3hmwew==
X-Google-Smtp-Source: ABdhPJwejN3MyvH7ILYNTDkIH/wZ7fWRrkpxLcDY1zkCrPhyq9EpbZgVh+JKpD1vyKcYODwPoikaF7z1RMjK0aeaiOw=
X-Received: by 2002:aca:a953:: with SMTP id s80mr19911594oie.164.1641848992455;
 Mon, 10 Jan 2022 13:09:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Jan 2022 13:09:52 -0800
MIME-Version: 1.0
In-Reply-To: <20220110104706.v6.2.Idde68b05b88d4a2e6e54766c653f3a6d9e419ce6@changeid>
References: <20220110104706.v6.1.Iaac908f3e3149a89190ce006ba166e2d3fd247a3@changeid>
 <20220110104706.v6.2.Idde68b05b88d4a2e6e54766c653f3a6d9e419ce6@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 10 Jan 2022 13:09:52 -0800
Message-ID: <CAE-0n52qZkNQzQHnWrm=JCxoEYvEm-aWrtDpi4q=HEWSOxaT+Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] rpmsg: char: Fix race between the release of
 rpmsg_eptdev and cdev
To:     Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Matthias Kaehlcke (2022-01-10 10:47:37)
> struct rpmsg_eptdev contains a struct cdev. The current code frees
> the rpmsg_eptdev struct in rpmsg_eptdev_destroy(), but the cdev is
> a managed object, therefore its release is not predictable and the
> rpmsg_eptdev could be freed before the cdev is entirely released.
>
> The cdev_device_add/del() API was created to address this issue
> (see commit 233ed09d7fda), use it instead of cdev add/del().
>
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
