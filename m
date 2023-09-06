Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30DCEE14AA
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Sep 2023 22:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233578AbjIFWw4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Sep 2023 18:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbjIFWwz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Sep 2023 18:52:55 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA71CF4
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Sep 2023 15:52:51 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31f615afa52so416472f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Sep 2023 15:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694040770; x=1694645570; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oUHttsucRzTXJI4Z9gvbb7PrFjX37VN7eoNyst0M2+s=;
        b=FuO92DuFm1faDV0RVOcnVklAQx9eXuZ45ZKHBNX0WrAwBortmF1FZkYozuf4Vh93ac
         6VS5Akl5EByjY5N2VbSYHl0rwhRrL/V7e4GjQEN2L57iT/Fx6LIaiNJsDuK+z6gALS3I
         oFnhZV2XT4kk4RSIARi5ypEyNf4PrCQWoUoo3wBKfwHaodwlT0MMGmGGwV0cvAfSmiJ6
         EgdGdoI1+AN7QhrsHaDlY2BcYim5LA2umobmJHr681Wc7jp8J4ZEovNpA3VhmlMV0AiO
         OBnwAAs+fb2NAwkm098loBt349H6G43b1WV/KgC7YlJKb6zXqlwHjbiWBExTZvAfZxoJ
         SuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694040770; x=1694645570;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUHttsucRzTXJI4Z9gvbb7PrFjX37VN7eoNyst0M2+s=;
        b=GIy61pSku1SbIdsqZKG3vsxGrqkg43Cpao0x14EyVyGuPPrm/9/d7/Kevggb6Z2b8x
         we/VXGSyjb7UvvUSunjI4QCn+sYfr8DdaZ/W+s6ymkrnElVGLy59Sjl63sCq1skIIz0/
         aH79UTYg+3dZ2kpWY1udVHHcr3ZXuGbCUh6AIKXbrVZlWxcBnr0qROkX5YgP718ymyAQ
         pqOiMKPoKbLaB8oGVr1ErcXHDVmzv6mhP6R4M4ooAy8Q32BqID6Ra74o3jxDR4a3X4dv
         3/0n9BOSpvxg1XKGBVwjYu2K1i46NtjDMIrwe7qLoNzzE9kaG2dCbcttyGIdzIph7gJ6
         pC9w==
X-Gm-Message-State: AOJu0YyZ4tLsUK5YnnGX3BQ38d/t0q1eAwqlO6kYEswPtPlBiFcUwZhC
        8Don0yOrolfC4oWHO2BmLecEjVjgMtiO7LM60QSJzT1qYC32meyJV3Q=
X-Google-Smtp-Source: AGHT+IG7MK8464BYG20XgJRnA0589ic5imJWm3nxEsWOCdfrunM1Kslrs/I8oSlJdm7QfzbKC/tSufFu5yyVGnL1V4Q=
X-Received: by 2002:adf:f249:0:b0:31a:d2b2:f29d with SMTP id
 b9-20020adff249000000b0031ad2b2f29dmr3183192wrp.8.1694040769674; Wed, 06 Sep
 2023 15:52:49 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 6 Sep 2023 16:52:39 -0600
Message-ID: <CANLsYkwXy+yOQKv3BdC9+kS-g5yBQzug8fHTKbk1faU1WYtZhw@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for September 6th 2023
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v4 0/3] add zynqmp TCM bindings
[PATCH] remoteproc: k3-r5: Wait for core0 power-up before powering up core1
