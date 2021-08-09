Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137B6C19F34
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EACC661056
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233122AbhHIFUc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Aug 2021 01:20:32 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58048 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233043AbhHIFUa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Aug 2021 01:20:30 -0400
X-UUID: e1b3ec17cfd2468dac4f5f0a6656b548-20210809
X-UUID: e1b3ec17cfd2468dac4f5f0a6656b548-20210809
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 362521809; Mon, 09 Aug 2021 13:20:03 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 13:20:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Aug 2021 13:20:01 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>, <krzysztof.kozlowski@canonical.com>,
        <shawnguo@kernel.org>, <sam@ravnborg.org>,
        <linux@rempel-privat.de>, <daniel@0x0f.com>,
        <Max.Merchel@tq-group.com>, <geert+renesas@glider.be>,
        <fanghao11@huawei.com>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v6 0/6] Mediatek MT8195 SCP support
Date:   Mon, 9 Aug 2021 13:19:53 +0800
Message-ID: <20210809051959.31136-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Change since v5:
- Drop adding new vendor-prefix
- Rename rpmsg property from "mtk," to "mediatek," to use the name defined in 
  vendor-prefix.yaml for Mediatek Co.

Changes since v4:
- Move clock acquirement to mtk_scp_of_data
- Add new vendor-prefix for Mediatek SCP
- Refine mtk,scp.yaml
  - Remove '|' in 'description'
  - Add 'items' to replace 'description' in reg-names property
  - Add 'const' to replace 'description' in clock-names property
  - Add required property for mt8183 and mt8192
  - Rewrite 'patternProperties' by 'additionalProperties'
  - Rewrite example with 1 address and size-cell.
  - Drop dts label from example 

Changes since v3:
- Add missing patch version in mail subject
- No change to patches.

Changes since v2:
- Add compatible for mt8192
- Convert mtk,scp.txt to mtk,scp.yaml 
- Refine clock checking method

Changes since v1:
- Fix missing 'compatible' line in binding document

Tinghan Shen (6):
  dt-bindings: remoteproc: mediatek: Add binding for mt8195 scp
  dt-bindings: remoteproc: mediatek: Add binding for mt8192 scp
  dt-bindings: remoteproc: mediatek: Convert mtk,scp to json-schema
  remoteproc: mediatek: Support mt8195 scp
  rpmsg: change naming of mediatek rpmsg property
  arm64: dts: mt8183: change rpmsg property name

 .../bindings/remoteproc/mtk,scp.txt           | 36 --------
 .../bindings/remoteproc/mtk,scp.yaml          | 92 +++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  2 +-
 drivers/remoteproc/mtk_common.h               |  1 +
 drivers/remoteproc/mtk_scp.c                  | 48 +++++++++-
 drivers/rpmsg/mtk_rpmsg.c                     |  2 +-
 6 files changed, 138 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

-- 
2.18.0

