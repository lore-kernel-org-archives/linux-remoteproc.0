Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61932C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Feb 2022 13:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbiBVN3K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbiBVN3J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Feb 2022 08:29:09 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD7B939E4
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 05:28:44 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A92DA3FCA0
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645536522;
        bh=syQJnDJvIk7oDut501097JANOAQimJJ8XX+nOUPJjUo=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=SpwWIDK079KsZengzmEv7Z0tWqAsfgDccqZg/evf9Aep7QIQA6kKGZJ9qo9IMKUyL
         ceIhsXdXVYbxsIvN28bBnyZQXkvvIYOmRSYWVZEwYWHQ5ipWWv2Tjpx1ecsjQHu2mi
         VYexBbTwFXCi0Lz07FCHf3Ad2dHa/GjqWPOfODFikl7DHKj3y4OPkOQpFNxsdg2vqE
         98wf7OMaNV26+zIxuFIzlICNTdIK0SW1ko7zuseztlVf2l265XqAOOYM/x5nu+gtkk
         sFjnZBZdDw9OkkF2izQCFkTRRd4RnuzfC9MS/01Mmz1GgCfP0mGxo8xqZDnBDHnp25
         dUHc22fReuncA==
Received: by mail-ed1-f69.google.com with SMTP id m11-20020a056402430b00b00410678d119eso11914768edc.21
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 05:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=syQJnDJvIk7oDut501097JANOAQimJJ8XX+nOUPJjUo=;
        b=3uKH/IrCqQhJk3DOnWDZSjPhwMliDs4/hgZtMWnM2LCVb+SNoUGofEX04hAMsHU3JO
         u79ZItu5Irs+sSS0/t5+AafD1TQhLzQzxaHW17Jf9tr692j9UK8JDX5uKA4Af5KGgUjG
         j9Pj6r+5B/ToPZALGbEgJQXAmpugYpvRCRZsvNAcmeFLs7AKuTaL6d1oTTp2OTEDZ5lv
         OYs5Eq6Qna3pmlAAsw5ocYswss/Rt8Q0PHwI3mGtaWEVJq153AqbwLOYCCyIx47FhEyE
         ORP6VzFMqlfjYr3mtBhiEUbn2zzSVltEEWSliwYpErGsQ5VV0sKOCbSEOlop+XjzMOda
         3tQA==
X-Gm-Message-State: AOAM531gQrDFxFkFLrQuCgPq2+zeK8nscPjxPRnJJSRcXa4c5iGnEwm8
        xEkD4adVh+2+aEivvtwF+qhhWHOIP+jWQyjnl1J+tT8e1FVI6+eb+JV4uSkH+Entfm+i9UoTPcc
        ENEvaLj3Rk9MP/O+zoVgz3zt2y16AldyeJ4xM4Y9sUm6PQhU=
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id rn21-20020a170906d93500b006ccfcfcc286mr19267966ejb.423.1645536520192;
        Tue, 22 Feb 2022 05:28:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyrFfwlMx3wyhaWOiWMYUuCZ2Sd0V6lJlo9wHP9II92B5eFvZo3+bHsg4+GgnT5+leTtK+fA==
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id rn21-20020a170906d93500b006ccfcfcc286mr19267945ejb.423.1645536520030;
        Tue, 22 Feb 2022 05:28:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:28:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RFT PATCH 0/3] Fix kfree() of const memory on setting driver_override
Date:   Tue, 22 Feb 2022 14:27:04 +0100
Message-Id: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

Drivers still seem to use driver_override incorrectly. Perhaps my old
patch makes sense now?
https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/

Not tested - please review and test (e.g. by writing to dirver_override
sysfs entry with KASAN enabled).

Dependencies
============
Patches are independent.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  clk: imx: scu: fix kfree() of const memory on setting driver_override
  slimbus: qcom-ngd: fix kfree() of const memory on setting
    driver_override
  rpmsg: fix kfree() of const memory on setting driver_override

 drivers/clk/imx/clk-scu.c       |  6 +++++-
 drivers/rpmsg/rpmsg_internal.h  | 12 ++++++++++--
 drivers/rpmsg/rpmsg_ns.c        | 13 +++++++++++--
 drivers/slimbus/qcom-ngd-ctrl.c |  9 ++++++++-
 4 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.32.0

