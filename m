Return-Path: <SRS0=nrb/=DJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37789C35257
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Oct 2020 23:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB14A206A2
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Oct 2020 23:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Zi/+Ff6G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJBXmw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Oct 2020 19:42:52 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42910 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgJBXmw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Oct 2020 19:42:52 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 092NgjQt113705;
        Fri, 2 Oct 2020 18:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601682165;
        bh=acKLjM1liOtXynKdvplPg0N6+uJIEh1nuTbsSmjfk7Y=;
        h=From:To:CC:Subject:Date;
        b=Zi/+Ff6Gk4fGPfBDBwKrd/QorH04ZFK1+g/hzuevzi3Ztwa6n2oiGImGCdnr073ZL
         W23bDr94wx86qFCgnnr5ybQq9WfsuxTCdZI8BLFfuVRa6VV7JFpsH/V1i57PsrNBUo
         flg00teS1A/aR+EdiSTE77MaO6ADPqae75kKB5VU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 092Ngjh6083402
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 2 Oct 2020 18:42:45 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 2 Oct
 2020 18:42:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 2 Oct 2020 18:42:45 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 092Ngj6g068756;
        Fri, 2 Oct 2020 18:42:45 -0500
Received: from localhost ([10.250.37.92])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 092NgjCC112885;
        Fri, 2 Oct 2020 18:42:45 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v5 0/4] TI K3 R5F remoteproc support
Date:   Fri, 2 Oct 2020 18:42:30 -0500
Message-ID: <20201002234234.20704-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

The following is v5 of the TI K3 R5F remoteproc driver series supporting all
the R5F processor clusters/subsystems on TI AM65x and J721E SoCs. Please
see the v1 cover-letter [1] for the features supported on these R5F processors.

This series has only 1 line change w.r.t v4 version [4], the example in 
dt-bindings is updated to fix couple of dt_binding_check warnings when 
applied against the latest linux-next version due to a base TI binding
conversion to YAML.

Rob has left it to your discretion w.r.t the bindings, so appreciate it
if you can review the binding and pick up the series for 5.10.

regards
Suman

[1] R5F v1: https://patchwork.kernel.org/cover/11456367/
[2] R5F v2: https://patchwork.kernel.org/cover/11632993/
[3] R5F v3: https://patchwork.kernel.org/cover/11679327/
[4] R5F v4: https://patchwork.kernel.org/cover/11763783/

Suman Anna (4):
  dt-bindings: remoteproc: Add bindings for R5F subsystem on TI K3 SoCs
  remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem
  remoteproc: k3-r5: Initialize TCM memories for ECC
  remoteproc: k3-r5: Add loading support for on-chip SRAM regions

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  281 ++++
 drivers/remoteproc/Kconfig                    |   13 +
 drivers/remoteproc/Makefile                   |    1 +
 drivers/remoteproc/ti_k3_r5_remoteproc.c      | 1395 +++++++++++++++++
 4 files changed, 1690 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_r5_remoteproc.c

-- 
2.28.0

