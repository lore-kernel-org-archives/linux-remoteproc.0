Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A860C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C545364DC3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhBOMsI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:48:08 -0500
Received: from mail-eopbgr40044.outbound.protection.outlook.com ([40.107.4.44]:27717
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230267AbhBOMr3 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:47:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a56AWsNY1UaWLf6MAR44OP6V0mQKFBFyXGOJMiyow5lC/pu4KzhO6bvhygdQmzEy8cDmn9BTAHyg6DgPpr+908P+Auh2NxxV0XKi8AzL0fcx0pHiqgEmKoWb+exyITlqPK3tRjNhyAfbFQtJfx2YsLcSMr1O8JwFf5T04wJT4FAjvnT+2inznXD5S8BT6rm48/dcZB1GhMoFM115UyaqPvWAZ3R4AkteB2NuOSP1FfvbrGeN+uknMZ8RCrNp+XgxI4Fchw4WKlENLQAgWqVatq29kbppSCgQs3suApbQeTZN23P0sUIJznQz4qdJA0h+gXAAxLqa5rPTOqEFR3nPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSh0Klx+zNLSyY9W2gwUiOZPVVqrU82ogdPg4tjElUs=;
 b=gVXvPdVPGHWtrT5Juzsk0XpLqBfRFLAM3rFaVWJnJflUU1PC2kJcfQR6FxBI5UuNmK3+Crmnm+JDbFW2MeMPIucESwOYGZwjhjat5e/05mze71ajwfePN7958jxo5tcQM9zseIXDtpK9HCq/c6xKcKrJJ5ffKV8K1kOG9/ucZHADapU7ggOqjep6+Kr1TXz2oxpaakALhp98uiVO33NZLyGt7Ri8vSDwdvbXM2727RMsl3a+G8N/1sxurg7syK7GFjYstXFRg7qcGo2B+PwjoscVejwDpPB6FRRDzb1Nik12P/tahrvw3IjwTKiS/pK5R/W3XK/kk4aSUIWBAqsyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSh0Klx+zNLSyY9W2gwUiOZPVVqrU82ogdPg4tjElUs=;
 b=jU8Wi+6dVOME2WUH6HGLAR1MFIip+dL7gez96+YzPA4131rzL3o9HzoHy9YOxE4Tn0pc3KdsFzjJfLBkAsaEJs8KPIFlklVWt99LnoKly0XZ4aXWgy6gmGydOMCm2gOrGLmkH23p8jWByyqOO6fD6DTxk913WxMJCRCItreHdCQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:46:38 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:46:38 +0000
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
Subject: [PATCH V10 03/10] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Mon, 15 Feb 2021 20:34:16 +0800
Message-Id: <1613392463-9676-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a702995b-ef96-4bd2-cef7-08d8d1afbc0f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4091:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4091CE312E10CE6B58509D8CC9889@DB7PR04MB4091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hDrcA0Cxt6619pj54VI7XahowygU0bpacIrbUJldhb2dDV+aAJSleLBjMXA17+CTLJEff1X7kgK3xJ2yBWIHYlSEHTSay+WEEYQirTwhRBQBR6B/xgUDfr6GtKCSjWuke4IvOJ1am+Rdj8Qfct0G9DMBt1/o8hT1Dn+zLLZCapB0OuqK+C3XN2mO5fS2o2JGAGYRUSoayZqtcMsjI65p8PjGw2NQ3WVVmcHkLNU+sMMR2sdsUt/uxrdNOZItVZchfEkFpQtEnY8s0Mchf1Qx+T/OKiiqgqU5yGOFE2O5Iw1iXoFGoFgnSaa5YKVKij6w/ogxip24mME56m5sihmLWQ4BS6GyCebKmwJwaEtWa2CtJQ8/Pj0atTqfv4CYv39YHnsXAfnHQnrVEoEZd49h3HrJT+BfdBLn+vLfRaKgAw2U4v4YkNNigRYihNU/f7pzR0hR99D8iskth/I1h3v29igONhETy1zq7+qIPmT0DzsfZI8gQMHd7OIxPqhSPNlHd+of+v4/MFckte4CgfpFQlcDDmtLUYzthkVWeI3WnhWOba/JxQq+HBfjixWXy/WNqHE/ZsZDndXBigDkdUl93A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(26005)(6486002)(9686003)(478600001)(316002)(186003)(52116002)(6512007)(2906002)(16526019)(4326008)(6506007)(8936002)(2616005)(956004)(7416002)(86362001)(66476007)(66946007)(66556008)(69590400012)(5660300002)(6666004)(8676002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EVTmGrFw2C5K1cfyYZKypnRVrNMgPJ9Kxd5Ty+0zDQm1JZowgF/sG2mZ1WZD?=
 =?us-ascii?Q?lhULYq5bk9+lrrIgmXj9bW11tXoEVo6z7z5wWiIZpGW5OsWzZvheGiojKQ4a?=
 =?us-ascii?Q?fl7IwFu1jFjcZdjF/0lzXWU0W5enTskcIjuCskgktxzcMICdpHTmuZGXrWId?=
 =?us-ascii?Q?enfWNXM9KHwBH3BMkhUnD7V0bAd4VV8+rm+lz7oDXktbuwnhqUrytrKPAkF2?=
 =?us-ascii?Q?UFB0rxMCtA+54lgpg2hOg5ed3lyhciD6ULQ5L0lweKacpbwC/cUt7+hnRuaf?=
 =?us-ascii?Q?4ItRIv91aiSwQZ0ZxP8OLthEB6ux3ATaz6WLvKWv66WDAZABhlhKKK+JifEH?=
 =?us-ascii?Q?buxVASINKHyyRUyjG6WXNh+YX79J78TUox9KKbkSIIeegW9p1qhrlOfZBtH/?=
 =?us-ascii?Q?xZfsU9HsWkM9TthVx07lRcdqA2KxsBBgyj6mrPmD0/i0EEDQ+GeInkcaND72?=
 =?us-ascii?Q?xUNmHeuW13TII8U00qp1Kccp+oIvwiCCa0e582iGuuhs+N0uCW6ya2DCz9ft?=
 =?us-ascii?Q?uAlQQBZXSeUR5YjGx/Ody3uH6HMWrUZfn+XDaW7LpnwYTmtrjNOvVNkBEoQr?=
 =?us-ascii?Q?7R2U/VEhbhRj2V00xiM4kT9Mqz5Gnkw5Qk+YjeQs7xpEs8dG8AdeemOsDnil?=
 =?us-ascii?Q?A7D9rjBBWp3MWmTaGBi3Di3h3AOIqCUo2PWoEmYI01kBKw/+uqaSoXJgMxvP?=
 =?us-ascii?Q?qh+3BZGm/z0po6CnZwpE61oTbrlFi1ksYSJsmlZHvSMOAMVtppyRmtsnLDeC?=
 =?us-ascii?Q?lUin2/6oUqPXIAk4go3/qBo1M+Bil2WsU5tBH/o/jkZAdYXbRlYn1i/pX3t9?=
 =?us-ascii?Q?1mV1Ct+/YszHszE5kKnlW77F6KYE4qNcAlHRukRPQyHz1XH0UZUGX5GvudH6?=
 =?us-ascii?Q?vgFi0USRVpoU4E+fCxW86a03sBVE5rh1fOv5sLyneA8dOgyV+6kUaTQk37QW?=
 =?us-ascii?Q?0E44pd1Eet+zHRVJk4Aelx/bwaU9JVg2EKgST6m1jb0kXqNWfSG5Dj78ajfS?=
 =?us-ascii?Q?k5nzbIRja4QD+6dIxXuF9/71PX8KvPOVKqhPrq/5BpPJrFiWuKv0S3H0IcLj?=
 =?us-ascii?Q?Bs1jTtoD2OL603UTky8eM3MwMbgxIJMoDHnHDjLGFyufp72+jDoLEgsmE1jT?=
 =?us-ascii?Q?Px6UZn7eFVV2I20EUjW9xSZaSbCt73LYVJeJNfLyfGt8kWIK3UIyY0AgFdSG?=
 =?us-ascii?Q?ozImd4WPTgk0KQ568zh4+TFJoTjL79LQtBNJH9J+QMLmtI0B7m+sKC54SxTj?=
 =?us-ascii?Q?JeV1H4dezOLC5fTakZW7sSQsQXu6LEqZRpIyHI1AFiJk5Ifbt2kUkRcseHxY?=
 =?us-ascii?Q?OnS+uKoEtsuCG9UJBL/sr1H2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a702995b-ef96-4bd2-cef7-08d8d1afbc0f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:46:38.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCpEHq0AIvikTtXNE7TU/+W2UY8DEihpwEUZTl8A+5hcXBtAEO5D064R//Ds26ubeqj0KGcYf6EiDk5EcEK43A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce is_iomem to indicate this piece memory is iomem or not.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f28ee75d1005..a5f6d2d9cde2 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -315,6 +315,7 @@ struct rproc;
 /**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
+ * @is_iomem: io memory
  * @dma: dma address
  * @len: length, in bytes
  * @da: device address
@@ -329,6 +330,7 @@ struct rproc;
  */
 struct rproc_mem_entry {
 	void *va;
+	bool is_iomem;
 	dma_addr_t dma;
 	size_t len;
 	u32 da;
-- 
2.30.0

