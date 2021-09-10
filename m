Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8349C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB08C6101A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhIJJIf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 05:08:35 -0400
Received: from mail-eopbgr70082.outbound.protection.outlook.com ([40.107.7.82]:15609
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231771AbhIJJIf (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 05:08:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaRUx6P/NFnfAcps3GExe2CA06y13BK8dM6wGghYyfo00NVc7D3PQTSCt7um55KvLARLRnJFBRBhirhvpIDNoXMLckrU3rYOhUh8mSqYhsvLg/j2kga6K2EO+8WFxBFIfOxkF985iYMQ4kbf65hApRQrdyHRK+GzVUATPeM+BBnqojl5uHJDX1AL/uX5auEtKMYkRAUGSRTpKipttUodHdI5puucPr8Cp2AqtjxJtkjaCdDf7UfQpwaRh1VpU4kJ9tRkRnidChvt1aRoLhMdCyT2Fq6LD1/7DnLixeZJIZIYe/pXHDmJMcvxh7aLeWl3gBaVtxP/EJS2zWbwQZs4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9C+NQzbT25Tv8wvrqmiliZ9NM4n52CIeSBDwTDadKu4=;
 b=HT2xz0F7shRZiF0VLO2C/A9Qbwjxpl58XGCuWowIGrazjPLYnBd0UwyZuVDE53nf4qqox4m7yMExCXKS0UCR2p/6MXZbnXkkZh3RewROtDp9OhvnS/onrpxl0ouaG4CH93fL4R4ifQuzdJcbO57v9S1sy8HeyZhEgRXl1kaiAQz7gItC5I+M1q7rfKsnOlaweAxK6yM44IKkficP9yOYeBy7HdpYqJdnJInu7TBt/dLXhw53MBKdKmWvQWyrZWNmraIjgoc460Ajn9yBvyFOnyB6JhohkzOFFumI00gi+ovfmqhFofIEMOTrC6St+s0nmTLOJDf1Z8EWxGWRvhJC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C+NQzbT25Tv8wvrqmiliZ9NM4n52CIeSBDwTDadKu4=;
 b=W3aVKRUCPxQl1soZGsAgqasS4qvSppepeuyCWfV9vdLJdigLv11FYNHbsR1BcJCOgmmCk1e1zk6EPYq91MGZyXh4pc/+TMqApOTcGIbw0B6BXYNOosBGcgmfxNBOOJWRUOt2q3PahuiOa37L+2kzanWw23QQcNHv9bMB6ubLUEA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4763.eurprd04.prod.outlook.com (2603:10a6:10:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 09:07:20 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:07:20 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 0/6] remoteproc: elf_loader and imx fix
Date:   Fri, 10 Sep 2021 17:06:15 +0800
Message-Id: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:07:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b6b1283-f93e-426d-e46f-08d9743a6536
X-MS-TrafficTypeDiagnostic: DB7PR04MB4763:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4763DC28162C707825FCF241C9D69@DB7PR04MB4763.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+vgEA1yE6920xs1/jnEPGNP5emxrLAEQSdPl7bYaIewIjKeUl3hpIROAoX1ko/cs5NXkT3YcjZRiO/wKLkEW/djcWFvpN1wQF8p5VOJeH6+LJbczsK0IJF/pYm/YC3UsnYM42zF50Xtbi+XxRHNsQJl5nSJc7sMHWHt2T2w4aXJGCt2yVmZFecOuyphlcRCFtHrUe9Rth6kat85k7sYobTKNOHkzDmwNlvra4jfIOMvo3B31ArTZIgHwbyIh/PRCiMH5YFuxtRKUpcSLLIjjpPH7O0K9ARpwiaUkUSHi78NWRgQ1mv+jnkzn5ZBKRJJTlnLYWV6FtsA8bYfy6PST4Preh2PCvyutK8DRveBXsLHG9fgyF/pYL3TLbKChL2Y7f7V+F5dtuCRcF79f0NOmluDXQIXMBfFRR/di6uiI+foRJcVzazjyxd+w8ClZGzeP8wAOgap/HWRGcdtH1M+zmT6qGx8Ongk4RkGhcfVv0cP1oADZSkD2i6EK2uyQiQC6vWaypCZvevMJh1rXXEE2EL0GRhWaprOR8YIj9+K+JqX4BOtsHqoPtTiXSEX4A+MpgUpy1tCoKlYbX8v9/B8LNfxO61F0G5pMrboexydV2EG+Q+EpxVgPrT51zXR0Hg6xFH8B0fEp/L0/YGSv/s6uHo+bPSt1MGmoWX26RFNhvEKJKxFMmoUAz2gTA5kMUzdAMZEB8zj9lTGqBesWHpO3553lC1Hzx5fu6Izb5WXOGRlYKpKqZCEVzCcIZ7Y3DMlfc00Tvzyc6jQ+kR62ZA+hwve9fljah0ooyI5Uz48T8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(6512007)(8936002)(66946007)(66556008)(66476007)(83380400001)(7416002)(6506007)(1076003)(38350700002)(38100700002)(6486002)(966005)(8676002)(316002)(186003)(52116002)(86362001)(26005)(478600001)(2906002)(2616005)(4744005)(5660300002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2KFiBJjkQxCguE99FSz4D6L1W8bTBx/wEvOAggDMP2qf9tQM44n/tWySfbVJ?=
 =?us-ascii?Q?85Ha7/FiU3FM6X0YzDsRF9m2rdsD9DAvefnu9YibyQCKra8XoZ3r5JIWWXTS?=
 =?us-ascii?Q?tCSBhjDLjQgxHbiuNLJg90bQKFVHyZEsYBy/grOWuT1aqD4Fpuz7jbn7e9fh?=
 =?us-ascii?Q?zSwmbmIPN7ISDzAvB6zPhLm6JkMPC8ltRo664QdCGX3kr3yqEIfCkBs+35/y?=
 =?us-ascii?Q?KJNbpr0IK0pUWsamcTR7FiPMDMPxqG74ShP9FLbammK8F7+AY1rvX+sFV/ZA?=
 =?us-ascii?Q?nRbz6hBoQoYJdoBezr6/yPzk3fiVbCsvGMFubcYxy/1zCo0XXjI9GB12fOD0?=
 =?us-ascii?Q?k+wmM0FJmjUgDgf1AKVGb6cb0yvexp7LF8mrDtXfgnlOiuUzVQ83XPRnfbIj?=
 =?us-ascii?Q?tSkbe+neH2OuXiAsNkG7f8sWg1Qs74T1RCDow0kw/c5CXZDOp5vNrsf0+oyw?=
 =?us-ascii?Q?LmolFQQJ6Hnp6rTDEStKfgW0kDvmdmg2pJvIu4AuGm9FpRrNKc/eQo6S0luh?=
 =?us-ascii?Q?rjcsmvzjhqO6j0pJiF8bVhBFCKSup+mW2swg8N7YnEImiwwt1CyHOWXbXpzx?=
 =?us-ascii?Q?DMrHcTVfsfvcy7BvykxI10cjpFQzMt8RPnu52SY5W8TPnukuLSi/PY6LjxGK?=
 =?us-ascii?Q?FwVjo/lYsdD6jWjBuoHVvUJAyedeumrkRrSbTQNcwMjb67jGnvQt4KN8y60R?=
 =?us-ascii?Q?XMMkCDbiqW8M5/KAWuJol4CI5J0buaYqM91G5lCZMill+6mjWgbm8A88YxC9?=
 =?us-ascii?Q?r2DhjEu2EXt4Wr3AK6g+yoD2FGQrLb/efe/1jCNmwGhxmGmcBhEoGc9J8zjP?=
 =?us-ascii?Q?oKKQR5yzuGIA+aoROFLeyxedKTKbOUuQkm4xhS7EqNagKxApDzqNlpnWzptv?=
 =?us-ascii?Q?QCm9lMrwlny7rW1By2C6uU6j+PvJUwJSLjYhs4BXNn6TAw6NXh/wbIM9LF6I?=
 =?us-ascii?Q?7DF+ITR+YcRM0OmNQVAw/+1FZ0R8Nm3IXVkpeVB8mIQjLUfwRaYxvUX4y/o2?=
 =?us-ascii?Q?Tbm7nrW9W4cw2fiD7FaLWKzKMUMVyc8yMvqX5pLQ7z16oyp3vwDQ+1H3M+fe?=
 =?us-ascii?Q?GWCE/+wfS+GAeCmzw1vs6WuGzFus6dy5vgYefXa3p/sA3fXJVygPj44m7rtV?=
 =?us-ascii?Q?lMvpARnnZ++csbnJ/G6BMzFO3ek/ot5c/Y2jKQPMy+aDVkszs6DeX4nEQrwf?=
 =?us-ascii?Q?OCo+9VlveG7aBsjg3bDs+HeqktZ5ANJog76UwVHC2r5a55P/XHzmlTCbL92u?=
 =?us-ascii?Q?ehoM71FmyDrN4FVyCbii7qu8c6sovnrqGYBS58QdNKzR8Kh2LZ+8XIjzLn+E?=
 =?us-ascii?Q?gEC097ZxrQDdncX1mpAmZs9J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6b1283-f93e-426d-e46f-08d9743a6536
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:07:20.8525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qn9/n4bqmcfg4CDNaNUXi5A68H3vvhFPVRrpIYC+iXJRL+EmF0v1FvXdzRawjRT+g0Y8r2w1LVeJOUtd1kRt1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4763
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V4:
 Add coverletter
 Spin R-b/T-b tags
 Because the v3 patchset depends on the other patch, so
 include in the patchset now: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210629014752.5659-1-peng.fan@oss.nxp.com/

Dong Aisheng (5):
  remoteproc: fix the wrong default value of is_iomem
  remoteproc: imx_rproc: fix TCM io memory type
  remoteproc: imx_rproc: fix ignoring mapping vdev regions
  remoteproc: imx_rproc: fix rsc-table name
  remoteproc: imx_rproc: change to ioremap_wc for dram

Peng Fan (1):
  remoteproc: elf_loader: fix loading segment when is_iomem true

 drivers/remoteproc/imx_rproc.c             | 43 +++++++++++++---------
 drivers/remoteproc/remoteproc_coredump.c   |  2 +-
 drivers/remoteproc/remoteproc_elf_loader.c |  4 +-
 3 files changed, 28 insertions(+), 21 deletions(-)

-- 
2.25.1

