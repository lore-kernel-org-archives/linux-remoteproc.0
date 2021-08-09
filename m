Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73925C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 15:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5828561019
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 15:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbhHIPYf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Aug 2021 11:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbhHIPYe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Aug 2021 11:24:34 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8307DC0613D3
        for <linux-remoteproc@vger.kernel.org>; Mon,  9 Aug 2021 08:24:14 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id i9so11884563ilk.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Aug 2021 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=N0YrjF4yal21NO5kIiR1rHPNaxzJuNy4C2enzlNDi1g=;
        b=gw1j3e8TOyWGsp4NesgHxod+ewhvgFPRkJtYv87LnI/4VQRo9lTGKwjEx2dOBHfY3U
         ATgzBtZ90sBQgoGzPEgX9tdL6+aq+mYxaxWA73km4zBqLePJ2Uv/V73usTnRkTHQ7DKg
         UUEtanyvcv9vd/czrgKrSK491NUOv9xHH8XQACxuXLWzrv7gKJS2pdhTZDYx1vmXzVZO
         UQn93xFBJUVLm18682PNnfSAjB+fJh6/FcslY6ZiRBEUX29wp/yg7DCOp/wSNFuHRTNi
         asNk9qmQwRqMMdHJVKCeHUj/oH2eseXrYJj6M7HOFN66DwYN8hjoXr3P6dvYqqfkCGMU
         eSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=N0YrjF4yal21NO5kIiR1rHPNaxzJuNy4C2enzlNDi1g=;
        b=Gz0geOxchzAUUsi4eOCbaYu9g1MWIo/SkFEWTf99U2RK143IOQ+iILKh9ezg1eI1wT
         NJ9+1UXOkld22WXp8MKWYe18yh8OU9dY38DYFt4THuWTN+iICjZ+63jpQijTIyNtrqCO
         Y3E298uo4U8JAdUfEPmmkO4atxPeRRr0ZjqsOUzRMKDepYK9lI6BQ49Zbv8l8OgmJGJr
         VyIFzK5cunqZc9ghlXbt6rdx9uu+zVWqgTIkizhKONQcKgbTm2Alksv0iOpFvalMuiA/
         V3PcKK1177Lh633DNeANUUvUIHHbtP1cC7XqAUerTeDQIGnRbHTYLQ/9TYKs6Vmu4Uyy
         9AHw==
X-Gm-Message-State: AOAM533+0fi51yTHdCy7xmqFbMy0h8guwHgjZTW4mVkMyCe4/sdxgvPc
        fVCKHl6OWnslVJaYm0K0WibA+bHiapoR7A==
X-Google-Smtp-Source: ABdhPJxemqhgLiVoeC2FVjPST5MIl2eWpJzbeHuf+7YKgi+ZYvLu/VznCnGzvLz9/Q+OjxJhz8sbHA==
X-Received: by 2002:a05:6e02:1041:: with SMTP id p1mr126061ilj.125.1628522653721;
        Mon, 09 Aug 2021 08:24:13 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id q10sm10680097ion.3.2021.08.09.08.24.12
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 08:24:13 -0700 (PDT)
To:     linux-remoteproc@vger.kernel.org
From:   Alex Elder <elder@linaro.org>
Subject: Remoteproc and system suspend/resume
Message-ID: <83426563-082f-5fee-4c25-b8ae46ff748f@linaro.org>
Date:   Mon, 9 Aug 2021 10:24:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

I'm adding automatic runtime suspend/resume to the IPA
driver, and it interacts with a modem (qcom_q6v5_mss.c).

One of the things I'm trying to avoid is errors being
returned from pm_runtime_get_sync().  If I ignore the
possibility that my hardware produces an error when
powering up, the only condition that I expect could
produce an error here is if the *system* is suspended
at the time I call pm_runtime_get_sync().  And I would
like to preclude that if possible.

One of the things the IPA driver depends on is remoteproc
"SSR" notification; certain activities are triggered by
modem starting or modem crashed/shutdown events.

In one example, I need to call pm_runtime_get_sync()
when a QCOM_SSR_BEFORE_POWERUP notification arrives.
That notification is implemented by ssr_notify_prepare()
in the SSR subdevice, via rproc_prepare_subdevices().
That function is called from rproc_start() as well as
__rproc_attach().

Similarly, upon receipt of a QCOM_SSR_BEFORE_SHUTDOWN
notification I again need to call pm_runtime_get_sync().

It would be nice to know that the system was not
suspended (and a system suspend will not be initiated)
while I'm handling the SSR notifications.


I notice that rproc_report_crash() includes this:

         /* Prevent suspend while the remoteproc is being recovered */
         pm_stay_awake(rproc->dev.parent);
         /* . . . */
         schedule_work(&rproc->crash_handler);

And the crash handler work function contains this:

         if (!rproc->recovery_disabled)
                 rproc_trigger_recovery(rproc);

         pm_relax(rproc->dev.parent);

In other words, if a crash occurs, system suspend is
prevented until recovery is complete.  And ultimately
that means that the SSR notification for a modem
remoteproc crash will not be run when the system
is suspended, and no system suspend will be started
before the notification handler completes.

But there is no such system suspend prevention in the
other cases I mention (attach and firmware boot).  So:
- Why does rproc_report_crash() call pm_stay_awake()?
- Why do other functions that cause state transitions
   of a remoteproc (like the modem) *not* call
   pm_stay_awake() until the transition is complete?
     - rproc_fw_boot(), rproc_attach, rproc_shutdown()
- Should all remoteproc transitions be prevented
   from occurring while the system is suspended,
   and protected from interruption by a system
   suspend while the transition is underway?

                     -Alex
