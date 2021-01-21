Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68632C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:16:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B74523888
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390084AbhAUBQQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:16:16 -0500
Received: from mail-eopbgr150044.outbound.protection.outlook.com ([40.107.15.44]:16604
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732776AbhAUBPA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:15:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAdUQKrJtevu1+qDnfC2Yjtk8mWt6gvYVgQfAkGy5PIKHnxr9Sa+fqm+KxyoMHlAGs+rVtp/P5sc/EwDBB/LXvRzUbeI1QE2ni9b4sDQf1kSYcB2EnQfkBgMBcYDisud82XkfnvOMT6b87oL6FisztjFqM8MXDnEoZdIeO19ozDrSfbSCjS3fMKrUt9bvQCN4QBCzLuLvKyd6sCCJu13uHfDI5xVp8qVcSWr5cGi4SZBYIUGmyY4wkSXc2Tm+LJEhItxZwc6rot+mmcfXdJRFlnEE+d/a89kYe21ks4ceyvxocNQUgUiewFhWic02FhXsj7iE8DaESE6wZnlSHUODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Pf5IakFypYXZyH8oEJEReQcFppmY2Ke27dAkq3SXpY=;
 b=UcjIF1Y0ST8+UDmTV/cGQebOp1GPHuccscrKp6ssqpFvh3Jc8Ra0iOrVdjKli8/mNpqgSlO15XZisYBTMYnGrSFQZgUNoxxuj5YtmZ7NuDTswYAGciBo32UEj//WHF0DwiY81n94kgWsmkoOSA0nKgy2jEGZ2VilTf4Mt5HemE9GNwc6yCPPKPGdUhljoToMKairTj5jsvc6x/vykqpamU8sMzD+YzZqua8lZGyj577w5wvn9gekV0v48cdEPsFxyCsdW7Uu4ROAuthDYC2Afuo+sk72p9VOtwNaSDTmVDRBuzsZUdlRZWR9PkzroahxPi6mJw2S2XjK/SzpX/3Dhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Pf5IakFypYXZyH8oEJEReQcFppmY2Ke27dAkq3SXpY=;
 b=amak+ymcGv1oEBovx6iWeFy0U3CuapcVW8GH/uRzG2fWPRLb/QQhURmkB5tCHjUhGqke78tIiBwdpi2qppGr7eajIkMUG6XFJ3Rx7JLzAVeXaPgxbvRGwEraSYqsPfa11OYiDCj/ZCC5wwtG4AAy25IJi9x00nTxnaYbIg0WAoQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 01:14:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:14:10 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V9 00/10] remoteproc: imx_rproc: support iMX8MQ/M 
Date:   Thu, 21 Jan 2021 09:03:25 +0800
Message-Id: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56cdd050-48c1-41c2-e230-08d8bda9db2c
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7930467DEC09610F9E83984088A10@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CA2mHnyDsbdU29hO5/xZrkbEeHv3ByFeocuCBfv/5j/lIIMWOknIumLuPR55r3q2d/IM5nKTBTrSTGwEngwLda6glEv1lv5QwpHM3kslX/sJK0gykMcSeS550YvAALJ/zOC3/cGwn0ugm3jYC86PueJqsAT4NpE9t0tzWrdTNQPFiqHHqiMlSs+VFClbB2y32GB8q7NpgGFkAVhomOnkjjZNZN3YoApMmMNnfed+FnTyex1uHuKgua7akXyum2RY7raRlpkJYiR8VlPN+uBC8G+TsqFueW1OPJds0NomZ6xOeA8gCJKvdCO+6Pra4vjk7zXz+KvOSu7hO74xR7pCl5D+yveazPYINrVCx3u33v1Cw0JfSAdiKhYYBAOw/VtcmQcmySPHPTpGxjFXEqlWNTkUcQW3/hEy7jRM7Q1YUn/aShn2g6ABYVYR6wYWcK5dguPKw+EQK1z2xnVG1r8VHbjxQvJtp+dNh91vxfSTZfUbYdAlyxTub47/hZdHOTWj5XIdBFwBaUq+EeUVEJ5BGwrIYBSzUJ4ixtmiwOFqvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(966005)(2906002)(7416002)(6512007)(956004)(8936002)(52116002)(26005)(478600001)(9686003)(4743002)(316002)(2616005)(5660300002)(6506007)(86362001)(4326008)(16526019)(6486002)(186003)(8676002)(6666004)(69590400011)(36756003)(83380400001)(66946007)(66556008)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lAwMG+yeVokuCDHSUhimOJ3RSR3LuGTuSDS2JxKEIOVdWm85ikZ1IuexLiow?=
 =?us-ascii?Q?foePRPwEmS+oO6FOp8rnCLn6SH1ibCBemCxmufHf7867CUaH9G4gMan31XXe?=
 =?us-ascii?Q?pakQ5w1BKOg0rm6G52tWVY265MMgI7Ghf3ddu/O3jqDlAeU5pIBSpjt6H0Ck?=
 =?us-ascii?Q?nYNZzocUO3JmndVM56/Y4nxYyedf5d7pCSJyOY0V09HudP9tVyjU6nP24lMO?=
 =?us-ascii?Q?yYjz8AZTDVdg5UNys9MkVOeC42u+Y3qsqxtynooctuT4wTVQA5pRW72GV9cd?=
 =?us-ascii?Q?guGeBECy6CsHK4XgsNLgR4ub2ZFMzAQmjVamroehghv8TS2yddjMq1FP/+WK?=
 =?us-ascii?Q?gUkibQgJSzBmWmUj4jMjAiUN3iyIHgH6ubFWeW5rtx5JCXtSu0ko0Ugw2psA?=
 =?us-ascii?Q?a5zIL7LAGr0SR4bwp+kyDc0KJ+/bZddMA/Y1Vfl5Drjn9QZNrZxiiaG9Ni9v?=
 =?us-ascii?Q?WHgF3ctPpb/BrCVJShnq3VWDK+gzO3UOpI/O0JfPWDcURqfLw0PgSls9B1Qw?=
 =?us-ascii?Q?svPi9a+i0YC/HN3uoxTojrjz1SW0M4H3rC7pmEZU8wpjljbYEXQjWHmY6nb6?=
 =?us-ascii?Q?ocRXYUcpWXiodmqxe3LQlb4DdHlP3meCzfm0N0+s5FaBNAr+bFqdRMDhU8ds?=
 =?us-ascii?Q?os8GA+W5frdSeQDpddTkBEUi2ZtDd8tOhNp+7LTbz5T1k5i7dXG27X0oMk95?=
 =?us-ascii?Q?TgtoG5ZyY4zomFDk1oNoitKa+Agh16HPiPo/0t8fbvIV9nxzVAfFJ87qIwkm?=
 =?us-ascii?Q?F2/wXvjVfaq/HwoayGJsoo2lGYDtS4kkdu9XkkndeunVdxEbMswn2CB4IU60?=
 =?us-ascii?Q?IjqWlSjxvE/DDqDhIqtqeJkCYbEEPLikx+ELsJztVV65R7zvctlDmarIkdGA?=
 =?us-ascii?Q?I4z/Nm1cqen0PcC7lEwHU5+naLB3lNIs4QHw3NjlgwpmG9A+zLZp3N5VRjqU?=
 =?us-ascii?Q?okfRRBhTK9Ymyc/a+RKyZurqc88ddtjXpJgXG5frHKSeihxkCx9zpM3lr1FB?=
 =?us-ascii?Q?4WKN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cdd050-48c1-41c2-e230-08d8bda9db2c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:14:10.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulXgvpHs2HYxdKCNC0XAvOgswYyZnRq9kF/7QcVnmWKrU8d3FEs46HZ06gQoPLLr4ezS0OY1VDf8oFttWWGc2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V9:
 Per Mathieu's comments,
   update the tile of yaml in patch 2/10
   update the Kconfig and MODULE_DESCRIPTION, I merge this change in patch 8/10,
   since this is a minor change, I still keep Mathieu's R-b tag. If any objection, I could remove.
   Add R-b tag in Patch 10/10

 Rob, please help review patch 1/10 and 2/10

V8:
 Address sparse warning in patch 4/10 reported by kernel test robot

V7:
 Add R-b tag from Mathieu
 vdevbuffer->vdev0buffer in patch 1/10, 7/10
 correct err msg and shutdown seq per Mathieu's comments in patch 10/10
 Hope this version is ok to be merged.
 
V6:
 Add R-b tag from Mathieu
 Convert imx-rproc.txt to yaml and add dt-bindings support for i.MX8MQ/M, patch 1/10 2/10
 No other changes.

V5:
 Apply on Linux next
 Add V5 subject prefix
 Add R-b tag from Bjorn for 1/8, 2/8, 3/8
 https://patchwork.kernel.org/project/linux-remoteproc/cover/20201229033019.25899-1-peng.fan@nxp.com/

V4:
 According to Bjorn's comments, add is_iomem for da to va usage
 1/8, 2/8 is new patch
 3/8, follow Bjorn's comments to correct/update the err msg.
 6/8, new patch
 8/8, use dev_err_probe to simplify code, use queue_work instead schedule_delayed_work

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
 https://lkml.org/lkml/2020/12/4/82

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


Peng Fan (10):
  dt-bindings: remoteproc: convert imx rproc bindings to json-schema
  dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
  remoteproc: introduce is_iomem to rproc_mem_entry
  remoteproc: add is_iomem to da_to_va
  remoteproc: imx_rproc: correct err message
  remoteproc: imx_rproc: use devm_ioremap
  remoteproc: imx_rproc: add i.MX specific parse fw hook
  remoteproc: imx_rproc: support i.MX8MQ/M
  remoteproc: imx_rproc: ignore mapping vdev regions
  remoteproc: imx_proc: enable virtio/mailbox

 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 108 ++++++++
 .../bindings/remoteproc/imx-rproc.txt         |  33 ---
 drivers/remoteproc/Kconfig                    |   6 +-
 drivers/remoteproc/imx_rproc.c                | 262 +++++++++++++++++-
 drivers/remoteproc/ingenic_rproc.c            |   2 +-
 drivers/remoteproc/keystone_remoteproc.c      |   2 +-
 drivers/remoteproc/mtk_scp.c                  |   6 +-
 drivers/remoteproc/omap_remoteproc.c          |   2 +-
 drivers/remoteproc/pru_rproc.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c           |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |   2 +-
 drivers/remoteproc/qcom_wcnss.c               |   2 +-
 drivers/remoteproc/remoteproc_core.c          |   7 +-
 drivers/remoteproc/remoteproc_coredump.c      |   8 +-
 drivers/remoteproc/remoteproc_debugfs.c       |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c    |  21 +-
 drivers/remoteproc/remoteproc_internal.h      |   2 +-
 drivers/remoteproc/st_slim_rproc.c            |   2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c     |   2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c      |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c            |   2 +-
 include/linux/remoteproc.h                    |   4 +-
 23 files changed, 411 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

-- 
2.28.0

