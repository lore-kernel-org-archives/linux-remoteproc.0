Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23D5C43217
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 12:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234761AbhKVMbB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 07:31:01 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38654 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236595AbhKVMa7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 07:30:59 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCRnri100568;
        Mon, 22 Nov 2021 06:27:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1637584069;
        bh=cwDlkqZtnTWWFnhYJyCyJOKlemYDQJ5LquugJLXctRE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lkMmcFD/IkANBzYCuhdGBXTTqD3Sn+NavEOE1WCWeaz6u7YsOO6y88O/dKXjY//om
         0c3/fRHYY+RDTQ/v5R2MXmh2cWn4JeaOdhzuzaQ9Z2/e3siMDAXE8pDAQbwg8X+jJ8
         z3T4kRsNhgWdoYcJflPX+H2OBhhmsEfGBqhU4mB8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AMCRnpq079036
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Nov 2021 06:27:49 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 22
 Nov 2021 06:27:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 22 Nov 2021 06:27:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCRmAk022112;
        Mon, 22 Nov 2021 06:27:48 -0600
From:   Hari Nagalla <hnagalla@ti.com>
To:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <a-govindraju@ti.com>
Subject: [PATCH 3/4] remoteproc: k3-dsp: Extend support for C71x DSPs on J721S2 SoCs
Date:   Mon, 22 Nov 2021 06:27:25 -0600
Message-ID: <20211122122726.8532-4-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122122726.8532-1-hnagalla@ti.com>
References: <20211122122726.8532-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The K3 J721S2 SoCs have two C71x DSP subsystems in MAIN voltage domain,
and there are no C66x DSP subsystems on these SoCs. The C71x DSP subsystem
is a slighly updated version of the C71x DSP subsystem on J721e. The
C71x DSPs are 64 bit machine with fixed and floating point DSP
operations.

Extend support to the C71x DSPs with J721S2 compatible strings.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index c352fa277c8d..939c5d90b562 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -767,6 +767,7 @@ static const struct k3_dsp_dev_data c71_data = {
 static const struct of_device_id k3_dsp_of_match[] = {
 	{ .compatible = "ti,j721e-c66-dsp", .data = &c66_data, },
 	{ .compatible = "ti,j721e-c71-dsp", .data = &c71_data, },
+	{ .compatible = "ti,j721s2-c71-dsp", .data = &c71_data, },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, k3_dsp_of_match);
-- 
2.17.1

