Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25253C433E9
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCCCC64FEE
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhCFLiK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:10 -0500
Received: from mail-am6eur05on2056.outbound.protection.outlook.com ([40.107.22.56]:36193
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230208AbhCFLhm (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:37:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoMVW8REmzEn9neeV/RkoMxRdCkt1NjEFgkYIxzlKRxeuYORa3aeMb+KVO7UxcKjvFbaFX9Gln1xrBbQumCzG2xeWtg9nucEYW8qY1OVflHx+fZQe/WBmn4LJX99l2OPVQIzjhpiykZL9M8fBydl5JuIG2pC7+Wix/YDF2aM8/DZciEG/GphqK5fA4H6R3OFONi8q89T3pwf0yQ3Rc9hr8aq6OK8iW90DFtIxSScc40liDOJRR+lROD7eytARnGv3Kke85gJoUClT1xrPrEJR/b7pvGghZWp4uypwKUgBQqbCxe5PkmFe+Srk5qnnar7oz/+6enTfJeQOG8t9r0J2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJj+qEWKY08xIrAb9Eg0x7f7Z6Zo/ICmzWhsnKsa2xs=;
 b=eF0kQUD0vErLOqXYry3EL5UOZQ/t24BxAZnpZMBlxQ4lbg+7qvxB3PdvqoVP2eGjMg1ouYEk/NeLwQgP1gnC/YYR1t/fBGym0plsSe1PuDZ6gtGsO+Fkw2SXvuyuXq7HCro74tNSYM2yjqfFFUg+0a9iSzQQgvoPA3BkA7jT8sjZ8zsynXxlZTB8vqE9kJGT6VKDAluZDFPvsGwQID86/7YZGSBqbu+WgZXUfg/m4Z9uom352+m/e6lusuk+JWClIOvvOEG7lxV8M/ijkABuLFl4oPQOhDxXlQHvhskKk1cibuQs4kSvBXCGUAghnSC6bw0yO36PGWMK7POYFwHyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJj+qEWKY08xIrAb9Eg0x7f7Z6Zo/ICmzWhsnKsa2xs=;
 b=La+yj1q8cwBHN1csSituSdRJv7tMU9pLtM/8IHrOOFXpI7BkBUJmfpUP2+xqQXIeQ4CQKuzWBaIT+NefJ0/NSEkmS2K9BRthhR/C2hIU3l9qxky28asTYnpZaVDEMCnKZ5VRBXKANa2o4XmerhYY2WuGyv5fuCO+6lD9CAE4Mlw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7659.eurprd04.prod.outlook.com (2603:10a6:10:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sat, 6 Mar
 2021 11:37:37 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:37:37 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 00/10] remoteproc: imx_rproc: support iMX8MQ/M 
Date:   Sat,  6 Mar 2021 19:24:15 +0800
Message-Id: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:37:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 729c8d38-39ca-42e4-950f-08d8e0943dea
X-MS-TrafficTypeDiagnostic: DBBPR04MB7659:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB76595F0E8AE6610CF7FFFA9BC9959@DBBPR04MB7659.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 25F4+sAoEfKiEl40bZGpSR9OpQ5UwE06H/seskt2MRQhWJrisXC9RSotSeaYVKELwIxYm1tH9yTEx0NuOY9Qd6n9yGEZRfgbbdojTTThjYAqPqW2XVEojljP+OfVeq0KeSs/UwiBfEjuc7b7vrKrc1A+62iK4y9XrKYmbcZBi5HVsFCUKB95pb9o91+CPFyfdSf+MSc4P1duvUUriB5QJafms+UXll9XwE4x7AueEgUt7NELSWBlnEKqQ0favXBGWvMm+h2VOfNeAT0GBPWrglops6eFWczjHLiVhPXK/gdv4NHUvKda/JY7IZ8YKWGFEfAshHn3nqZxcxvHltLryapfdJB6kYkG19iYDzlHiizZs9dMUo0GilJGVgthEULd5q/jH5METP4xoVbrQhVjszR26isUSf4PyD/RbamOpe7HgfyiJIUyJ9JI9Et2HJEYV99gvwTMsk1xyPCuBkMrh9BGQj23sEkyzA7Se1XqHSJtEaksgU2hqFRzeCOggswbPzjf6O0rsSv0y/6oWzcWt9vPdRQY8sLFJ67D031JUGcm0hvt6ewiaqf1D3RYgCV2Y0CS5u0riPqyqi/rCQzRNu6vd+hPLPByrZBxoLT8G4LvZGjB1zVOtocaf/TJ4MDkW4SynFvWsRaWtPy/ztOAEDkQvw7gMwgRbXv+OEOn1UvoDvNz+allYDs23qcii4O7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(86362001)(6486002)(956004)(9686003)(16526019)(5660300002)(7416002)(966005)(316002)(2616005)(6512007)(478600001)(6506007)(69590400012)(52116002)(83380400001)(4326008)(66556008)(66946007)(26005)(8676002)(66476007)(2906002)(8936002)(186003)(4743002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nbx3FYRysDKE+uPdj7zQpBs4StBHepCc+WwnRIIs3m3NMDM8kQaivVxXBl2/?=
 =?us-ascii?Q?Hb8mkMI1XUzjrXjt41JQjEC9X7c94LvjlwvDdsawlr1etM/8jLVbjVWalYLw?=
 =?us-ascii?Q?w58H2f1OEXglrrCvZKTg/2MkZ/+qH5HJutFYZJ82HOya3mna5r8fuPNSV/Re?=
 =?us-ascii?Q?oaoVtIuc9cal2gxxi4AxIPfhlRaAVDlTh3YPKa32P1RZkkrWbREEZO4eyP0C?=
 =?us-ascii?Q?rzuXOizEanY38gJWOGPPBD+JbrXhzfv9h2hx0zgx018uNclplFvHv92O8fdV?=
 =?us-ascii?Q?c9PeasX2OP13z1iN4UXQvYEO3Lrj6tub1t8aJ0beHfTs3tMflSq854orY5zg?=
 =?us-ascii?Q?pbDohAWpw5llHs50iOtd9Pw4qkRJ1+Ks4gO2WrrAw1vwxmEmtIQtpvnbeex1?=
 =?us-ascii?Q?o+acYgN3L1w9ntGnl2b+QFedZ3jZenemMFNHBt7S0M/E/KGF2GPNO09NE92r?=
 =?us-ascii?Q?RpNU1lURmQG3If3MxnUnTM89D2iw/qcapP3wlOGufnrAHbAcNdcJ6Ah7J7TC?=
 =?us-ascii?Q?GP83hVjeHpwPSXmA7DqcMJYhvbXw4JRvFASSJOB/MP5wdAduV61Lsn0XaV7V?=
 =?us-ascii?Q?Il8RHG8rpGXSOWLwgZpc9AN9hraxodAh4ussYK0X5RgMwKPikIAEjGiRgr8o?=
 =?us-ascii?Q?hAj+03fVLkksSzuUSz1uVHf25KBaIZZtXv7V3Dpbc5um/qCAYJ1SwGU4vQR3?=
 =?us-ascii?Q?efcj7TNk2HyrNCIoz/QnMpogCQrbwleZx/bTFwexvmmmPqznLQtRe4fXKV0h?=
 =?us-ascii?Q?42aE9w8tYYMGFXJfqUEp1c62DbM6IzZEMk4vjf3nZtL7jfSr9pOzdJzsg8xk?=
 =?us-ascii?Q?g81mmshfvXdeTuRsWi1/bekGyHph3eOZysRpA+OETIDtsD+DuUapwlWoFHNQ?=
 =?us-ascii?Q?mdde9m99U9rPkpOCshA7BakQ7qWg77yeQrj/kln7Oqg713CUFqF1JfRPNR06?=
 =?us-ascii?Q?DyYynn412iJkNSOMDLJtL9nh1NlpMNIpcFD2SgIxTFxb0nknr7Womtbzk+sZ?=
 =?us-ascii?Q?V2be5iKCPLjhQUdz1jWZXo/lzkWQs/5xviZFavQY+YYUxFVkFbD9E6/SLn9+?=
 =?us-ascii?Q?GxFMf7JTApDhCutEiTVCBwQ8utbaoMnsL9EEbefRTgvABUF6wgK5zDQPXqH1?=
 =?us-ascii?Q?Nh6itt/owCVDl0VzCO/TkneYC2L2QOTkRYtqRbMtdxgqPWcur/qPRQYT5Mws?=
 =?us-ascii?Q?JgnFYLTZmislKh36ytVEbZCqEAmDpjxF23lQP2hu0qZ8HXO5bVu28vjWO1WH?=
 =?us-ascii?Q?WmTHKwlpkXU7o01P6GTwPoXVodzkdvgjL9ujIm0V+4UZ276PbnM/bF6Sh2Jv?=
 =?us-ascii?Q?ZDDxSaOS5ENTrMyBjslWD8Yd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729c8d38-39ca-42e4-950f-08d8e0943dea
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:37:37.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGO4ybynncvBoapB2M5iOGrSJ/kc8/BGoUGpN0Ze6xbGmOZpReTD0WbbXgnGTySB3JNX8PD54xs9NEgiXnmiJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7659
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V13:
 Add R-b tag from Rob for patch 1.
 Drop the reserved memory node from patch 2 per Rob's comment.
 Mathieu, Bjorn
  Only patch 2 not have R-b/A-b tag, but since Rob's only has a minor comment, and
  addressed in this version, is it ok for you take into remoteproc next branch?
  Thanks.

V12:
 Add maxItems to avoid dt_bindings_check fail
 Rebased on top of linux-next

V11:
 Per Rob's comments, fix memory-region in patch 1/10
 Rebased on top of Linux-next

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

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  90 ++++++
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
 23 files changed, 393 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

-- 
2.30.0

