Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F8FC00140
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Aug 2022 15:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbiHJP6I (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Aug 2022 11:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbiHJP6H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Aug 2022 11:58:07 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C7943311
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Aug 2022 08:58:06 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-f2a4c51c45so18269789fac.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Aug 2022 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=xHVC9iyQyL4whVdcmIl9pJfPs5B/aUB5Bv6S0jmKGrU=;
        b=n6+FgFFbkhJN7ErYxopAX9As/tJ0Yy+Meho0q4DZDR+s1qmLiHNrv84NUnA3/DO5Au
         Luj8wpp73yn1eoW7QL/bgA/jgTPgw8rtqgqbnd6796AxAQIAIkyXIFCyRFhPM11BRpCS
         BA+ifxHH452PvVGMI6tOoUjR8y99hcemqGMkS6ofA1N6GKq+JZOiTryV2dlWhc3TWKn4
         yPvQ1gwLCPJJVsVDkWkkwA5TatsqxB96L0jZGRDX80CJG2CCZCs0w/1pOrANYi6gQ6QM
         f4GEXKs6Gc8HQHwsRHyaPcT6+vlroWH0mtzXGAWZtzQsT5NpggEPQWta8QA1XqyjVaud
         NcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=xHVC9iyQyL4whVdcmIl9pJfPs5B/aUB5Bv6S0jmKGrU=;
        b=RCkTnA9WkDTT2Pn5OhGM+6H0lj/75omAWNY5PH9aK+1rUEmNodaXRTRZ4qO8dF2trr
         h0h06I1AdIDVS2BqcsWTTR1eQcLU+NDh+Hcj/sKUBBMdKAYU2uwKrIMesJ4pWoJTizi8
         3fDyOgPaqRtVB1zIfc2MBUd+8kj1SkH+OpIoAhZRp7zDB0q95rQZTOFFLbLkR0XOsgs2
         x/bV5C9uBH3sGBAM/T0ZGjqIpmq2mpudH78AUt9gXtYq3iVFxksM54rwvkodurdbIdxd
         LMGcziVACnD0JUXBD0U4g0oVhWNQ0qKgOykrS6esWsAuTs8d5p+zm0UMu3yDF+bueJi+
         Jgig==
X-Gm-Message-State: ACgBeo3Lv0oflihAWR84IcCIOuFgSXwv7fQ8GhRVZWfLkXnDI50eJ3rp
        ILiGq5q3In+Qr0xbMeqy79y5mw==
X-Google-Smtp-Source: AA6agR566qNtPc42RYl5Iaz8vv0RSEgk2zSHx//59FNQwuP7J0GoXjN8Vs6bXJmGW6gzkbMIN1vGdg==
X-Received: by 2002:a05:6870:3485:b0:101:b3b1:ff4d with SMTP id n5-20020a056870348500b00101b3b1ff4dmr1786497oah.95.1660147086087;
        Wed, 10 Aug 2022 08:58:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id cm7-20020a056830650700b00636a2a150f7sm728227otb.15.2022.08.10.08.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 08:58:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] rpmsg fixes for v5.20
Date:   Wed, 10 Aug 2022 10:58:04 -0500
Message-Id: <20220810155804.2837934-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Sorry for the late request, I'm told that with these two fixes the validation
of the DT schemas will be free of warnings in -rc1, so I hope you'll be able to
pick them up.

Thanks,
Bjorn

The following changes since commit 7113ac825371c17c15e2d0be79d850e5e16d3328:

  rpmsg: convert sysfs snprintf to sysfs_emit (2022-07-16 23:08:47 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.20-1

for you to fetch changes up to 56e07c0c9e4a4b59a47a848b021a42cf203c982c:

  dt-bindings: soc: qcom: smd-rpm: extend example (2022-08-09 16:37:27 -0500)

----------------------------------------------------------------
rpmsg fixes for v5.20

This fixes schema validation warnings in the Devicetree bindings for SMD
and SMD RPM.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      dt-bindings: soc: qcom: smd: reference SMD edge schema
      dt-bindings: soc: qcom: smd-rpm: extend example

 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 33 ++++++++++++++++++----
 .../devicetree/bindings/soc/qcom/qcom,smd.yaml     |  2 +-
 2 files changed, 28 insertions(+), 7 deletions(-)
