Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEFDC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 03:21:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F353760F59
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 03:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhKJDYp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Nov 2021 22:24:45 -0500
Received: from mail-db8eur05on2057.outbound.protection.outlook.com ([40.107.20.57]:11489
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229963AbhKJDYo (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Nov 2021 22:24:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAteHzYzYiLDIe7g4FCS8XeK5YieAB2SYotMpECmy914lke1tOZUXyoh84qQd7eF/82GWokI0FwUnXoRjOqYHn2SdXhWjhMKGzAfjXSkiafjZWyLevJpGQ7RAke4xUJPExVulNL/eaBeL7vLLtNMilJozN+0L0QRLMSNQHFVWX2jD3mXZuKSdk/fd+8FR9KlwQMj/n+KAIdXUs9+X5/IS4+b2Kz0omCrdl8NrBWX25BBUV233VyPZt9I+9cauwZvjDgqK1O+XcPOSXT6ckmohHDm6ejWBP8jL62WX2IPc2i+WJHCwhywLgxH6JzsNvkDDcrGRn4bstdrp2jUzgMCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFeyw2zi+pt8ETKS1mr3VpTm0VtTk+U6+2/oOxCVtq4=;
 b=FxNmPr1Fof2q2Z56ee5Xt0f34bcuarmxA7nBHAkh+dm23e/U9Zu3xfD9RjQPiiWaAKv29aDjcXFCBe3Cdb5y5d/ygXuU+O+XNdvMPlddahbav25YnTJc1cQVK0uHmNS2p+e6y1hMACF1GpDPeK69WjWFhR4ceAIFtnLow+OmfrG8hS3l+eo3jqbh8R6hpB9L1pRK/L/6f/tJXvNoEjGPU1BvSuthU88yw3xq5oz7DUBHcY8/SRUgajQzzEnO2j8jg4uSySiu2c5Lye/ITuuMlzdoq0nZvG8/K9byy61FYzl897YHHin3ylKi0kCsfwkLZENvsHMDGeVkxh4CqAyNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFeyw2zi+pt8ETKS1mr3VpTm0VtTk+U6+2/oOxCVtq4=;
 b=Q3BNlK1yGcIVpNryBElWeXLlu5EuXVdqJgCydIPAr0mbZ6oeY4RBY+WuqQm5jLjBHRFp5kPp7xjzXhuhctlkHaWdAdTJmXrC7TUocXaw3bTqBmjZZ1VwVk1JufBJF42LO+ey6l5IQUZ/ZQ935A+3ETnb9FsUbbMKz9IkF8OdmMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU0PR04MB9324.eurprd04.prod.outlook.com (2603:10a6:10:357::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 03:21:55 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 03:21:55 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] remoteproc: coredump: correct argument 2 type for memcpy_fromio
Date:   Wed, 10 Nov 2021 11:21:01 +0800
Message-Id: <20211110032101.517487-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR02CA0020.apcprd02.prod.outlook.com (2603:1096:4:195::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 03:21:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35db7889-41da-40e5-ee86-08d9a3f93eec
X-MS-TrafficTypeDiagnostic: DU0PR04MB9324:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU0PR04MB93241C32A9AC62EF95306F91C9939@DU0PR04MB9324.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u189UPSPu8U0Vw6XBhGDHK73WQ/8Ll5Sg9sqhIcAo/6zerXiuQZ7YdJgZFZiGKLma7ukSJwwjbVXysbwy97Q7H4c5q4XADkOmhiJhQKH9Gj7Q/3a9QtbC+G/UlbeSf6c0bICpcv2xz5eALa7zFBBR/YHpWoVpq0sXdYhogXqpCuYyBP5UYS/3S4EpPYYvWjVfN3DCV0ZN/xqzUpuj5R+27OiLMpji3UEWWvT95OCrz+jP0kJyBFaiiLWAJHBe/F4GnxQiAiUNxG4LlvDR5D8Mi962jaXDF3FdVCvK2Skd9mZz1S8QxdORYPlECOXl71SMuqlfgW15Wql4n9lJ1AlrgaQ4EsQItzTrc2rQjk7V74emfsiiJ2df29MFX7NeSdw2DbzgXGBYTYv2xv68BZOm+nMTIwgiLou5GHIHdUOB5kAcFBVWw4RXOzvQidld03WGdZdbrmnBjAGSyUOJdczxpPz3pv1UiZn+zPLFWHfyDTaWshRoycownVGZe07V/RymYJi04iOiqYyRktD38vWAQDmi9L2FG5JVfd0p2K326nYJujSzD/iY2a/ZO5sh5W5CUgTBLjoYCJHA2V+NMtsEnh0JEWTyPwOA3PM1zS4D4WRskqhcC8E5SaakTXvQTJQ3PMxZxkFH8lkm4upDG/DNY9KJU1uhQI4aB8ES1+yL7r6JqMwbAWhKykjafGSB18qlY7Z78QEiZ2jCIfJzKUU3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(54906003)(66556008)(66946007)(8676002)(66476007)(7416002)(4744005)(83380400001)(8936002)(1076003)(5660300002)(2906002)(316002)(26005)(86362001)(6486002)(508600001)(6512007)(38100700002)(2616005)(956004)(38350700002)(4326008)(6506007)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2VZahK4ODq48BqOQvhoM3rbW/kHHdyd3H5Ipo5G4yvNxKusCrh6SmpfTuA0T?=
 =?us-ascii?Q?gkifVLIfmR1Js5168jErGULJBmT6MvK0YK5geybfv6VqUPUbVA2aoWrowu5b?=
 =?us-ascii?Q?0cmrzo6203rbEC2410TIrjce9BOX4VMwrlKoPNnlzz2soabd0ujmLSdwznzM?=
 =?us-ascii?Q?01LKLNh3QtKEeN7M6eFDS41KYCyEtzb3nrkyAVBaJjJNFNywfxhWm+m+CvPZ?=
 =?us-ascii?Q?Jb/uiZBt12V9XQaGnJ5E2uQQhrG+5AdincAkPDl9bfCeF32U18HYQAEfGKNF?=
 =?us-ascii?Q?qaDmEizCXg42PvJgJKxYkIuXa5mfyMzKNKq9QBzNe0pM9Us/91LxqsyQFEIw?=
 =?us-ascii?Q?Z+hY1msGPDZ99S6bTBYiwPh1DGJ98jp3hJKVi0ND11OGrVmB5d2v6kGi3Pf9?=
 =?us-ascii?Q?F6CQdtiOBMEshpoXNB47uWGEYpn2BbMCdZUNj4B3q7GEeeNEjl/XTUDQ7l4d?=
 =?us-ascii?Q?44zyD9/YD3Xi73kFYmSC9f2BIhOQpDXE6zEAyq8J0XDbbTnSkpsvRdZJGWcg?=
 =?us-ascii?Q?VPen7Vki4TsRkkY7riTlXL3s6Hk26TmN2AQv86d5MDYJDZsbwLQHYx9HP7t/?=
 =?us-ascii?Q?6heVgqh+1d6M4UvrxeOdFdwsUiJYHEUXU1p46DixiY1gQqyi8TZLWAkTmwp/?=
 =?us-ascii?Q?dk9Hr17TBQqWceJAzzJXZUncyv+8qxkbjCTUU8/sLvt6hj4qRHo7sdxy0VB5?=
 =?us-ascii?Q?4Mf8rCshyrjpwdEaKGqgM49lrfmXiVIol76zvpzw1bpDlaVNZmJsPJeCGqjG?=
 =?us-ascii?Q?iw/hINcTOQoOXzpGSNssZ6r6vtOZTGdIKyfYbBVCl1giYgmI69wIicLT8xec?=
 =?us-ascii?Q?p/2zFOZI2b7+sgGV0PmHFxuWaArdqN3ZAzg9QhDvVElq2DO+wfydWY9vhyD9?=
 =?us-ascii?Q?z+Ymzjt0jPWJB0cVGhuA2ZDDkdO2qhVM88Iga81eF90HAEaB59dTQ13T2xfb?=
 =?us-ascii?Q?6dEdFCgUWam4ROS7pKMnz623HNOldQfn4oWoo57gGLn9uxCTFdfJrDhCLf2C?=
 =?us-ascii?Q?W4iq6kkX9MqTHppuJ30w2wkmRaVMfejRH8UsWd/l1qAXbOmHyRUMu3+VRrit?=
 =?us-ascii?Q?wI3ItdtEmqDV/jg66q5KcseNcEdHK3BSzMmoDcyHxDePpl2jzeMjlNjZ5H12?=
 =?us-ascii?Q?CWYBgPRpurZ6XK1OpQHByb8rYPFpaYymXDN6txpTt55FcaWad2VcrPL385rq?=
 =?us-ascii?Q?2eh1edREnnkzdvWlmDi8JrfTv/zkyQ7M7Io/lXML6p9pnS6A65QlkYmWlr+n?=
 =?us-ascii?Q?jNF5YixJmg9HC4MoBiW/RUF9GOxK+ZXmhNyCBXuJ7tju18D8H1dXZ7im7yat?=
 =?us-ascii?Q?tvwgTaTImSHu5XgIgsCqYmSafh///CQaznNzHCheoS4M30IVPYLfHwG9Fu0Q?=
 =?us-ascii?Q?p+p+OlgRuMfpdZ7ieeMFo685VChXt6IHycHqCbIRe5kV8GpVVvRdBdE+9Z1o?=
 =?us-ascii?Q?0+kvaY38eh5TOOWUCS8G0ox71xkZ66PUlqQJFmV2iE+q7ksb+FbG2WnaxKyz?=
 =?us-ascii?Q?OpSRPtaHSSP+3TlfJNN0212yd0b36IQypG7gzaztrmFPerSJQUg/vmx5QHXd?=
 =?us-ascii?Q?A020mARO+OwCOThwcv4sfN3S2YQ98LxtPHRGmJGTiNaxh7jyfvWbfhRRCKbe?=
 =?us-ascii?Q?MoiZzrJafcVRCJhyq0a3c5M=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35db7889-41da-40e5-ee86-08d9a3f93eec
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 03:21:55.4215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFuoCPc4G72Ndwwo1Hux38empq8DIaYkRMIb/4mqKhAvWk1/5qj6TpqF+qOD8f5SLcp0teLYrBBtvui+lBN62g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9324
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Address the sparse check warning:
>> drivers/remoteproc/remoteproc_coredump.c:169:53:
sparse: warning: incorrect type in argument 2 (different address spaces)
sparse:    expected void const volatile [noderef] __iomem *src
sparse:    got void *[assigned] ptr

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_coredump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index aee657cc08c6..f39c98aa1b49 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -166,7 +166,7 @@ static void rproc_copy_segment(struct rproc *rproc, void *dest,
 			memset(dest, 0xff, size);
 		} else {
 			if (is_iomem)
-				memcpy_fromio(dest, ptr, size);
+				memcpy_fromio(dest, (void const __iomem *)ptr, size);
 			else
 				memcpy(dest, ptr, size);
 		}
-- 
2.25.1

