Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FA8C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B655223100
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391382AbhALJu4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:50:56 -0500
Received: from mail-eopbgr10053.outbound.protection.outlook.com ([40.107.1.53]:59779
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387627AbhALJux (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:50:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKRFtr4mhjHYPloT56+MZefuCoTG26EMLQmDxmyUUFsevQfayzitEqcW7p1FFj0dSg41ck0RHs4XskSyocVJ48Hp5f5c8OU8QxUstEa15t/WVrwnPnxcpvuFWm/StXbMBYJrxi07GWA3Ox0pcVELKIYpm/e1ki7rqdRXVSvXTTw/o0dGC5mEp5fx3mOkMB0ODOgdUJhlxFcP5vhLEUMblzBKlhp08227lyViIggxeVlo/iU2UKg4KrNhbXsQfgaYhC/ObIttGx+t2H+LjLg7vCzi6eyocmr6IsDK6eK1HovsfqrMWIUmG/+fdv8PSTB2jutJ6G2cJZRlCu3K9Ia3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd6ac21P5Qewd2ZmHmUa7bhm0Fg4CDbanYbYIYDKsJ0=;
 b=MlbnlDKqyBAw04ma9qqShoutQNekVspXri2X+1U7LPp35HT5yBZAv6NxQh7dWawzyA4guviyOyVBIUbFyQqmFTJthHYpvkxVoBqfjo7kfHYIUcLbQGvjwzM++ZUW0n1FfWyYCiBB3npeeBsxjvu1cFP6pRMKVUZzeHCt9N+aB/ITbikrhadqKE8IFUZFpYquUpKMBzuNNnU+WSBinHq4pOSBt2+yF91v+O9MlbBx+UG6Bf3MDgs+fKgVYbbSAwG0wmuyf9tVkmRn4Qee8Ok38Q6qhQUS4AH59pohlqGceFWiq6gjnCkzhKa7x5yvnhQ/TJ8Z0hdKmCvYSzKXkvZVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd6ac21P5Qewd2ZmHmUa7bhm0Fg4CDbanYbYIYDKsJ0=;
 b=CpskRu7JyVO2Q6zm9YlVVil4B7tQyMmCqlRjHSsYmT/DIKciP+VOspxHA49WWOhSgdMr/ciJjpl6ma7kE0JsvtXC4DEhBpJImlnBhqfxD4g+m4A/kyV+Gj7jhPqi7aoCDHH1ytY4699tEWY7D00PxwnP1o3JzSRxQQQYd5ZdLQ4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4089.eurprd04.prod.outlook.com (2603:10a6:5:1b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:49:30 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:49:30 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 02/10] dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
Date:   Tue, 12 Jan 2021 17:39:11 +0800
Message-Id: <1610444359-1857-3-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:49:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6079a8a6-36eb-4a78-dcaa-08d8b6df5b6d
X-MS-TrafficTypeDiagnostic: DB7PR04MB4089:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB40894D62AC83B348ED429C7288AA0@DB7PR04MB4089.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M3dtvvAV+b29G8zZ3GKxXKU4WriUQIhRtxJR54z7z4hRnt//ZLyIDR6w5mrZ9MuW7n6e61Uujz5ApqE4EsTJeppTN0XYr1qOK62hGNKuCpA2s6E7Eo/dqSts1gKBCsMTHBQ1wTxugRTFlvN2+Xo2BsMq20Lx6bbUOx5nzs93k+c5WT+d+Br5HgiJulf7VBAkXq+ozQznoYhKqWSg3vESHQAR0xh8O2CX1rb2qYsYe6iQxmiLlOQoKVgER8COlnHPsBNbbl2791vAuFKe5ioeYhGBZqRhzB8mbVbhuZQLZDOfT+lCJorBAMKw9vfp9TBerf87JsEqPGZ9el2vq52eXAoH5AqX85LW1v62HFKnm0cFlkp7PVOFSdCR8BfqPkKr670p+EdP3AvPti6WhwzEXRMbpW26KreVm90q6f6g7CyB068uChafPOgZy/Z1gIuwmJLMDQXIlTLemFalUMas1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(36756003)(8936002)(186003)(66946007)(66476007)(9686003)(26005)(6512007)(16526019)(5660300002)(4326008)(2616005)(69590400011)(52116002)(7416002)(8676002)(6506007)(2906002)(956004)(83380400001)(6486002)(6666004)(66556008)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z29muCEXuYbatZQ4UD80rnODiV0NGHyEt5HvApB7P70uuXl2V6gmyiwUL9nQ?=
 =?us-ascii?Q?10ZI/AmxuVO1g5hUcViwK/+doozeN6cERr6onaHAl/maoMJ9NPA00GACTF99?=
 =?us-ascii?Q?2XHgXqD4ClLtUAB1Ez8HVSy53pW2DP0t4ZQQ3e6aGb/yZmKOg9UtReBe6mE7?=
 =?us-ascii?Q?cY0x4cUfcUkjWTMh8w5trjlpun77kqetW5Or3BwKI2KKNYMnmJVk1ttvrKgP?=
 =?us-ascii?Q?AxlcKEW3dWVMbb0FbsLQ4m8TZKLAtRkEZ7aFwlrs5maCmll2IjLaGmDC+9MH?=
 =?us-ascii?Q?sLAMYOmvEjy65PxFh8p5kyAvEp3bAUTc0Ik8AsYhlJGGCHpJvxIdx+hLeQBl?=
 =?us-ascii?Q?gi6+ziBMd6qgsHPTY2lvnmcjJv1zpp/1Vu4pgoseSSjzT9wcGCV0OJEicJdF?=
 =?us-ascii?Q?/T4Pr8954nV7PvC1vLsicauwMnb9q8AkST0LZs+e/cAFqqA0TUb9NVoABm9A?=
 =?us-ascii?Q?3nJKiQit7XhztmkB+Jb4HAx+bYW7X9vD1mW48plJhm+a0Z8oJVFmQ67eI3y7?=
 =?us-ascii?Q?yIvxSmZW+bKE5viIfRk8X+YuHf2w4PrknszVX2kd6ApaJ1n3byx0aBPnvmjX?=
 =?us-ascii?Q?n50D0AtljnsPYf5MCY/m/UxIYSfpZ7hwVFQdN42OFmXtZWx48upTT0oYkCRt?=
 =?us-ascii?Q?D6S3yAo5sPeSUTVmVUNXzZoUzm/R8kkoF4/u8Q1YgHhdmo4OApsnPoCp0Kjx?=
 =?us-ascii?Q?3utsFJdj2M3UYJn7xkrxZOinOypX3J0HWotIaJQ7PHvrKKPxI8FrQM9GhgC/?=
 =?us-ascii?Q?BI7DxwtgZixhyWznRERQY7KckyU/oIjgJkaHkVtAaGORuXWZUwOaahwSJiH3?=
 =?us-ascii?Q?6X1pfoFEenBZ7n0c3AAPa8sRMwqD6EbLFfySmXWf+ZD3QDKnFmXtIoRT8zLR?=
 =?us-ascii?Q?tY7UgCTMogRUQOnkMrIzeLOGWyu+0kwYviEQOpgzicPtSepvJmn44D1fEEOg?=
 =?us-ascii?Q?rqlgzINsRJfhNATj10Y5GhbFHK0K2ZAESC0pwWI9lBfs7U3SSY1GnBoX+SuR?=
 =?us-ascii?Q?+c3C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:49:29.9864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 6079a8a6-36eb-4a78-dcaa-08d8b6df5b6d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14mj/YcZcc6E3I1v7U7ZANXmVLd0Ice5dGakBIJSFhShBOfdeX2cTDjJcTZAS5af/0WwuLKn8tKOC5ehUnyS3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4089
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MQ/M support, also include mailbox for rpmsg/virtio usage.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index bce6ccfe1538..0b534ce227af 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -15,6 +15,8 @@ maintainers:
 properties:
   compatible:
     enum:
+      - fsl,imx8mq-cm4
+      - fsl,imx8mm-cm4
       - fsl,imx7d-cm4
       - fsl,imx6sx-cm4
 
@@ -26,6 +28,20 @@ properties:
     description:
       Phandle to syscon block which provide access to System Reset Controller
 
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+      - const: rxdb
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
+      (see mailbox/fsl,mu.yaml)
+    minItems: 1
+    maxItems: 3
+
   memory-region:
     description:
       list of phandels to the reserved memory regions.
@@ -56,4 +72,37 @@ examples:
       clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
     };
 
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+    rsc_table: rsc_table@550ff000 {
+      no-map;
+      reg = <0x550ff000 0x1000>;
+    };
+
+    vdev0vring0: vdev0vring0@55000000 {
+      no-map;
+      reg = <0x55000000 0x8000>;
+    };
+
+    vdev0vring1: vdev0vring1@55008000 {
+      reg = <0x55008000 0x8000>;
+      no-map;
+    };
+
+    vdevbuffer: vdevbuffer@55400000 {
+      compatible = "shared-dma-pool";
+      reg = <0x55400000 0x100000>;
+      no-map;
+    };
+
+    imx8mm-cm4 {
+      compatible = "fsl,imx8mm-cm4";
+      clocks = <&clk IMX8MM_CLK_M4_DIV>;
+      mbox-names = "tx", "rx", "rxdb";
+      mboxes = <&mu 0 1
+                &mu 1 1
+                &mu 3 1>;
+      memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+      syscon = <&src>;
+    };
 ...
-- 
2.28.0

