Return-Path: <SRS0=Lo8U=AD=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FF7C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 19:19:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1B5220786
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 19:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sK9YTPQH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgFVTTf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Jun 2020 15:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgFVTTe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 15:19:34 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8941CC061573
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 12:19:33 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id 25so16633235oiy.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jus7DNDunfIMFweSDWGPXAjkcv1IrAfG0u9GMpZ5ilM=;
        b=sK9YTPQH86hVUZWWh2ZdcBb/PzqD9yI/NEShdhMoHRASS6z2MQFuV6zJtyVmEmyShb
         coR9ZTY2FwG+evLcoI8Xy/beUUMV7wx4p7cx+UhqlCK35HpYDK1SyF92VVmLiRfAXp8B
         2j9XssWJSfYZgGjNy1U2ueJoZrxdEaxhLypxJksE2wmHI06gQ0zbTpvj2lMCI2eI9cDj
         4MzmooZ1MTZ4due3PgoKScdqrTgVxMjuPS2sNa5ZgyO5Hl1206ARWa9Thadj3mEXHe5G
         9R6sGw7oWmxfrvh7aFq0SGY8TlufZwdrpYZVJrmXb7BFnxF9xRLL8c8bL17qYI0/hsts
         WwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jus7DNDunfIMFweSDWGPXAjkcv1IrAfG0u9GMpZ5ilM=;
        b=qWtBiUDy86ZZo2cCnp9m2wLJjYqEo4Gsqz/NMby32sy/O1LHFJXSnGiU21fyJqIY3i
         snBfgD5ObhLeUFqxNs4hkA71acNgxCTTNBO+F6bVYdl8znBctdGz9aORqQkzBgCLaW2G
         kjElagKZPOJ3N3VE10yc6lsh3wprPdK6JGhESHkRVzjXAYzKmzKlSS/HWkPNBHZTAtMC
         duJSX9GKiqRP2YI8s5y0tj3ZMZ/vlmQYevoYRny68kJWyDflYMk5M+9Ilez3PNhUWsxL
         ENazbKWYrUjpXsJ9lODVrlu9ocPuReFDL/584AnV/K/c30iq4r/8+paBOU9LjiHEbYY3
         anaQ==
X-Gm-Message-State: AOAM533PCo7TF2zijjRRYjjFQaQ/R5mj/ue7OulUgqjAHDa6G95s6c/Q
        VYDxfDCkN2Mv5Jyr+XVSKSPnUw==
X-Google-Smtp-Source: ABdhPJyOBaULh6qkKqzgj2z7VWM3cokDJpP59eooGuNB9sW1HfLepA6lCCyygGhAzkFdIUOln482kw==
X-Received: by 2002:a05:6808:487:: with SMTP id z7mr14223890oid.166.1592853572847;
        Mon, 22 Jun 2020 12:19:32 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m84sm3348294oif.32.2020.06.22.12.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:19:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5]  remoteproc: qcom: PIL info support
Date:   Mon, 22 Jun 2020 12:19:37 -0700
Message-Id: <20200622191942.255460-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce support for filling out the relocation information in IMEM, to aid
post mortem debug tools to locate the various remoteprocs.

Bjorn Andersson (5):
  dt-bindings: remoteproc: Add Qualcomm PIL info binding
  remoteproc: qcom: Introduce helper to store pil info in IMEM
  remoteproc: qcom: Update PIL relocation info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region

 .../bindings/remoteproc/qcom,pil-info.yaml    |  44 ++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  15 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  15 ++
 drivers/remoteproc/Kconfig                    |   8 ++
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 129 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   9 ++
 drivers/remoteproc/qcom_q6v5_adsp.c           |  16 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  15 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |  14 +-
 drivers/remoteproc/qcom_wcnss.c               |  14 +-
 12 files changed, 271 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.26.2

