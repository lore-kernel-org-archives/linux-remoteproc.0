Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEC7C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EFD822CB8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgLUJ5n (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:57:43 -0500
Received: from mail-vi1eur05on2065.outbound.protection.outlook.com ([40.107.21.65]:31264
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726246AbgLUJ5j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:57:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndDn42gF2Zxk+4e6Rgx3JDYVgEn7GpSmg0LzrTcwGsLF8bYZjPmWsvK9eObkjIOe0Tzl4XiwTJZ5U1K4+lxyQY74CnRy3DQRWeQUJQgXkKwuvjvhpdFr0BrYMhTZOfcVkwqlToVZyItwUCoSVAmYm5MLU9Snw5Or3vsy6XcO1e/KffSkYKZPM3vcTwsowM+mlMfthAjf3A84CNAniTGBcuF3W/jU5BVOyxIWK29lHdakuNUM48dlKIbvidE9N9sqxBAW7pjziky/v8B0cIAUm/e3g/DHGlDedGtYP0JqLW0YVqnG/RBD+ODBbGuuABBlFrR2hDu1ht6liX/4msL0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxyAEYC9fNgncJU7wK1Q2XHfhkIatQ4PvMXiftmtP3o=;
 b=R1So1vTiyJVQ7Eea072T2BTeFimqsGexiSkdXZXrKj1vrXC1XDmZLUkJ5r/gJlzyOoxqRSI99c/fDPEaoDHoeTaY/v6zpCdicFcmIFTyB9BqJNus9CI+reNiFEvzzu+Y5LUwtfbH46AI5znTO1jFQxT6b/lvv52j8hZb4a8r+GDfWDYRD3Ynno0UTZIjbA8ULRk2Hru/1YSIh17R1p4N53ZjRlpR+KGt1/QDasxYAwQUr3s4/2ppZ94tm37btmw1NbPCcQ1iZ7I7isCu/SWtu+p4i4x+fCGOXB1UI1oariQMkUn+QtLaUPu+vHlI9poYh0ye2S8FIdKS8eSX/Z6Tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxyAEYC9fNgncJU7wK1Q2XHfhkIatQ4PvMXiftmtP3o=;
 b=JkU+DnE/m2lHBSsvhO8sAKiAtrcw0Yy4vidETxkzxfuH+89E46XzFJ1QYrisVrZMnFkMH9VANpSBzKVsS646FoqDY1lCsl1DB8QNUP4JqesdybS+kK6M9PYwFo3wCroygcvzy/UoQsh29Nmpa3nZ6uiVk/46BamOdn3x0C5HoXQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:10 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/8] remoteproc: imx_rproc: support iMX8MQ/M
Date:   Mon, 21 Dec 2020 18:06:24 +0800
Message-Id: <20201221100632.7197-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 945f31dc-7d2d-42f3-c335-08d8a594212f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633E1CC8E805649651EBFF7C9C00@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jUFEKEV3d045/3W3Za5IKin22MEVRj2X5jnaeGljr3WAjZSgRmQikJH7jJp1Eg/JitZwboADlASOXg5vc/oB1zuG17gyIP3HOWNOmRf22R/2e4W9XI54JGZPp6vX7v23djKa8fo1nkcMb6c8Ff/R2IocBDe9kUX/hw620c+Y5haZPjYIlb+gkxey1AwSRajsIjhLNFsRWGvxNWdSiJt5zxvxu+CGTL2Qb9HSYGzjEn8GvNeWcl7oobFIYYwjW9TNB9Abpn4NIt+a4aRhGkAPGPvL83bKg2G2fp6GGzYoTiEU0S7TL4e4dRp11qT1IKefqRqgDOPCpi2HNEOEdLMfKFN1sf/A84rpNUNleUjHxfbgmdwyynUTefjFlKlniuIkNibB59n/Y+AGom1v7+O+uaCnUKH8BNJqwQh3dNl0YQJnaN5HYiGP24ZDEcEAozPfDVyV8K3pX5yMxOI35S/i4xlLMchooGp0n2KXkmYY6G8PNt7Tte4vSsvWlR1SvLaaxLgjQTNQTRF6IpLxE1Ua1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(66476007)(2616005)(4326008)(66556008)(16526019)(86362001)(956004)(6666004)(5660300002)(6512007)(316002)(52116002)(966005)(6486002)(66946007)(6506007)(7416002)(83380400001)(478600001)(8936002)(2906002)(8676002)(186003)(1076003)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H89vXQDKaFjepkHNMhJ1rmMSfsWirg3TT0HHOepG6Q9Q865FgzfEd+bPiqm+?=
 =?us-ascii?Q?tHKN9M41/p4udS3p2d5Z5UjMT8awtnzE8H0kJj6DApQ38tq6xtGfrl86yFz3?=
 =?us-ascii?Q?Z64QtmZr4je+x+PKwr796iek2kAIE9JXsMKIfo+90CBF7HAQQXgo9M3n8kEo?=
 =?us-ascii?Q?ZTDlM365Uy8to25MMJ/o7iUMLfoZ3lHjUMjSGKZv752qqXRUScNL7IM8fcwn?=
 =?us-ascii?Q?+fDbpJeIDoV2982JLrn07sMWkIV8TbLgAIS1IUbarYXTCH48SHtvGXLVWpIy?=
 =?us-ascii?Q?cO+nWD+wBeGdLxyyYD2H8Tfw3uUwquMUPeWtgeaffTVnu1yekXr4APMdpF+Q?=
 =?us-ascii?Q?kGVsIfpjCxCVznBhBCU9An9zQpLNWseB9ulW4aa6owJiiA6xRDwFZj+q+Y3u?=
 =?us-ascii?Q?7wZ2clFXU7ZkUDqn1i2k6C4dzWIeoS8R/Fn/ZaHSuSKKtCoCxaoiVV3rfncg?=
 =?us-ascii?Q?451qAwt/u4jdM3ErHSGXe7sdnxD9q2icWnNDbaoX0cJ1yWVaK6GyCxP8A+bX?=
 =?us-ascii?Q?Gtsf6cFaPA95rJeh67x91pznbpeJO0TgwBfAxS9EJfhrSpxxMCRrZ5jcKCpq?=
 =?us-ascii?Q?sOHIJwNw0olWyl1Z3QRAuFwAAp0+aw1FXZzW+oQC1DjU2H52f4JEdAm0aFvp?=
 =?us-ascii?Q?txAbnKAhXxPHLwG7a4+XDxCSfICbiwPaiqx5jyUUATalfSHIp1ersFMABkkB?=
 =?us-ascii?Q?2uXxwVnSgXtoUWKYXvOnwf7ru6CTeAAwcSpICTuauRYIV7Zwh70VtAL0bgU6?=
 =?us-ascii?Q?uksIReWpxGEtNIQwKDJj81Vs+CnoVAVr78FdMt9EJQ1eIfePHgP2ABb3znyF?=
 =?us-ascii?Q?BHJQC5/6A3CnHKrUIQ8u5ExBvtSTGaGnTJ8E9BYYC3TS+NxmAheUahhYDJIZ?=
 =?us-ascii?Q?kUnOlbTy5oGfj2EkizQj1WzFlC1S8woDTitIu57IvSZj4Vu85PxhgA/Y1Z1d?=
 =?us-ascii?Q?Y5+Czf1lLsFkC9NRfT/eP5d9/PeiAiZdDn6JpskH1C4IHnWQPItVcrL59r9K?=
 =?us-ascii?Q?n2lC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:10.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 945f31dc-7d2d-42f3-c335-08d8a594212f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfXhBxD8mZf0l0ZEzym3gjRycLof7t1vKhVtu9QDucA9lVt+QZiHgVyKtJOQhWqolKqwOzP6krKO2UjBRTin3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V4:
 According to Bjorn's comments, add is_iomem for da to va usage
 1/8, 2/8 is new patch
 3/8, follow Bjorn's comments to correct/update the err msg.
 6/8, new patch
 8/8, use dev_err_probe to simplify code, use queue_work instead schedule_delayed_work
 https://lkml.org/lkml/2020/12/4/82

V3:
 Since I was quite busy in the past days, V3 is late
 Rebased on Linux-next
 Add R-b tags
 1/7: Add R-b tag of Mathieu, add comments
 4/7: Typo fix
 5/7: Add R-b tag of Mathieu, drop index Per Mathieu's comments
 6/7: Add R-b tag of Mathieu
 7/7: Add comment for vqid << 16, drop unneeded timeout settings of mailbox
      Use queue_work instead of schedule_delayed_work
      free mbox channels when remove

V2:
 Rebased on linux-next
 Dropped early boot feature to make patchset simple.
 Drop rsc-da
 https://patchwork.kernel.org/project/linux-remoteproc/cover/20200927064131.24101-1-peng.fan@nxp.com/

V1:
 https://patchwork.kernel.org/cover/11682461/

This patchset is to support i.MX8MQ/M coproc.
The early boot feature was dropped to make the patchset small in V2.

Since i.MX specific TCM memory requirement, add elf platform hook.
Several patches have got reviewed by Oleksij and Mathieu in v1.

Peng Fan (8):
  remoteproc: introduce is_iomem to rproc_mem_entry
  remoteproc: add is_iomem to da_to_va
  remoteproc: imx_rproc: correct err message
  remoteproc: imx_rproc: use devm_ioremap
  remoteproc: imx_rproc: add i.MX specific parse fw hook
  remoteproc: imx_rproc: support i.MX8MQ/M
  remoteproc: imx_rproc: ignore mapping vdev regions
  remoteproc: imx_proc: enable virtio/mailbox

 drivers/remoteproc/imx_rproc.c             | 259 ++++++++++++++++++++-
 drivers/remoteproc/ingenic_rproc.c         |   2 +-
 drivers/remoteproc/keystone_remoteproc.c   |   2 +-
 drivers/remoteproc/mtk_scp.c               |   6 +-
 drivers/remoteproc/omap_remoteproc.c       |   2 +-
 drivers/remoteproc/pru_rproc.c             |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c        |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c        |   2 +-
 drivers/remoteproc/qcom_wcnss.c            |   2 +-
 drivers/remoteproc/remoteproc_core.c       |   7 +-
 drivers/remoteproc/remoteproc_coredump.c   |   8 +-
 drivers/remoteproc/remoteproc_debugfs.c    |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c |  21 +-
 drivers/remoteproc/remoteproc_internal.h   |   2 +-
 drivers/remoteproc/st_slim_rproc.c         |   2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c  |   2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c   |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c         |   2 +-
 include/linux/remoteproc.h                 |   4 +-
 20 files changed, 298 insertions(+), 35 deletions(-)

-- 
2.28.0

