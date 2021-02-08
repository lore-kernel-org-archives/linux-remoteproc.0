Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F126EC43381
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF44C64EA4
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhBHJKc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:10:32 -0500
Received: from mail-am6eur05on2086.outbound.protection.outlook.com ([40.107.22.86]:49473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230327AbhBHJIl (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:08:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3FJp3lEFQinwyOaiRdlbi4Wzr/0wsd/3X0mgzzqntxE1zkm2QggX/ahx4jsOaPUnZCp628DCxQwEE1ofcUyz3NZEbuD3mrV0/7DmIbusoOl5207ShdjJzUYIs2yP+hzNNO2jubvnt0Zyi9DHzTDATv8E/+nG0raxeu0pFj9kcxYUCYk5QIDbdxz7CeFswEWq+9w+fudfwvtPFXc9ns0qrJ2psaUbnBs1jYTZyWCQGQIJQ1pDy3VF51jLANNrI/nHRexVj2htlH02TMqs6SEFg6sgsjZEk/Hxy2XYSsU87YUBI5FOX0meREfv0964MiqzrikXE2ZHCW91F8654I+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2hRMMZo8yXjlcef8YmjWoEJwGSXXJ9lGYqo1d+dTh8=;
 b=d3ynMW4cFHOz/gwV5h2dpMY/dRbCU2vCksPBmigwK2bjwRl+Qhj+bENVcSJP7oedQbywKLQvD3ivgyJLD5ICkf75JqoXssEJmjvX4xoEJiC4MpAWTsd1p2QLDenFiXGLX0MkPRVN8fjoHvLUHH9C2MtZ1Vq9x2QXVmg8tVhA2RVdcFFW3t8sfMoL42Yh9L6N+oAUCLzOxinI/nsIucaF39HFJsNf2qbnFRLo3fAedNDxCu8ZYJQNT7O84nn9pxbGLCQie6EITKhTQNQqaWPM72OTaMCJ24kNuHmCslZCkpTGxZKbxmzpBHfwxMCGxEYDtPBT04yGq+BOgYw4eSWwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2hRMMZo8yXjlcef8YmjWoEJwGSXXJ9lGYqo1d+dTh8=;
 b=IlyICTLuEOhUKezYKeQ1E5feYPDNPCaC6aVP+d8T3v/RHfs49wSI0/BGbGTg2AcC8win85XyS0zhP1bKsd9zzFlqymRSTI1kIzyZ0JtXWWoGdvYVYuX6fejlnKgWsCekCMoPxkI7NNwpLsoUkGAufTjtIR51k3a1LBk3oR91wkA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:07:37 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:07:37 +0000
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
Subject: [PATCH V10 00/10] remoteproc: imx_rproc: support iMX8MQ/M 
Date:   Mon,  8 Feb 2021 16:56:01 +0800
Message-Id: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:07:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7ac2640-305c-4de3-4c38-08d8cc10fad5
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2933002F8F885F0673E98D68C98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KaQB4yVqYQ9VYg02TuqoHplDg+bP1lWUPTgWgaZvwcGJsiT9pCNQA5dZDAEKX0m91iwL4c0fQVGn26bMIGGC5HDUJDgN5gJ6rFzF52jKLDs0ispS7io80yI8X3ApT47Q8kQP6nh11fjOCFaJB9SYNyGqYhuub+Lv0lAVJ9PGQLax6aMCUbFjTDAtJUK9vmUcrZLbzmloFoVqtYHduCGoQJo7uOk/hUlPX0RbXDV9BbmBi3OUnaZ7BjGHE6ieuECgJAiPqxyLdxirPrbGar3WqqIlsrzEAFmmESfwDHIxzVwnRtBE6TcFTn0m/9X3FN8DVjqFymwWwINAu97zCCAA9VUphIiTNx1Ov6BcZThtQoYHwe2vMQgwGOS1knZQxqLMWj2k+2Y2U7LlTzNePcF0nBfsuxHFAog+fw/Ggd8cwf/oVt697fpVWpCDmIceXHzgGYuyOuJz/v+WnJ5OZ7sS7LdNfpo6ICN3oboN3Nrra+Rt6zjLjjAlHADKIXzdizpqA2RQO9Lq1IB3RjFssnQtBbMKOnSrwHZ9gPz16VD7RutFQDcLD56OyvRZz2zSARu68fNCrsGenFyZ31B0FPmvYAjCYc7AyzKUvAgDP1wIOeOcNDnhxlth57KnDdi2tefvsootpzUrnSAy/fuy4lT5kjXn2LYku0JRDVHfSfYFcdG+HrlUbuZMUMP+MO36yIBH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(6666004)(316002)(4743002)(83380400001)(4326008)(8936002)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003)(966005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+1esIMtgYTxSHXqpuvEyi1LFnEEapiGo1UaUlk+9Lqzw4ulUrL+K5WWdsCBM?=
 =?us-ascii?Q?uLsW40vFKwn5nM1QN7gJ8MMo71vDHfHB6Y7CLk6Z8VFzY/xvdt4x2Ed+RvU0?=
 =?us-ascii?Q?scOjzxqo2ajEOvFlIuNTPOJCIP802sFa8nbZVZ5YWoG9omjQnuXGOemwRE5l?=
 =?us-ascii?Q?6DtcPI7kVI1LzKKJ1/754P9GRKp0sDWxQKz3RmQxBg978ELEOaH3S4SpHTsz?=
 =?us-ascii?Q?Hbxfw/G9nTB7i4BN8duARBp6sxt5ms1bdk8L04Y80q1X54QKP4oCXJuWU43I?=
 =?us-ascii?Q?X23LTL7zG2boYGAq+FmOSrNtiWbWu02HL/80s97awaColgu6hvX1Y427eGHX?=
 =?us-ascii?Q?Qs0ncF9JD+Ak22DkzqWfwKUDMWpC4xZlsUxnUSvuRjgaOoTtGHJCwtrrVHZg?=
 =?us-ascii?Q?N3NjwUJtZCsGcmw5X1I53OwFIPMwgM8Vy7DuVdswPI9p9cp/wpFLchQERMwO?=
 =?us-ascii?Q?LX3oKWYuTDK6G+za3luAThHBCT/znf52mAvSld4nkhcphMoj5XS2Yvhh2ijN?=
 =?us-ascii?Q?k2oEM8UFjoOWSwYo4N+kyIosS8UbAaQLP8+3plO15ZurU7ZPnY0dtkGGGMEW?=
 =?us-ascii?Q?veJlq4eu2I7YUGtUPe1RYzlFHErQcgnYzl3y4AKbyGszObiT3TD2j4xgHnjR?=
 =?us-ascii?Q?Z1jgoszHtcG46SIMrWEw+gA5YOjPoi65isiIoU29r0gN5uBrpBULwRxZQpHA?=
 =?us-ascii?Q?ysSfPp7TSrpfBveTyBHUEwegc33ENxVR4El1jgzaEI+Rw0EK1PmgRwDC5FPA?=
 =?us-ascii?Q?UPFW84k7GJGZnbkwCy11SX0ALGruuhx0HsqNBNj3K+8fadtjp/v8rSmyYQQR?=
 =?us-ascii?Q?foTfHc7JdjH1wygETH6iy5DFcyvyBxt016c+EnvCFa/ZSle6fHUKhOW6FzP0?=
 =?us-ascii?Q?sss/0y2k/q352uGUMNIXWH0GeuHZ3EvRoZzdJ4mnYb+Y7R6xnq7g6pyQ1b+n?=
 =?us-ascii?Q?eSdL0yTTrPasy8tUqdQ/mAgxK3r7TsoUUsldbQola/rrxN7MjjSA6si9XHm5?=
 =?us-ascii?Q?HECDsl8MZ1RRWMVCgGq2PdWg78IRZuBpQu9LpqaNQAJqkj3JiCEXkDaeThkB?=
 =?us-ascii?Q?OJnh1XjkP+HE1gYGMwoM4QVUznCjM/bwNcRTrjux3MKcTPybRpYL9jG9Zn1k?=
 =?us-ascii?Q?hf0xFoVQuAtTpSTWPwpVHSoguGjIbo1hXEV4wlf5soq1QtjaYXXvEB+a+3bv?=
 =?us-ascii?Q?nRifjIG/HzV1X4sWnE9yhGxASZf8mvBWmv//At++PQEkxfX5pWiEr68vGUVZ?=
 =?us-ascii?Q?HFvDpXl2C4SUcSYIcfdxyDq1HxCLzbHEFKto8e2ihTzv+W1YIPU8mD6ZIzgN?=
 =?us-ascii?Q?kIxoI+uLWV9Sk5OMKykqgLcm1IrNQnmN0nxiafQ95+3ECA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ac2640-305c-4de3-4c38-08d8cc10fad5
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:07:37.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItoHiYBuzNXp3DVIEn6dk13JpucnpeYtXdHrXM7JOlZpyH43y9I18VvM6m0GudLV0sL7Jz6eUjuXV4CN6wLCEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V10:
 Per Rob's comments, fix patch 1/10

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
2.30.0

