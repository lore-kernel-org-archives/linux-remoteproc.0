Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D86C47240
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 06:50:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14EBF6140F
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 06:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhFDGwH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 02:52:07 -0400
Received: from mail-am6eur05on2071.outbound.protection.outlook.com ([40.107.22.71]:33301
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230256AbhFDGwD (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 02:52:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbqJ0cKfizk6G+ccZdQ6IwMtERz6h6ycQ0eqqGpyf2iJ8HQLvAJtf5X6OvS3pwh4krYFieVcJ5gIooJfoZ96pFtPm3ocrNRm3LM2xqBQcJ/IKUhcqgmOtEmEZ6Mf8hqsJKKrDSN/iM4Ve3OXjAASmk5/IR7zuslCdW8aTTmODAH5Ku/8BWBl0AdI0Gr9dEP/aMLmfPdtXOlOXKXuzIZEmIMoPQfUSxZa0FOZd3im1groJkrGSOqyt7usDbJRaNPdw6V1kHzj9Tp2YgtSzDhC3Tz1p7pXp/k7TdEiJP1v6Odx6qyb2GY29Vpe6kuZDJDLGealeFI2v2IcGwj2a2FOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl7kdnrmjgjMzeAsyZRRe43Smm6nZuCGyAnqgNkyU+Y=;
 b=B9NoVKuMEzpdVlCXDEnUR8hKAn2nVOsRPLRhg//XXPGNkSTCdUQ2U0kWk3cGfrK46Sv5JKwlj/DF7l4olRKa/mDuGU9hwNCYXN09EZLeUDvY0OrZCGk9xmku/Tt1vXdETQDrOWRY0Jiewlq/jlA/veiJjya7MjZtY1DS2vZ/iJ5EIcO1/jZfPEKpC/neslWp5NHTPdiXArvc0/L0Yf3LgLeboNCfVIK+uJrnOjJoxeecWgrM60eHVrQKr2FQJ37gSlD63jIlnPADU+1+WUIOQce1VhEmaBK/QwTvntSPEhke4ByEXlj738LKNVTy9rurnsQzGLj9b4lrnEnmFHZH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl7kdnrmjgjMzeAsyZRRe43Smm6nZuCGyAnqgNkyU+Y=;
 b=ZWtJYtwvU4qqYFF/lxLvTvmhX9T9UXPkRDHhJdIYdGfvdKZ4kWBSqg+1QzVEpAQg7s1cpoW3V2KMIPUi5c4nPX1W9oNvabnSdjuoaBk1RuGyOxJGZQYHQoIHO3c4KgPp6RTQkFXKwgC2llxcdSKDlF2zxKKCjzu+A31JHC1T6VY=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4236.eurprd04.prod.outlook.com (2603:10a6:5:27::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 06:50:15 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 06:50:15 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
Date:   Fri,  4 Jun 2021 15:23:10 +0800
Message-Id: <20210604072311.9186-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210604072311.9186-1-peng.fan@oss.nxp.com>
References: <20210604072311.9186-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0012.apcprd02.prod.outlook.com (2603:1096:3:17::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend Transport; Fri, 4 Jun 2021 06:50:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ff2d763-e16e-4c45-539a-08d9272501fc
X-MS-TrafficTypeDiagnostic: DB7PR04MB4236:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4236326A51227E5BB0271BBCC93B9@DB7PR04MB4236.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZVAnkUfwhbQMvCHNMCxD2pQnZzWqbJi42jVMphQmMwUN3V8W9vKmDbJz92AOjc6u3mrke3rn43/uRsgwkK3IlixJhrPqB6EoW8GAI3cRtsnlVlqfqywu2qpeCrRWwKgtNix59pw9RlTqj4x2T1SP9Vaf5yFCoQZJm+0rHdBcAPRweNxbGkucVIvMj30d4TN0CZbG7x8PA7KRJZTzUI3tp6QowsBGEKwf7E2dB2q9J99FPI2yZIiukaQIJf31sY4j373IIqPMXDVNnCuYG4ixBz62Xhvv184R13PP6/iOghL+hJuZhdnB8YggL+IExaSwPADnVSMW58iIDFD/w8mo7b3vgw3k51bnvBaurbC+xwXxlj/ITQd/zI8dSj4SL8HaBKDY37NRk4GKDHHvvG2QE37Q9qhNTMUyjRcsB8btAr0nkpOw9U+7nAg5kt+xXtk0V12ec4+VO0nzCDZB5YcdHQfVj1yvHRKddGhg8iDzCuOc4Nv60Rb/Ct8bFDK3QHNc0efukvmU7PB3z3lJQ4vQtE+K9g6bnvJcTZDjbbM5TJD0DJ3Qkn5nIOL5Qx4TzrvJF45CMeuSlxQ+y5zc8OdK1wHdgqI5b1U8omtJsEl3sD8n0OsH2hamypRAebNSuQX9nJK6gCroeTSlI8ZRZ8WCkmviY/REvQbHK+EaCSrK3OQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6486002)(6512007)(8936002)(4744005)(66556008)(5660300002)(66476007)(66946007)(8676002)(956004)(316002)(478600001)(38100700002)(38350700002)(52116002)(7416002)(4326008)(2906002)(186003)(16526019)(6506007)(86362001)(26005)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZOxWsXQvcKUugX1+JM+2G/j/wJT+MWanZpBqfg2pe+gETnCLU3dbWIXe07IG?=
 =?us-ascii?Q?46GJ9C3bvKWelBLN8SOjfapMsefc7XXst+uMJFHGmBWZIQ2Xe91dFj8KqMkn?=
 =?us-ascii?Q?RN2jJg9n0A3Xv5aCrTZ8Z2MUUIzp2K+TDymJeqHOslDM5EehNXM6Z/9nrzmy?=
 =?us-ascii?Q?TxNCz6iGB/SxfcUdCuhhYeKa7ZbKoWgMpopfEn0JpBxSLL+DR9Q8UDGrApSt?=
 =?us-ascii?Q?GKCKeT0a59dgWhcwUVriZaGdM6h7kzU+Bih/mkAwwaZdoLmiGmhbm2T7AI8H?=
 =?us-ascii?Q?KuYRdyybk62oWfvhf92LyqlvL0t6LuTYa46i9BO+najyzqQHINu2zu/p4pub?=
 =?us-ascii?Q?+wtgqIhp2W+TdyFVV/XOuheLObgFSuH34OpIfV2H4RU5Vg/2lgineZ3ns2hS?=
 =?us-ascii?Q?Wlqn3TGjvqsnXD3eLGU9QozYg2ze2uUJ2gHNmcYfwu1VqkweeIMvH7UlmRRN?=
 =?us-ascii?Q?x4Qdn5N9dnzFOC6Gl2F4MglSxz/hjmgzQESH2Yl3Bl10Q89fsEaIl+Il3qpy?=
 =?us-ascii?Q?2f8nxwSbon/32cauS7WlgQnKVHsWiHAnK6qHcGwQcFErU6JA2waXlVzwOnKz?=
 =?us-ascii?Q?akOPbwCOy8l0e9HxsgM13R1WzctdBW+lYGibUB1Mw7iO3OLiku1BegABpUrW?=
 =?us-ascii?Q?CSWZdwDPNfCufZfVsi52fcUWv29my7iwpVwqY2vvsYXsIlaIAUCYzTtuYa8f?=
 =?us-ascii?Q?cWpgSPm8w0UnNk7vZYQqFNtCBtFeO2w+w7lleaue1q2muXNWMnnUoSQ7fFhw?=
 =?us-ascii?Q?0TM0m4c5xNrf8Ntt3uF4Vkbi6HKYjDxP2iY3RYocVzvTUs6nizHtVFdPgdRd?=
 =?us-ascii?Q?zsfRF+mvisXcSDJDklacktoDPTPiWdLKdW6P6oHfgwUE5kaTrRmpZpldhVpp?=
 =?us-ascii?Q?FFed1ISQ4ienvsFKxRbeX8ybC3+ZfFRGxbpyQ0jsu2bcNf4FWJjV4vCstX3F?=
 =?us-ascii?Q?R/HKD6PR/kQk54ls2HL18Qdj46RKL/NpzN6F/1xnI03k2BHcHg8zRnHFtoMH?=
 =?us-ascii?Q?Bghv5cF50MpiQsA1mxSlS5iiBjgtFYhPazJcT3H2JRZcY+dPXgjLXrwCB6ki?=
 =?us-ascii?Q?QQ/PI+r15JiktxFNd+NVnvWWsDLtwN6kNtCzbjQkwJdXr4ElMbUfdjHHm82V?=
 =?us-ascii?Q?TJj1X59Vuv358hi9Gfm6sAK7EjCO3FKu94PTzcX9/hp1PDRY2Bai7NnTvouv?=
 =?us-ascii?Q?BoL11+Z1GCZU96ba1Z0/mFxa8unS/07Jfg/JJi6xBXfAyzNiQZ+9kN5umSu8?=
 =?us-ascii?Q?0vF4UO6DbJzin8QSklnTT5PW8cYVXM2YFs+KaaI4fplXoSWfKvonijaKZMgL?=
 =?us-ascii?Q?7CAUFzuGFleAoDr+WQzhVgt5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff2d763-e16e-4c45-539a-08d9272501fc
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 06:50:15.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IajR/2OL2vqAShrPC0wfcnNVFuFn4qGu+HyhDjOMDfuibclPvLIQAzXTAJPiLQeKIrhrv7TulhzjCy/wEc3rLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4236
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8ULP remote processor(Cortex-M33) compatible string

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 1dc34cf5a4ea..c28b767d246f 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -15,6 +15,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - fsl,imx8ulp-cm33
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
       - fsl,imx8mn-cm7
-- 
2.30.0

