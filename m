Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211A5C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 12:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239027AbhKVMea (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 07:34:30 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49270 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbhKVMea (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 07:34:30 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCVKO8081644;
        Mon, 22 Nov 2021 06:31:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1637584280;
        bh=D9u+kzIc/als2E0rT0GOJcXUCGY0rhYAyFolnSXcAGk=;
        h=From:To:CC:Subject:Date;
        b=yeEXWkK5+8NZ+/0DA84geGfpBpIOXz84lvDJhTzJc1fpDB/6SQ+8pwQN8PM4KXR7a
         zGrNby7RLPI0HH0v+wk3zjO1dgit43mRkDHaiqx2/WGobXrER969A3Jp+8fFlI2PHW
         77ULKiT1uQ8rNA5z+H0uwpFM88CXZqm1RGG1HtUE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AMCVK2j085457
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Nov 2021 06:31:20 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 22
 Nov 2021 06:27:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 22 Nov 2021 06:27:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCRbmK060635;
        Mon, 22 Nov 2021 06:27:37 -0600
From:   Hari Nagalla <hnagalla@ti.com>
To:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <a-govindraju@ti.com>
Subject: [PATCH 0/4] TI K3 R5F and C71x support on J721S2
Date:   Mon, 22 Nov 2021 06:27:22 -0600
Message-ID: <20211122122726.8532-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

The following series enhances the K3 R5F and DSP remoteproc drivers to
add support for the R5F clusters and C71x DSP on the newer TI K3 J721S2
SoC family. The J721S2 SoCs have 3 R5FSS clusters, one in MCU voltage
domain and the other two in MAIN voltage domain. There are also 2 C71x
DSP subsystems in MAIN voltage domain. The R5FSS is similar to the R5FSS
in J7200 SoCs, while the C71x DSPs are similar to the C71x DSP on J721e
SoCs.

See J721S2 Technical Reference Manual (SPRUJ28 – NOVEMBER 2021)
for further details: http://www.ti.com/lit/pdf/spruj28

Regards
Hari

Hari Nagalla (4):
  dt-bindings: remoteproc: k3-r5f: Update bindings for J721S2 SoCs
  dt-bindings: remoteproc: k3-dsp: Update bindings for J721S2 SoCs
  remoteproc: k3-dsp: Extend support for C71x DSPs on J721S2 SoCs
  remoteproc: k3-r5: Extend support for R5F clusters on J721S2 SoCs

 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml   | 3 +++
 .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 8 +++++---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c                 | 1 +
 drivers/remoteproc/ti_k3_r5_remoteproc.c                  | 5 +++--
 4 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.17.1

