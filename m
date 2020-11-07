Return-Path: <SRS0=MZUM=EN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5EAC388F7
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Nov 2020 23:36:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43E0B2087E
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Nov 2020 23:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="poX5pAv3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgKGXgi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Nov 2020 18:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgKGXgi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Nov 2020 18:36:38 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37103C0613CF;
        Sat,  7 Nov 2020 15:36:38 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id 23so5597359ljv.7;
        Sat, 07 Nov 2020 15:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BAsmVBERLtIkPKSJ/BkTRWhkFllTaoPPg4wptJs5664=;
        b=poX5pAv3AOQHHZmM+Gav0NU4a+LwsQfDRy0vVeqVkcgYU0LOj8Jy5tEM6jWyB7Ol3Q
         s0AV8D6db2DKMZ+L9Wex3RJgUcs7Qtt++/7/nOh1NtcOpK0spqD9kCfFJgbOOohTOO/L
         VtSMx6f/QI8q8IWON+suc6oMDzKIpY74xo7ps0D1+YfQji8jFI3K3lVK9CZATnAvkiUh
         jAYM7mDR7wqa58MQRy5h2sXqWZaiD59Z+WY/juDjqsBO7H9uxxQpW/JFqlPYzJK/Motk
         58tZKjHMmR9ry2ip4XY6pLJZGN3eP9/H1baA6VZCodqcTY/WHCiLRcN6YoRF3j6RZNiI
         VCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BAsmVBERLtIkPKSJ/BkTRWhkFllTaoPPg4wptJs5664=;
        b=LNXqBMDTf2lv/LTkDaA3g9t+xCXYqcV24MnOG9ZOC+GueraxMQCr+WSb4AJmTqpum1
         YCD/OljGNqRbjA4+hKTYY5z6hEslZR3PTXh1PeKy2LAf5AvH6WBGG4ecVws4bcxz4Jhg
         zJgZ4gG5trJRo8lkGjldL6219MAVxsccZHz0pbw+XoEf6Q2ysTxh95SM2HXcbZDtWmQI
         7bHYcroFsFaaSeppGFe0S/ZR/zn0+B6wOhYmhXnx3vSwxmQMRe1UIJuvUilgkUG3zrAB
         9AjxR5vKORxBug+MOE+byR4A6F2K7Ojngjp2ITbBsU7b664PI6cEuNPLUoJX+S21Aq3i
         7nLQ==
X-Gm-Message-State: AOAM533FArig/jYQg1OTyuKcwzj7Vfe7AaQitWC+kN0QmWVFM7j+oTwb
        G+9j3ni1+/ounaPeXpJIFbY=
X-Google-Smtp-Source: ABdhPJxSOMHDT1FfYuwhl+GENcESSIMAcfVtTuE8fwfTk0I7FTy+FSLRnnTDASsRo8ReOLKPlxJf9w==
X-Received: by 2002:a2e:9449:: with SMTP id o9mr3023985ljh.457.1604792196622;
        Sat, 07 Nov 2020 15:36:36 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se. [155.4.221.112])
        by smtp.gmail.com with ESMTPSA id j23sm782772lfm.16.2020.11.07.15.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 15:36:35 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 0/2] remoteproc: Constify static struct rproc_ops
Date:   Sun,  8 Nov 2020 00:36:28 +0100
Message-Id: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Constify two static struct rproc_ops which are never modified. These two
changes makes all static instances of rproc_ops in the kernel const.

Rikard Falkeborn (2):
  remoteproc: ingenic: Constify ingenic_rproc_ops
  remoteproc: stm32: Constify st_rproc_ops

 drivers/remoteproc/ingenic_rproc.c | 2 +-
 drivers/remoteproc/stm32_rproc.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.29.2

