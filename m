Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A7FC433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6617364E85
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbhBHJLb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:11:31 -0500
Received: from mail-eopbgr40068.outbound.protection.outlook.com ([40.107.4.68]:17732
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230396AbhBHJJ1 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:09:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXz+7EFrxw5oEDXqxwOTQVsrWkpUqEJw939qYDhwGDAHJjXw8QM2nxS6nWwJASyDciA1GLoTXB/Kp+ZdUDsYOlmFyhAwX0CEvNpsnYTqQLfDsfmEY94bWYP4Yba/OsUl779QBGrd7CAoSLNXeO70qi6EvVkJ6XWy+Mh/5JEqC+RBpbs9IOGH15bfPx8j4ZxPMCsw1EseEVQX47Fe1C1OxkQMXuskCYaRq+QXV/S219og+or43cZgzXoXfm4goTI2OTr/dEHrIzPJ8YeNmQaCmgmeG1oqzRFMppJ9I/or899J0aE0cTcPNiSHoaWFnIaZJKvsjHfoMAgpTZxoJ3zyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ya5TZ1TPJCBO3tXK6VZCcn/yLGZLf97GH1cX0cehIU=;
 b=Xuy3TnxUP+Vwf04sRSpg2imXA43iy/ks+KDKUYqHiR+sWyMk3xYBAlELK1xklEmv0Fh8Qfe9zW6+r5UgRVWqcZBHDS/Vr3HjfHbE9EssiyAobA3YxZu8lnp3ClTdKnT5z1NkXgJ1QkqqNR5tPPRF8kHTrPNRuCgMq0t9UK/dPrH6uCD3EpR3TfG0EGyWInUWqdxE4AkTUdZr8Dg9SUc93wakQfRUo2Rp3krvqshbVXjil1HsMJ1OOWZrElEZtAsZwDbN33XGvS6k0GjZjeERCVDGGqWQxOF5BSgHF86eE6xKfnw2982+tyuAwkDZ7as51tTcO5kgG4WwOXirpRP9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ya5TZ1TPJCBO3tXK6VZCcn/yLGZLf97GH1cX0cehIU=;
 b=dLYmhoQBZ1BWix+eyC4j+yis1aASVdhDcO0j/vmqEkJxSQC2j7mNmm9Lawq4hzcul9ajwsuUG9YTh1zgQDILgI6FZNR7EsconyNaxYjh8MhAu/Fn5z34QlVbBb2bkvd4gkVn0DWrqoD0DVaqwZOA/MXoof7A5guyCVVHtxymzhg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:07:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:07:43 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Mon,  8 Feb 2021 16:56:02 +0800
Message-Id: <1612774571-6134-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:07:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82ed24a7-d0ba-4e6f-d527-08d8cc10fe6c
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB293347BB7EDB7085B4313D98C98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHyq4+h0SEnN6IXfpVMA0+vEFPMlQieq9KAbLWe6DklYJld3H91qOTAiErCIZclZF9CMMHlo7+bMzOboHSwzg2Ay4PqxvpsCa2m1rv7ydE+akjiXdda2TXUnBQhJmNpeh6XdMiAiHHJUEc51+qhFl/MMZbUYMQt5AOEQkXDI8dxqQnDGkwuq0b8MbHCEtztG2z+muKmWiGpZ8pGq1tt3yMBYPim0vfuUnSVXRRpj+z/RNG0szK7ga3BsByzxlUNSn3Tpf48nrk1/ADC5YAkQBGh4sCxEeA1xqejiYd7MOI+9/G5727klQu20RaYgP3BitUtUU95zSvDL6V6WSyJYbyLYrecVRFtlDdqooSP9rallGXGnQpyrT9gHqHckjj8WpunQ2vAk4+q8D5SFEjpkp/BHqXBINiejbuxUMBWPfzm8uDoVSGt8SsmfyAtm4GDZe9wZszplOOOqlzTDPMXiD3f9MLFm8JI/MBRK5R6WC9Snqca7WeMbFI3Gd6j/h43MI3VMNLTXk1EfwivmeTqth2gdszx7v+oGBdiFsxWvy6l2L4Gbo+qdGoCYLLD4Pqs5ccomZ3fPCr4KXRu1e96NLq9o8DFClw27fvG/KUtYyXm9S4IOTuASPhxCzhl2nkTx5yUomteX8koKytYimZJltw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(6666004)(316002)(83380400001)(4326008)(8936002)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zZsvSCegEjPA6bMB+WR5yhUxLmB54HDRAjvSn13kfwW7MObx5neHbpJFeiI5?=
 =?us-ascii?Q?Lp05B3lFLuSd83yAnzmIwxVZFDY0g4q8Khs00j1qscxlv2Bfs14UVmg89lgw?=
 =?us-ascii?Q?Ls2UMipgo4upo4OcL8QXOcZHgT6Vire0Mg5rLjRdXRAiflcCQO0OqMo/QlNU?=
 =?us-ascii?Q?5W+Ct62+p6oZm6koPYmdPxHQyk+kDEpnBEJIZ0sX9nSv8nBdRtIAcDkABUNs?=
 =?us-ascii?Q?6bwnB+5ej/O4ObA17+gbpBIlQUSsCzPDZ+KygtkbF9ry7kgVGYGiUNfcPJqH?=
 =?us-ascii?Q?/FOwC1nWN9XbTNS9N4ilbhK8t2SxKcMNXCKFSR/ee1Uif/2IZd/c7bzl/QtD?=
 =?us-ascii?Q?luvGtEYkYRPekLoy0Mbpqw4PJZd8VeDz1CuzTeYc90FHJgOkorNSR/QZZpDI?=
 =?us-ascii?Q?cW3eegeNJ18Rjz7N7Oxket256JJskQu1YcSPxceUFNO/1kLybSl0k0xAfdBh?=
 =?us-ascii?Q?/MH+VZFU24+dVz3FKhNqQWboke0lIHNBVlq/k01NVSt/sD3KWcdgI0ZFhF3N?=
 =?us-ascii?Q?YvxXW/UaL8+ZDiVW0v4OjVTOB8kkgWsYDSqB1I48uxcDBDX0SZxX56ZmM7uR?=
 =?us-ascii?Q?sxmCFUPrvYhzogUVrw9Zg/uDLpZ40yqHow8b5fU7qm4zcnBWXBwxx0k6NI0H?=
 =?us-ascii?Q?peho5mPG6Ei+DU5XxrYZytaxcpW47VvrNWO+VJgr3mXxbj3gNDe1O43rfzLg?=
 =?us-ascii?Q?9F5S1OFx990e3+RvecT7Ut8HfnknOyjHClAN728/grcEzbgkkjkqIz9hWTru?=
 =?us-ascii?Q?0gTXFEgMysfQfoxqnrmjD06ckC0HZCVwDAv5haYB/SUKnk56O551gK4P4nH6?=
 =?us-ascii?Q?8yKNie4a1Oq3ex0Oyiz+8ZYQoU2YLKvGjZHL+ePKr67WFMtZAAZO0Zn04195?=
 =?us-ascii?Q?4G6o4701bTak86HD74DXiEGncMx+tl6OB/lftMUmZ/6CJRYLwp69PnYvHFC+?=
 =?us-ascii?Q?Yv24K+tRbevYzr5Z1KnfA8+zlx/171h6AT154hAax1mH3Fw6lT0ZStmsFzcG?=
 =?us-ascii?Q?ZeW5s9zB69wXPoCmCj09mqBee03vXDCfKkamckx/hr9q7+6tHwqs1iosksmk?=
 =?us-ascii?Q?h9GdMc+jvAI68vcjaVnaM6XUS1nbj5HhJbEgk+g/L6Adpo8yVUuy4MkmOYvW?=
 =?us-ascii?Q?YxGUL4Xpga2Gc0lingecCpVd2EMQmaglYYSm9vtq5eS2U4uvEyrE5yWShfXE?=
 =?us-ascii?Q?FngHDQ2F2jzYP6W8OUOgGZr0mOj5XHdurO+fyhewsaVpUHtYh3gzI0d5rj6L?=
 =?us-ascii?Q?jEgVQFcD5Nv7x/W7LJAbHuORD/jFXi7l3MmCs/yuzSn0aqlkmm2Dnp3UeXbZ?=
 =?us-ascii?Q?jwneb8VW/tC5J3UhVlNmpFUdB5/Yu1yb/syVUOPR8lwzKA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ed24a7-d0ba-4e6f-d527-08d8cc10fe6c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:07:43.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQ18cgQCSMquvyQRJottCLQOtMT9ROnRHU3Ji8YcMLChhnxLngTdN4eDT+1+ivQHEuLt4GMMuPqBytA1KtbPqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Convert the imx rproc binding to DT schema format using json-schema.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 59 +++++++++++++++++++
 .../bindings/remoteproc/imx-rproc.txt         | 33 -----------
 2 files changed, 59 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
new file mode 100644
index 000000000000..5e906fa6a39d
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: NXP iMX6SX/iMX7D Co-Processor Bindings
+
+description:
+  This binding provides support for ARM Cortex M4 Co-processor found on some NXP iMX SoCs.
+
+maintainers:
+  - Peng Fan <peng.fan@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx7d-cm4
+      - fsl,imx6sx-cm4
+
+  clocks:
+    maxItems: 1
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to syscon block which provide access to System Reset Controller
+
+  memory-region:
+    description:
+      If present, a phandle for a reserved memory area that used for vdev buffer,
+      resource table, vring region and others used by remote processor.
+
+required:
+  - compatible
+  - clocks
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx7d-clock.h>
+    m4_reserved_sysmem1: cm4@80000000 {
+      reg = <0x80000000 0x80000>;
+    };
+
+    m4_reserved_sysmem2: cm4@81000000 {
+      reg = <0x81000000 0x80000>;
+    };
+
+    imx7d-cm4 {
+      compatible	= "fsl,imx7d-cm4";
+      memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
+      syscon		= <&src>;
+      clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
deleted file mode 100644
index fbcefd965dc4..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-NXP iMX6SX/iMX7D Co-Processor Bindings
-----------------------------------------
-
-This binding provides support for ARM Cortex M4 Co-processor found on some
-NXP iMX SoCs.
-
-Required properties:
-- compatible		Should be one of:
-				"fsl,imx7d-cm4"
-				"fsl,imx6sx-cm4"
-- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
-- syscon		Phandle to syscon block which provide access to
-			System Reset Controller
-
-Optional properties:
-- memory-region		list of phandels to the reserved memory regions.
-			(See: ../reserved-memory/reserved-memory.txt)
-
-Example:
-	m4_reserved_sysmem1: cm4@80000000 {
-		reg = <0x80000000 0x80000>;
-	};
-
-	m4_reserved_sysmem2: cm4@81000000 {
-		reg = <0x81000000 0x80000>;
-	};
-
-	imx7d-cm4 {
-		compatible	= "fsl,imx7d-cm4";
-		memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
-		syscon		= <&src>;
-		clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
-	};
-- 
2.30.0

