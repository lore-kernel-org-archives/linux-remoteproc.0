Return-Path: <SRS0=A3Cg=DI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213ABC4727E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 17:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D47F32085B
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 17:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="of5jzw3P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732920AbgJAR2N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Oct 2020 13:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732287AbgJAR2K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Oct 2020 13:28:10 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A45EC0613D0
        for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2020 10:28:08 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y15so4014095wmi.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2020 10:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=1M4RAfm7Ka56hTVARaFbgr0VJN7Hux9S4garFliWQrQ=;
        b=of5jzw3PMgufI53qBrC2IN+3pkDwsZMmS8MapDtIqs/jRJVAtRNIK5NaDLJTzFRu6O
         EYphTukdKvGCSmMzQwdDNTvjyg55U1+uhs4sZ7UDsqRMrfW+bdIRVAeso5kctUQ3PPmO
         fTtG7v30wu0HPu+/UspUI3agEHuhSkt+y6qOQYSr+8OqjcVQUHBPsPKO3GDsih2xLp+r
         VXbby1N/7G0XvD+/BVHbNUwjJVhsoHD5W33pcDGbhV709XEYe5Bn4+eqeuSsh6lRVOlm
         ntz4ZoUrHhH02HsIwi2Gu/8kiNiJqlqJvyX8lRrJG5U4Ab2lfTUwML+OwasgOQzqTn3E
         f6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1M4RAfm7Ka56hTVARaFbgr0VJN7Hux9S4garFliWQrQ=;
        b=kML6k8HEqIzP+JDDzOFU821j8hzi0vJdS0txQzinC8rYtoIoRssDZdiyK/sZtMVk6a
         5jD9t7gMgDSz1OJjV0PO6TJONWWPurLUQd6VLb5CEgDGnck0JO/B5GZgY6D+i2n0/1DU
         Q45wiBoSkbuxt0TD6j7UiLhwK5ezz1Aki4xGh95pbygPhCqB0QhMJm8cUUS+PHpOjRlE
         Ts9vTq7y1c1hl1BnELQw19184XsEsszVqHnHvyh8mlnjgNrKwzZSY0PiKRNj/qk76Fs4
         XXQEcTaqxWSYKR85b6SM6qsTKTDosKyV+iSnLIRekKooL7YqlmZH530ihpYVvw+DhtUT
         C9zw==
X-Gm-Message-State: AOAM531NQysbx/jffUCwhw+wUX+Hd/MU0JTpKU/4A3z08JYZXv0SKTgS
        gpxevK+VDDZNsBHRb/J6V3VorA==
X-Google-Smtp-Source: ABdhPJwyVDVxYje8TjchORDThAw8Nf2lyrEVVWCNGUtzSKY/wsPFwtKzJsKQK/RU/wWZQIwlAkVZlA==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr1060628wmj.65.1601573286992;
        Thu, 01 Oct 2020 10:28:06 -0700 (PDT)
Received: from ?IPv6:2001:861:3a81:3690:b885:8dcf:f8c6:7841? ([2001:861:3a81:3690:b885:8dcf:f8c6:7841])
        by smtp.gmail.com with ESMTPSA id k6sm827843wmf.30.2020.10.01.10.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 10:28:06 -0700 (PDT)
Subject: Re: [RFC PATCH 0/4] Add a RPMsg driver to support AI Processing Unit
 (APU)
To:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        gpain@baylibre.com, stephane.leprovost@mediatek.com,
        jstephan@baylibre.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        christian.koenig@amd.com, linux-media@vger.kernel.org
References: <20200930115350.5272-1-abailon@baylibre.com>
 <20201001084856.GC438822@phenom.ffwll.local>
From:   Alexandre Bailon <abailon@baylibre.com>
Message-ID: <8e4bb739-c3b3-d790-e8e3-dd5df2d6f869@baylibre.com>
Date:   Thu, 1 Oct 2020 19:28:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001084856.GC438822@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Daniel,

On 10/1/20 10:48 AM, Daniel Vetter wrote:
> On Wed, Sep 30, 2020 at 01:53:46PM +0200, Alexandre Bailon wrote:
>> This adds a RPMsg driver that implements communication between the CPU and an
>> APU.
>> This uses VirtIO buffer to exchange messages but for sharing data, this uses
>> a dmabuf, mapped to be shared between CPU (userspace) and APU.
>> The driver is relatively generic, and should work with any SoC implementing
>> hardware accelerator for AI if they use support remoteproc and VirtIO.
>>
>> For the people interested by the firmware or userspace library,
>> the sources are available here:
>> https://github.com/BayLibre/open-amp/tree/v2020.01-mtk/apps/examples/apu
> Since this has open userspace (from a very cursory look), and smells very
> much like an acceleration driver, and seems to use dma-buf for memory
> management: Why is this not just a drm driver?

I have never though to DRM since for me it was only a RPMsg driver.
I don't know well DRM. Could you tell me how you would do it so I could 
have a look ?

Thanks,
Alexandre

> -Daniel
>
>> Alexandre Bailon (3):
>>    Add a RPMSG driver for the APU in the mt8183
>>    rpmsg: apu_rpmsg: update the way to store IOMMU mapping
>>    rpmsg: apu_rpmsg: Add an IOCTL to request IOMMU mapping
>>
>> Julien STEPHAN (1):
>>    rpmsg: apu_rpmsg: Add support for async apu request
>>
>>   drivers/rpmsg/Kconfig          |   9 +
>>   drivers/rpmsg/Makefile         |   1 +
>>   drivers/rpmsg/apu_rpmsg.c      | 752 +++++++++++++++++++++++++++++++++
>>   drivers/rpmsg/apu_rpmsg.h      |  52 +++
>>   include/uapi/linux/apu_rpmsg.h |  47 +++
>>   5 files changed, 861 insertions(+)
>>   create mode 100644 drivers/rpmsg/apu_rpmsg.c
>>   create mode 100644 drivers/rpmsg/apu_rpmsg.h
>>   create mode 100644 include/uapi/linux/apu_rpmsg.h
>>
>> -- 
>> 2.26.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
