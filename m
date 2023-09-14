Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33487EDE99C
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Sep 2023 09:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237028AbjINJGs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Sep 2023 05:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236929AbjINJGr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Sep 2023 05:06:47 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C051FC6
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Sep 2023 02:06:40 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31c93d2a24fso604056f8f.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Sep 2023 02:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694682399; x=1695287199; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEtGuZs7sLu+quZuz0q3jeU9pqgU3Amd+Csaix5jJRY=;
        b=FuqBdlvSfHfXDpWcAF2QnEUg/sFK1p74HyslWqMFgwyRoLFg383F5p92kHiCF2DOCP
         5HoK4GxVJu7HPB3WpKeb+VBoJ6LMOujf/Slt74AdEG33DWXGnmxDKK4oJN7Vf/9VI8HD
         FfbSr3qAVjKiA8J4Fd0Osn+MkTjf4T3Vh0CfHppmiQm1s+lmCEOPF4jiNEpmZeNEYmKv
         9WLx6wukINhJqCDmAD6KUlON6NVK576Z1KR6oj27WFZ0nzJxarQvBOqyXXub/gJJrLE0
         eTC9AeOHto5REVG5uITHik1nmeVxU/JjyV+cjUSo3GCM5bng1dirM2JQQvLJnMCwX5E/
         QyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694682399; x=1695287199;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YEtGuZs7sLu+quZuz0q3jeU9pqgU3Amd+Csaix5jJRY=;
        b=aR94DW9BGsaTFgBmm1ZHnBvKeNI3OvBgRmMblihrxiRZILzoCUj4kaCyLz1f4U0nHv
         ikE+JSn3odIrulqygZLFWwRzD/r9is7OkV6v16jsCAIIVGSqW9oc1oItU/oR1wZ8nxu3
         Nl2pPXq64YqzImL7aP8MOsivJ/3pj8g+5z92ue6bRuv/s1qXO7j91zsHkEYvjujDttFr
         XArXVwSwiGMftnqMozxEfO4uu84cHXJ/m8Q9i+1SO+EteRIjwgWsMXCZUULIYdw3UzM9
         AwSUL8rPPHgkKk4pvRdUsYrlA4ctV0KIOiTNOiYi4KiflBhT33oLVZNKOZEVTz75AnYf
         CoVg==
X-Gm-Message-State: AOJu0Yzg4kOK4ieoFu+da5USWttLD3ZghtSzmKEr5B5KoSAq6vLnMytt
        aslqD3NQH+tAaH5VZtPpIhjX/g==
X-Google-Smtp-Source: AGHT+IEMj6jdiyeNwKMRE7TvRnW3Gb0/8lGUW1Gc2oPytQaFhNJftcgB+WikpVfaM92UiNuMJNC4+Q==
X-Received: by 2002:adf:f7c9:0:b0:31f:91b2:692a with SMTP id a9-20020adff7c9000000b0031f91b2692amr4114442wrq.22.1694682398745;
        Thu, 14 Sep 2023 02:06:38 -0700 (PDT)
Received: from ?IPV6:2a04:cec2:21:518d:60be:d1a1:47e5:d622? ([2a04:cec2:21:518d:60be:d1a1:47e5:d622])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c220600b00402dbe0bbdcsm4214732wml.28.2023.09.14.02.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 02:06:38 -0700 (PDT)
Message-ID: <32df1f0e-282a-1efd-482c-01e61229f2c3@baylibre.com>
Date:   Thu, 14 Sep 2023 11:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        joro@8bytes.org, will@kernel.org, hch@lst.de,
        m.szyprowski@samsung.com, yong.wu@mediatek.com
Cc:     linux-remoteproc@vger.kernel.org, iommu@lists.linux-foundation.org
From:   Alexandre Bailon <abailon@baylibre.com>
Subject: Help needed to unblock upstreaming of mt8365 / mt8183 APU remoteproc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

For a long time now, I am trying to upstream support of remoteproc 
driver for the APU (AI accelerator) found in MT8183 and MT8365.

There is a blocker that I am not able to address and I need some help to 
find a solution. The blocker always related to IOMMU and device address 
management.

Let's me give some context.
The APU is an xtensa processor with some instructions set that could be 
used for edge AI/ML.
We want use remoteproc to load a firmware and start the processor.
The main issue is that the firmware is not relocatable so we have to 
load it at specific address and the APU is behind an IOMMU.
This use case is already managed by remoteproc core.
But, the remoteproc require an unmanaged IOMMU domain to use the IOMMU 
which is not supported by the MT8183 / MT8365.

To workaround it, I tried a couple of things:
- From the platform driver I passed to the core the device IOMMU domain
- I updated the platform to use the IOMMU API but this duplicates 
remoteproc core
- I tried adding support of unmanaged domain IOMMU
None of these proposals were acceptable for good reasons but now I don't 
have much thing to try.
The only thing I have not tried yet is adding a new function to DMA API 
that would allow allocating a buffer that would be mapped at a specific 
DMA address.

Currently, everything is closed source (the sources, the toolchains, 
...) so there is not many thing I could do to make it relocatable.
Someday, I hope that we could use an open source toolchain and firmware 
but this will take a lot of time before coming.

I hope the issue I am facing is clear and we will find a solution together.

Thanks,
Alexandre
