Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CF7C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Mar 2022 16:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236159AbiCDQQQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Mar 2022 11:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbiCDQQQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Mar 2022 11:16:16 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9A61B8CA8
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Mar 2022 08:15:27 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u1so13387482wrg.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Mar 2022 08:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lrMkWfnep54u5iNgaB4r+dAM8d1KFFgig+FJrYuk0pk=;
        b=BkiMi6QmBvXGp9TotIl0ob62+e/h6JsMQPZM3+y5rzZZJCBsHJxpaaaOjoXBA8rkK2
         r8r1pfp0/szpXWvqKiXjt3t4MPV1T2w82B6u6dLDyR5B+1jhu3PEJp5glLmIcCA2jtyu
         9RNoMu3D73Tw1im9wuhPGSmXNf1/5ZLMI4yekxVC6TQx4VTNQEByZ2OjIAUci2P/OFxF
         oX1swUgh/0s8jZMoZrdxMDkRk+7UbO6M5zgK096GY+itx49fUVAoQd1byRcon7r4k3tQ
         bTEmZlQL5UsxpOR0KnH58n6vHHJpyzujgEnj/1Bk4yDnbs702oZVl3K6spPdUH1RJ6QI
         6JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lrMkWfnep54u5iNgaB4r+dAM8d1KFFgig+FJrYuk0pk=;
        b=CVTBLyXAd6TIzbqfA8zrBDhVLsEjhaa5y7YzeHayJC3AdQ6cUvjOeZVDzMYfifqc9Z
         gQbRYEsDaQB5/Vwe0Y/M8kmu9u8aIR7S5fmnTQoD2btT75Rw8Kb3Eh3cOTrG0JSNPg/F
         1h5fEg8AHT/0uAY9deUzz9dDWJ0aIKBpYzvbaYm4Ys1TXlT3mHNISh/fy5LSm35T2/hc
         tq++sDURIaHIijwOPtjJi0EDh5h5QWlR6+IFqDmgCSn0Pt6jHFl6NuQevefFRfPGXCY+
         XjQsyUzojKz7IJ4Kw1dxE2eBWEs3tiotGebRJCfb9tyIu9CKcMbyIBI03Gl0ECIt6L/Q
         Wcig==
X-Gm-Message-State: AOAM530clcrd/2rafg6kZYQx9Sdt+4DnIjaTLu+EZ1Ykdm8qPmUgkCrJ
        vGId2o1cC8M2DpnXzyddN/rk9w==
X-Google-Smtp-Source: ABdhPJw+BrScSKY8cwPtWMHO+wpbI7pfRZr8TVd35OrIpG0qohLrXCNbxANPMJ2W58OrVGmXFPO0ig==
X-Received: by 2002:adf:a34e:0:b0:1f0:1a15:c9b2 with SMTP id d14-20020adfa34e000000b001f01a15c9b2mr13213798wrb.662.1646410525632;
        Fri, 04 Mar 2022 08:15:25 -0800 (PST)
Received: from xps-9300.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b001f049726044sm4937307wrv.79.2022.03.04.08.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 08:15:25 -0800 (PST)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.or
Cc:     matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, khilman@baylibre.com,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 0/7] Add support of mt8183 APU
Date:   Fri,  4 Mar 2022 17:15:07 +0100
Message-Id: <20220304161514.994128-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Some Mediatek's SoC have an AI Processing Unit.
This adds support of the one available in the mt8183
(aswell some derivative SoC).

This v4 rework again the memory management.
Now, vdev buffer and vring buffer are declared in device tree with a fixed
physical address.
Using a new property named "memory-region-da", the driver can map the vdev and
vring buffers and make them available to the APU.
The physical address must be fixed so the firmware can convert the physical
address into APU device address.
Using fixed address is not flexible but this is acceptable since the buffer
addresses and size are not expected to be changed without a goog reason.

Changes in v4:
- Update the way to allocate and map the vdev and vring buffers
- Simplfy the code
- Add support of a second SoC (mt8365)
- fix the dt bindings error detected by the bot
- still use the threaded irq. calling rproc_vq_interrupt from irq causes
  a scheduling while atomic isssue
Changes in v3:
- Remove IOMMU hack. Instead, manage the IOMMU directly from the driver
- Update the device tree bindings: only use reserved memory for virtio.
  All the other memory allocation will be done using DMA API.
  This sould simplify the memory management.
- Add more comments
Changes in v2:
- Drop the workarounds needed to load bad firmwares
- There are many name for the APU (most common one is VPU).
  Rename many functions and dts nodes to be more consistent.
- Use the bulk clock API, and enable / disable clock at a better place
- add few comments explaining how to start the APU
- update the way to use pinctl for JTAG
- fix some minors issues
- fix device tree bindings


Alexandre Bailon (5):
  dt bindings: remoteproc: Add bindings for the MT8183 APU
  dt-bindings: remoteproc: Add bindings for the MT8365 APU
  remoteproc: Add a remoteproc driver for the MT8183's APU
  remoteproc: mtk_apu: Add support of JTAG
  ARM64: mt8183: Add support of APU to mt8183

Julien STEPHAN (2):
  remoteproc: mtk_apu: Use match_data
  remoteproc: mtk-apu: Add support of MT8365

 .../bindings/remoteproc/mtk,apu.yaml          | 155 ++++
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |  50 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  40 ++
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_apu.c                  | 671 ++++++++++++++++++
 6 files changed, 936 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
 create mode 100644 drivers/remoteproc/mtk_apu.c

-- 
2.34.1

