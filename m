Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42022C433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B18C61182
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhDHB7k (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 21:59:40 -0400
Received: from mail-eopbgr140054.outbound.protection.outlook.com ([40.107.14.54]:64320
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229558AbhDHB7j (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 21:59:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BipYPCUNJeaTvgH+mKbfExDiS3++7MKueWKCdN91Nj10s+80ATmxsdsuwu+h272LPSZdfz3zwJbcfaT/LpSyOe63jt8F6YmhyC47PEI9Ifi04RHsis+3+pdEYoh6H6NSU2HJFWUCU0TKtB8ZCYHD+mwpqZIBy9KWTkxUEwYjO6psN8Vmq/od7HYLzjPRPmRn/8LKM2jheGZklxb/4ORa+Carabnv74sOyXe+RpAQQXNUwijQ2iv6WEYh36ieR14PFnmDqAC2QDRHVto8GNH8l3MUwPJAjLU4oIY1w7/mVxn9a3VBzFaQ/Z4sAfbJoblqtckGoMbhsfdPK2eb+8nJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L51opwNZRKypVYTTxBtVtELkUAD4g3SeP/WDlpd38ko=;
 b=D+517yBWv0gddVPmk5kB0217NgtH/uQyKtH0n/b+2hvWhW6IGsYEdyIoYwf8JEjEJmDpclwK8tTyO8l5wpIvTmnKZR4CiaTR9+0dhoRYV49a//7TFRI15N/0fXqjGgCuaKGOBYi2N+ya7Po0eQs8ueohqQs7nB9BgNF74WNmCBOcPOkYcabQwWiXU119PpoLiET67n2eNj7BHmlTkkhrqDunmakg1BpzM21vcRLF9t7jIv8F5HYgXo4kEejB3Z+toM+zk+Ir+j4MaO9J7m4AY6XyictJ9fURGUZu7eGHTz5suWQORa3hrH0sNlJNKIcVywf5QHqa4CEYT0XQsf+A2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L51opwNZRKypVYTTxBtVtELkUAD4g3SeP/WDlpd38ko=;
 b=mvRIv9EWBrqCUHOAOFZ+u+XtWdWLrl9YSVGBh1q2QUTqUBP+U4MWxRRSEg7gLusLOt3slerRd/IXZbNdhfKQU2lGiy1E9rnnilLSMTtF+pZ0qYITpAngRvChDXQ+xCXxnkfX3FotKXFxX0C3oY++7CnQcxxyG5R7wAiHCCfAsZ4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8140.eurprd04.prod.outlook.com (2603:10a6:10:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 01:59:25 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 01:59:25 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 0/4] remoteproc: imx_rproc: support remote cores booted early
Date:   Thu,  8 Apr 2021 09:44:45 +0800
Message-Id: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0219.apcprd02.prod.outlook.com
 (2603:1096:201:20::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0219.apcprd02.prod.outlook.com (2603:1096:201:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 01:59:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 807a6ce8-99e8-421a-7f16-08d8fa31ef6b
X-MS-TrafficTypeDiagnostic: DB9PR04MB8140:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB81407F486F0856CB5230AC15C9749@DB9PR04MB8140.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYg3F4frZIGW9adKWVGjIMAhT51fkPXdswaXDdiKOztHpbdXXUK+mX+GHpfIsqWyW0kLfv4AIuxZUjtNYZTGrSBAt3hEIrVlI/umUThtXURS/d6u+wWWEt3dVpLhcFz/PSUljSfwXIuSLzfEfedceWAVGsjTbpdDqAL/hrUVp1kWzozVrEi/C3eDOYnbEvoJJSrBp0ccfehdGqMLzXddKdU56O9gaWpqyDs44gm9XJ1D6wnIg0h2c1HcGzAkcOGKz5g5sI5Fm1kfKdOYxUGDNmV8qBkPUSGHLbJPT0pVhKN5/XFuebHqB41OnBpmolMj8t5p9DS5OUbfuaG54DJYI3zl6o2E8p1qhpR9SxAqMJY7CAsuWebx1CxILchejB4z63ScJnAkQHMrbGVkNisOA2EykPNGawLW47Pa7i6V8ZYqQo78da/2qnp1sI8No0B6S8nP+vCijCyv5OOko/Jv0sFBo2HCeHv8W1RQbjggENzbQcgpF6ZQP9xLYvmKsU/7qgHWnoohSbiJ+Gde89w9p9oZM5sC5A1RC/jILD0cb1Tl/effAYC4PGKNhH+dR7N88VOjlkrlPjFhMJ+1XLkiLEgA8nnKBn+Vdo5XBc1X77bm5FzfWungo9kZViL37bEYPjYvFg+QV4nb6gtApd3tV7I+s8wzNRvAFA5e0LMoR0aiUZLFZjueHqWYM9aNpVOHq11vkd68oOPFUCTTEISNr5uN4I6V712hOpdmxJitMJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(956004)(2616005)(4326008)(83380400001)(8936002)(86362001)(6486002)(316002)(38350700001)(5660300002)(66946007)(52116002)(6666004)(8676002)(6506007)(9686003)(478600001)(26005)(7416002)(186003)(38100700001)(16526019)(6512007)(66476007)(66556008)(2906002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fWIDmxp57NGcplu1BgVKayrHu3PkSDLi5tYJKhVlRVevN9jzGwtuiiulUiRO?=
 =?us-ascii?Q?Sl/CaLLrV9s1b+hyIxbEp5hGZNRQUY1pms8lfJLj1Gcwbt0PsxkT8CzZHcaQ?=
 =?us-ascii?Q?2NqyomHQUlwobTi6jPP44/yAXzMZcUBniCIiWjzCY97k1E9UxXBw3YrtEZr/?=
 =?us-ascii?Q?JQNtnjYADX8jtKbmX6vpDPWbx0/w5FwjWq45jpTFo7q2QgAbO/AYCw7WR/jO?=
 =?us-ascii?Q?HAD1dHcxlibZpAFdnABwY/V7W4dSewvtqyIbcye7ErRehthznYeXf94fG2J9?=
 =?us-ascii?Q?0aGvN5HonB6s1HcVthV59uauXw0BY9VVPMiHofUB2anj9agBNRZk5hmRSM7b?=
 =?us-ascii?Q?Sb65NKxvtkwujUP568r/T703NpSeSJihBj3d5DIJe50e9IW0b6Oi7Ofrcupr?=
 =?us-ascii?Q?WUmLxsk//plXoEaseV1w4bbkUzFIN/XQ/RPfY6mYjywE8yTOJP1BMOlLNin7?=
 =?us-ascii?Q?3FFOznaTP56Gtdb7tIaVrmQXOkDV+pfmbXFXOYnvUKk+5vEtbPq6a/7xNbkc?=
 =?us-ascii?Q?+Qlozp2kQbKwNTslMXUmbALCqwIA9XIxbkjbnUNPrAQEGKHT3FT/kAyYF71x?=
 =?us-ascii?Q?LWjzI1wXT0K1kgePPoLYzFpe69u/ceVz4yN/qjsS3x0GZBkkVvPLm9wmYM8v?=
 =?us-ascii?Q?XaKNwqVhBAEjEP1+Qh4C4ijT80EBR4d2NEFvSi4oPzOo/Nooqyvsol1bHm33?=
 =?us-ascii?Q?EXEK0zQOEsGNyn6R7vacucpmRvRvoY7V/ty9fyvn+P02CWCOceiTZ91oWCW7?=
 =?us-ascii?Q?fJas2hLeZhnpeBOQDrICBuslmMBs6UtfcQfbLJMqVHc35tK/lhIRsfcVU670?=
 =?us-ascii?Q?tCZolzhSPh8nkq2cdZFmpTJXT+I7kBuc0Lc1t8qt/aynzZgcRVtwWAulETuB?=
 =?us-ascii?Q?6qoYiyCIHYB+YqEaTZx7rzNYtc2YBVekw4NJpG3IQjHyxdgoHimpMKwqNzRk?=
 =?us-ascii?Q?vmM9an78Wzs1v3OBxXLZ6DYOt2L+rHRvC6YY63BrGFLo22xa5jPIyy5mH+GE?=
 =?us-ascii?Q?MSWH0r2fBa52EVAF7CcBu4L/sGIkeU2ZqJJ0QKr5SVvaX4l7n1WdOMwCAKZI?=
 =?us-ascii?Q?Ss9a354KSD9uPbZofgImZJb25PokmG1tDL3FilvocDa8UbUBjyiSLoZamKDE?=
 =?us-ascii?Q?nGJlQQma5ny4hcG4qUR/i/kFWKDcPWH7icfe5bK1LZs+WT0q/x++v4paPxk6?=
 =?us-ascii?Q?N/KoSSVZ4sCWl+AIVvbMFrb2vKmTgS3eHIKcJXZPbIu646UX++cD3sX9x7yx?=
 =?us-ascii?Q?V8I1PnNlwGpiXjTJpxBIZxp/UCts5zP2sH7S9t3WgKBTU41SJl3AyYhe5CXU?=
 =?us-ascii?Q?luo/iH6end3gWCtbtmkaP+SnielhPDAdfjWpe1c/VAXqQA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807a6ce8-99e8-421a-7f16-08d8fa31ef6b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 01:59:25.4124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmHrgD68LHD7dXoOuLjF4ji9s5cNwGvht5erc88+wDf8+ViTB3iNbFYiMl7E1ICd3Bab5Pct/Ci2qG434751sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8140
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V3:
 Add R-b tag
 Typo fix in Patch 3
 Align the patch subject using remoteproc: imx_rproc:
 Update commit msg in Patch 4

V2:
 Patch [1,3]/4 is new
 Patch 4/4: Update commit message, drop unneeded code that already implemented by core

This patchset is to support booted remote cores could be attached to linux.
- Add missing of_node_put to decrease device node refcount
- Enlarge IMX7D_RPROC_MEM_MAX because need more imx_rproc_mem, such as resource table.
- Following stm32 remoteproc practice, move memory parsing to rproc_ops
- Support attaching booted cores, by adding attach, get loaded resource table and etc.

Peng Fan (4):
  remoteproc: imx_rproc: add missing of_node_put
  remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
  remoteproc: imx_rproc: move memory parsing to rproc_ops
  remoteproc: imx_rproc: support remote cores booted before Linux Kernel

 drivers/remoteproc/imx_rproc.c | 65 ++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 10 deletions(-)

-- 
2.30.0

