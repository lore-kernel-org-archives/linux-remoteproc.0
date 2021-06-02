Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE50C4709B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 15:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C93956140A
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 15:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbhFBPpU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Jun 2021 11:45:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:46908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230456AbhFBPpG (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Jun 2021 11:45:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BBEF61411;
        Wed,  2 Jun 2021 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622648602;
        bh=CVM8IBi+UG4UZpg7Id3o5ro5UIRzbPYTGht9oDsKea4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DktvJn7R8FRy9t/QsFX+HnPYtCz7IW/8bFR5kPPBK41jk0QmHPcqtWEC0GAQdevAF
         MEYl0h7JnIOsONJn29Gut92OVNrF4rfZnqvkswmYQMLPC4oVPuCBmE2uBUlSZJBY1J
         HIc8IzmUep1vaRQu0CBsWt0FjDGyEe3kMAIaaxEnzHRT+v99kge0iJXZMAX3cuMMo1
         taseg7zHmSfj5UQQe1NfXxk3SpnkUC2Yvr+iuLF1IFSgxtJHL3EMwFnS/aasSjCMnY
         vdWttBGnTKaHLssxU46IJ4d1EMlb2qSad+yHZVBKXvPz7y9gI31tFXh77amjQPae7w
         xOFzuy2NyRyHA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loT1b-006Xbr-E4; Wed, 02 Jun 2021 17:43:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nishanth Menon <nm@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 05/12] dt-bindings: reset: update ti,sci-reset.yaml references
Date:   Wed,  2 Jun 2021 17:43:11 +0200
Message-Id: <e9b505d900d898c0d030deb168ab291206c203ee.1622648507.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622648507.git.mchehab+huawei@kernel.org>
References: <cover.1622648507.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Changeset 9a81b8cbc245 ("dt-bindings: reset: Convert ti,sci-reset to json schema")
renamed: Documentation/devicetree/bindings/reset/ti,sci-reset.txt
to: Documentation/devicetree/bindings/reset/ti,sci-reset.yaml.

Update the cross-references accordingly.

Fixes: 9a81b8cbc245 ("dt-bindings: reset: Convert ti,sci-reset to json schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
index e99123c1445e..463a97c11eff 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
@@ -48,7 +48,7 @@ The following are the mandatory properties:
 			bindings for the reset argument specifier as per SoC,
 			Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
 			    for 66AK2HK/66AK2L/66AK2E SoCs or,
-			Documentation/devicetree/bindings/reset/ti,sci-reset.txt
+			Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
 			    for 66AK2G SoCs
 
 - interrupts: 		Should contain an entry for each value in 'interrupt-names'.
diff --git a/MAINTAINERS b/MAINTAINERS
index 790eff88b53e..2800307082a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18196,7 +18196,7 @@ F:	Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
 F:	Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
-F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
+F:	Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
 F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
 F:	drivers/clk/keystone/sci-clk.c
 F:	drivers/firmware/ti_sci*
-- 
2.31.1

