Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA6CC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 23:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 390312343B
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 23:34:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbhAGXet (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jan 2021 18:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbhAGXes (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jan 2021 18:34:48 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59872C0612F4
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jan 2021 15:34:08 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id h3so774042ils.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jan 2021 15:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HiZ/f0eHV5aQFZa+Y8E8w0anBR8YlRAd0P5p11hd21Q=;
        b=bi3iyF594n09MDCSVSCiyjO+ne3h666WZxMh8k5ozUoKAFfkzQSlJO+FVULBXEhnKQ
         DWrLKTOF8SpB5jFeJRr1gJYpfh+wE4Azs8o3phz8oVAdLPK4Gvg5gf+olk6iEuygy2MQ
         KPS4JWhZ/2doj1g3CJTmD7x8mBZcHw+0ifkGbe/wyrPWZLKPsgQsH/BmjrXC7JVaCSle
         vIwey3oJzIBVDPDWZKxRpBrqjtfEgAAG7oIV1lWSd7s9Q/TeNnurLrIDUqRfFTXLlMRK
         8k/qGboO8sFuWJUfst1Vhxt2ZZQWcbgILUjaBWlXyo8a38IRRaVFBxr56dGmyr2LDdVj
         XqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HiZ/f0eHV5aQFZa+Y8E8w0anBR8YlRAd0P5p11hd21Q=;
        b=sC6JPbI1MmYn6dL+2TqoaYMH1oVNZV1b3LnQtVJJIcvJJ/0dAXX+KlHFwcwVT9mEAs
         2mDZzu6ePcDJwuqGktJRNfDvlaTTxDturiCOojqZP9vdUp/wSK1uzPaiNP4OdJAD/WFk
         qvmFuarQukVvKOvx4l5rK6U2CKqxj4D0t1qeK7CVrpDDNK2XvqrU0EVWkx6prcw1QqKt
         iMI4v1wsw7pmz7tGCUf9IA6DL+3ytQI1K//fMN2U6v38ZaTJvaSvX0UtgNpx0jvuBL7+
         TMK6d8wUn0KEdQ4rmkCh6w68ys2FFOjBx5+YF6768j4gI/J14yok9e4pS9+ujXIyhAy5
         D32A==
X-Gm-Message-State: AOAM53218I5eCPcHhxdWK1zRfkX1WLD4JdoSAXzkrTX+Vylt19w6R+rU
        WKgPHfbJyAEG2yl/fXlDvNpBBg==
X-Google-Smtp-Source: ABdhPJxn7aD4n6NGnZR2YanSnANfePYBUaScug0tpdv9ckw4F2oMe0QIzJmRZiToQH06QxVoMbaKow==
X-Received: by 2002:a92:6403:: with SMTP id y3mr1248404ilb.72.1610062447746;
        Thu, 07 Jan 2021 15:34:07 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o195sm5648521ila.38.2021.01.07.15.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 15:34:07 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, ohad@wizery.com
Cc:     evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/4] net: ipa: support COMPILE_TEST
Date:   Thu,  7 Jan 2021 17:34:00 -0600
Message-Id: <20210107233404.17030-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This series adds the IPA driver as a possible target when
the COMPILE_TEST configuration is enabled.  Two small changes to
dependent subsystems needed to be made for this to work.

Version 2 of this series adds one more patch, which adds the
declation of struct page to "gsi_trans.h".  The Intel kernel test
robot reported that this was a problem for the alpha build.

David/Jakub, please take all four of these patches through the
net-next tree if you find them acceptable.

Thanks.

					-Alex

Alex Elder (4):
  remoteproc: qcom: expose types for COMPILE_TEST
  soc: qcom: mdt_loader: define stubs for COMPILE_TEST
  net: ipa: declare the page pointer type in "gsi_trans.h"
  net: ipa: support COMPILE_TEST

 drivers/net/ipa/Kconfig               | 10 +++++---
 drivers/net/ipa/gsi_trans.h           |  1 +
 include/linux/remoteproc/qcom_rproc.h |  4 +--
 include/linux/soc/qcom/mdt_loader.h   | 35 +++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 6 deletions(-)

-- 
2.20.1

