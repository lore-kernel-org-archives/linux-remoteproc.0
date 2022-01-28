Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C07C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 Jan 2022 02:54:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345563AbiA1Cyt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 Jan 2022 21:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241273AbiA1Cyt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:49 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEF9C06173B
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jan 2022 18:54:48 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id u129so9799618oib.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jan 2022 18:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZ09zZh43E7tXHG2E2Vwc7ofHsJ1Ii8TO5MAW1mVCYs=;
        b=iB9OiZ4cinZKQh/bcru3DdlB/I71TE1CqGYnR/p7p/v2yZ6MUXp/nyKnPB1+pPr5qi
         +PJPUzpysmF7dPC9BSRuaof/HUBGhQUbvQ0pihtQenwL05yStj+j4+WTaf3BeclOPMvg
         u36N+8puui43wjUPsZTyLHPbOEF1xHw3CTuBunE7xjZdSYNTO/ylCmiM3qE2VubF6Dzi
         ftDsP08UM24H7J5XGN8HUtp3Md41o8PC3CWaui8OJZniTVBIjPvfCWUiFfdOm68XXiaa
         GcqQn+OL9KhFOhoa/lTRpqt4ty8nETnC0SCS5eO4sKcdJJ1CzWFwu5A3FGXh+cmued+2
         rbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZ09zZh43E7tXHG2E2Vwc7ofHsJ1Ii8TO5MAW1mVCYs=;
        b=AeDwirPsE+ybxi+F9CCGnl762VNtP3x/GWdUtBTiXZVCf2a/fC/LUfz+kLrKjIfMNN
         2GFUpsPTAkjb8GZkb3pDujkh/3at8M070jkTqg4N2zS3EI8BWh8znWUxbBeVzpE505aA
         9CUQoETuOZHebwboibopCF1nND0rYD4+LoJznM1VEHMYAlul9I/h+xUVxSfv6VbkAbMZ
         1R6xk6TGg4oZyq6UMOTLegHaXMAX+QBKlnhJ3d1ZykykNqyS2RuA+TcGnUos2PjRxhBw
         hWT4141VjfIy0VjDrpuEz7pSc0s89VmBhQgaJa+viIs5INKcyS5fKi1g7F5cdkvqRqqg
         hRMg==
X-Gm-Message-State: AOAM530qVcV/rQcfMyj3XWwlJS8VhVl+ayboPyfq8JowaM5TQXRwYy66
        rBK3/GGbIeKqIsEFD+jOhsMuAg==
X-Google-Smtp-Source: ABdhPJybAvO6DTbzDHaecPZUsiIVi2CiXN2nWgFYKmsusfyc7bgjUp+NUJLXjUsWUhlSrluUTR8gPA==
X-Received: by 2002:a54:4785:: with SMTP id o5mr4093778oic.96.1643338487825;
        Thu, 27 Jan 2022 18:54:47 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:47 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] soc: qcom: mdt_loader: Support Qualcomm SM8450
Date:   Thu, 27 Jan 2022 18:55:00 -0800
Message-Id: <20220128025513.97188-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The Qualcomm SM8450 platform comes with both some smaller changes in the
firmware packaging and a new requirement to hold onto the metadata buffer until
PAS auth_and_reset has been completed.

Extend the PAS api and rework the mdt_loader to meet these new requirements,
then wire this up with the PAS remoteproc driver and finally add the SM8450
remoteproc instances.

Bjorn Andersson (13):
  firmware: qcom: scm: Introduce pas_metadata context
  soc: qcom: mdt_loader: Split out split-file-loader
  soc: qcom: mdt_loader: Allow hash segment to be split out
  soc: qcom: mdt_loader: Allow hash to reside in any segment
  soc: qcom: mdt_loader: Extend check for split firmware
  soc: qcom: mdt_loader: Reorder parts of __qcom_mdt_load()
  soc: qcom: mdt_loader: Always invoke PAS mem_setup
  soc: qcom: mdt_loader: Extract PAS operations
  remoteproc: qcom: pas: Carry PAS metadata context
  dt-bindings: remoteproc: qcom: pas: Add SM8450 PAS compatibles
  remoteproc: qcom: pas: Add SM8450 remoteproc support
  arm64: dts: qcom: sm8450: Add remoteproc enablers and instances
  arm64: dts: qcom: sm8450-qrd: Enable remoteproc instances

 .../bindings/remoteproc/qcom,adsp.yaml        |  16 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts       |  20 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 297 ++++++++++++++++++
 drivers/firmware/qcom_scm.c                   |  39 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   7 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |  36 ++-
 drivers/soc/qcom/mdt_loader.c                 | 232 +++++++++-----
 include/linux/qcom_scm.h                      |  10 +-
 include/linux/soc/qcom/mdt_loader.h           |  17 +-
 9 files changed, 579 insertions(+), 95 deletions(-)

-- 
2.33.1

