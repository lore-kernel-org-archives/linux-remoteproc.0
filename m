Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E3EC4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 12:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239258AbhKVMbA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 07:31:00 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48430 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235973AbhKVMa7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 07:30:59 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCRmos080580;
        Mon, 22 Nov 2021 06:27:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1637584068;
        bh=BbUw53ZkwO9DOAUjMgoVQpJkl8OWUBSaDuigx+TQkq4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ww8Av4NXXDaraP+t17LOUqvoSulSDl6hPnwXhNKYQNJZnFl+Hy7COS2A38TRBn8eo
         kyKrNg5sR/KTXDpg/uTPgGelLPtzjAc09bGqokMYnxeja72swOTXFe3O04VJ46OEv0
         mlLmhy1URAy2aY4XfYVyhQ+ju2dHHivRrD5wxu5g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AMCRm3e079025
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Nov 2021 06:27:48 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 22
 Nov 2021 06:27:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 22 Nov 2021 06:27:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCRltX063535;
        Mon, 22 Nov 2021 06:27:47 -0600
From:   Hari Nagalla <hnagalla@ti.com>
To:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <a-govindraju@ti.com>
Subject: [PATCH 2/4] dt-bindings: remoteproc: k3-dsp: Update bindings for J721S2 SoCs
Date:   Mon, 22 Nov 2021 06:27:24 -0600
Message-ID: <20211122122726.8532-3-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122122726.8532-1-hnagalla@ti.com>
References: <20211122122726.8532-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TI K3 J721S2 SoCs have two TMS320C71x DSP subsystems, and does not
have any TMS320C66x DSP subsystems. The C71x DSP subsystem in J721S2
SoCs is a similar to the C71x DSP on J721e with some minor core IP updates.

Compatible info is updated for intuitvely matching to the new J721S2
SoCs.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 5ec6505ac408..7b56497eec4d 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -33,9 +33,11 @@ properties:
     enum:
       - ti,j721e-c66-dsp
       - ti,j721e-c71-dsp
+      - ti,j721s2-c71-dsp
     description:
       Use "ti,j721e-c66-dsp" for C66x DSPs on K3 J721E SoCs
       Use "ti,j721e-c71-dsp" for C71x DSPs on K3 J721E SoCs
+      Use "ti,j721s2-c71-dsp" for C71x DSPs on K3 J721S2 SoCs
 
   resets:
     description: |
@@ -106,6 +108,7 @@ else:
       compatible:
         enum:
           - ti,j721e-c71-dsp
+          - ti,j721s2-c71-dsp
   then:
     properties:
       reg:
-- 
2.17.1

