Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A25C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D681F61935
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhC3FpW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 01:45:22 -0400
Received: from mail-eopbgr20057.outbound.protection.outlook.com ([40.107.2.57]:12167
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229530AbhC3Fot (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 01:44:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU3q87xvZqIpzxupOJCrRQ35aKJDAWala4i8mSUVtXLH03ucbr4PG+g8Qndi/5Zvu0OxcE1XCILM2gzxE6wrsxy67QSPcIYx2BC1VS17cW9EhSdes/w427lhl3XmOsa6LJ3lE7NFbvuIvADMAwwhKUGbNWl4bKubIvVzbAPVKNfORTWhRkINLffqHRI65Vzcx8pMqVr1CZhcNCZnt1kgb+z4tsR0r2+E7+Wqg0S0Ah94RFQxlAk2KVm/zD21TpPYFM8jaA/ZD8HAErQ0Phu64RgNrDbTZgumrsB0ZmTEUVOC4dbh5YXEDknNfgYYmZQv4qDfrC0bqi3Y+ahvg43OIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ5WgiRHBliXEz99LRRO5Np+OE/buy94E0E3rP3XdAo=;
 b=VSg+fRZ5WBXW1DliyuBsu7dbRVzfcNINRb/37H9j1QQMqPn9rIegj5SdwmoIMaaPls0O3gJP5FPRCwNdcMLfnTZlpK/mM28RclqTrlxgqwf+FZvhzFzCnv8IhlUrcevuw/Jmz6akJguCeFqzeYq6pnZ/59H3p5+dq8L9V5SP8FYBq2XQqPn/Bzgl/5YH4T/K4IaK1aF2OlVSHBsc2p/Lh6KLmiBdWxuZ5u/sFLjEvHoOmpdB2LMnmH+pcOhbpmn2xaHIOO8O852VUQZ8ccI6zZar52PPq04SlzKgvVdesl9A/oQsRwi0k5UNGGs16LOpd77fyWtOL7imjtmL4V/ZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ5WgiRHBliXEz99LRRO5Np+OE/buy94E0E3rP3XdAo=;
 b=HDOdt0VFM+GZAJDj5xL1gp2WVCitksp6JvRvDjI/T4tDwwAr2Z+dOAG9+ytk80sVwkUVQACJXUzqLlPpbgZVKrDIhANDL1F3fWv1n1fr4Kedfzxj5IheZeMHMhIDn+Kj/lrqZd2QDi2yaooGKjOZtlIp8NRSSA+5Nd8AQggrtKE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 05:44:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 05:44:45 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 0/4] remoteproc: imx: support remote cores booted early
Date:   Tue, 30 Mar 2021 13:30:31 +0800
Message-Id: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0055.apcprd04.prod.outlook.com (2603:1096:202:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 05:44:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8da2baf0-567f-4b67-f6c2-08d8f33eec43
X-MS-TrafficTypeDiagnostic: DB7PR04MB4489:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB448938B7328E0E40C072F219C97D9@DB7PR04MB4489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vyi184EgRYlbpHKaolQTqZCdF/O+vAiy9ebzJMIucCllHCTZwqhy8WnlV3gbKAeafWIxFomL7EPDmYF0VxGF0orbIL0ErTOZEAYBtRBIkXOJQBg7coLij+hXi9FtrBYTk3NANVMWZCr2g9iq606C4fnhfoYYRgxcjXuoK8Wy+R49FB1TPEoBT+rWhDQQCZJa8jCoFfuNlhSkKJeTOdrzckvxGFn/wPvQ4RohiV92q6m4XfJGIlvF7rVHXNmvXXtUIPPnXapfP4DTdnnFZ7bWiOlb0gbYEBiGJF1WEei269BWkCbwEyKveUqphapS8O2kDw3VKNabSpNnNWgu/ub/D3Td/jc7jqNpgzQ92TxIL6Eto/XnM9H3Lhn7RbVboQUj/7bHkcamIHrJKfc5I18U8OBxYBzQCRFuD10xg1Ap4v+tNxDz25i9siTamo+ONn29I7n4T8/B3HY1+1ZYJJ4RoVeV1LA5AUZwBnRNREhZco9NtoaA5o1HFl9xJAqpEyFAcWbBGE+hlmmPy1zu4S1Mx9oOgRgkJ4RzuFet46q1qdyADRDmnps/LQg90MLQM2cfdzJ/cbknvYr7kUNKq7SkuqGErKgDvprpod+0sOdxB0sYU4R4iG55azWWgUIduFNc6wvObDd39ilEwEt2zSgsYKxEjl7X+mVNNeTrJRdIs0M1pIyTVhaZeb7fSE0cdOkJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(956004)(2616005)(86362001)(66556008)(2906002)(6666004)(9686003)(6512007)(6486002)(26005)(66476007)(66946007)(8676002)(186003)(69590400012)(478600001)(4326008)(6506007)(5660300002)(38100700001)(316002)(52116002)(4744005)(8936002)(83380400001)(16526019)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rPdohA/RXB62MMjQrwUzrr5BRD+ooSCSIx8ALXEvSGTLGGeGhw3Wu7gvYK7J?=
 =?us-ascii?Q?LhFxy8iVtXSsCNwYs9Jh089Y78puRuK6IJv+v06zKZ5VdGxRi4p8+t4oRXrb?=
 =?us-ascii?Q?nJbCNMxJEOo0hO7Fhp/QyhzPuzL8i+D3r7FGGF3AM0DV7d2NO3Lm5mZ/WjyM?=
 =?us-ascii?Q?ZtmglZ3ovj2ss13NVuPJDQnldAc7qhIZsfPI+ikTEFqcsmRY4pK2tEnojfKs?=
 =?us-ascii?Q?ko6+WwrRAvSne13ldYdzT0niF1HxMRfE0cuT0IjEn7pOysb3KW0GQsJ9tbkb?=
 =?us-ascii?Q?UVZBfq7jzFPzSQBBXgj+IHs29GjK/ok4QDq04XxlWdZbdJ69voYDSttRK7J0?=
 =?us-ascii?Q?3hxdLx/0Fd8ZIJhhMuf3zDo2dc3pE7D42rkA3ck5dGD+n7fZBpct5uJkxqbs?=
 =?us-ascii?Q?ObC+TuJ5qFVux/iQ2FV1sYaFSLVranreXgtnluenea+Nmz56FVMT9tYfesEx?=
 =?us-ascii?Q?jjhJ5DTQDnDt+zTzN0wKNqErLd1b9N2nApjPli9J2R/YEBiQbfUdgHu9EmxQ?=
 =?us-ascii?Q?fNCrQm0m3GIsc+ogbgBvImpANNRmnLB7jJIcjjO+1bJw32brJUID50OQQnuI?=
 =?us-ascii?Q?BXpJyduMXF5WkLCvpwEBp+NPK7Sp5T8uK5v674qDVyqc32TQiCtKhLJbfust?=
 =?us-ascii?Q?Z3kQbir/59XEzxAIVtMeJdaQWBwCZUe9YYMd/oB6TBYLjRxLTujSQTe3Jfom?=
 =?us-ascii?Q?8eDNsZoXnlO5e3/AZSIGdsXoDJbuMJIe2n+uSInPZYAc/ijFO+KlnLEwVYSu?=
 =?us-ascii?Q?+tuzUqkxVnVAS6EHdWgbKLoJrQqehTwGWDT532/kdK9kVswiBecHXPizS6QG?=
 =?us-ascii?Q?xk73iVPVVl5Ak0+OjH2mthG80VECPh3H+wZQC5VdL8BIhEvu8TBjrcnROqTv?=
 =?us-ascii?Q?FPNRftv+AytPolBIJPo1cMOPBMICqQtKirB2uphGX3Qxn7MwDUxAK9n2dPde?=
 =?us-ascii?Q?tg6TN1Me22YVawOr2gtOu9fmJADWtz0tllxwmOiXwC82nSTo81GmJTp7o/TJ?=
 =?us-ascii?Q?Mf2Sv/c78BQ2x2gaD3M3Z1mtLL1raeIpLYFJUBzZTn1eqa1ixpQzAb3zSQY1?=
 =?us-ascii?Q?kPYI7H/zOkTXcjE1kMQpfh9oAo/Zu2UBLl7DcPuXLDsLu+9J9QuG7nL0gIuG?=
 =?us-ascii?Q?EPng7Lp0N4pePku6iKC5yGGR1rmZ4Ts/swt8hPz5SSSFdFhnZTQxxjxGoD1e?=
 =?us-ascii?Q?oFm5ezFNRRKhrSn0oixfCOlSOkZB4hebSx8Y+yh2StLGW1U/yxsvnTsOTR6J?=
 =?us-ascii?Q?/pAdmUo1U0jXATdTV7WbAzq8IuiLP7N56k63JQfGF38kZqFeTrc5VIWUGiAs?=
 =?us-ascii?Q?w0eeXpxKtasJtYJJKBVZCaU+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da2baf0-567f-4b67-f6c2-08d8f33eec43
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 05:44:45.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTMR96XPz72UyQjqsjHw02+CjwoeKwC1KS+B71RmlZWWXmBp9XlT1Y3k4Jy7FJuxTGvKo9uZlA6fB2mUyFuPVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V2:
 Patch [1,3]/4 is new
 Patch 4/4: Update commit message, drop unneeded code that already implemented by core

This patchset is to support booted remote cores could be attached to linux.
- Add missing of_node_put to decrease device node refcount
- Enlarge IMX7D_RPROC_MEM_MAX because need more imx_rproc_mem, such as resource table.
- Following stm32 remoteproc practice, move memory parsing to rproc_ops
- Support attaching booted cores, by adding attach, get loaded resource table and etc.

Peng Fan (4):
  remoteproc: imx: add missing of_node_put
  remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
  remoteproc: imx: move memory parsing to rproc_ops
  remoteproc: imx_rproc: support remote cores booted before Linux Kernel

 drivers/remoteproc/imx_rproc.c | 65 ++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 10 deletions(-)

-- 
2.30.0

