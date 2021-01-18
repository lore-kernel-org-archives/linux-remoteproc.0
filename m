Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53D0C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:31:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75D7E22286
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391485AbhARMb0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:31:26 -0500
Received: from mail-eopbgr80082.outbound.protection.outlook.com ([40.107.8.82]:24595
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390845AbhARMbR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:31:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ht9xgGgsTc2xYi4Wi5rE5XJTSRcP2n+h4or1IVdoeuoHaN4qrt3W5tFJjdNLd/EW1je0LNj62JsK3+prM19zk6JAeEtcCXYg+JZmO3SPGdgjhNYYdlVPblOwgbkqpweD9wTU5BqISWvQvwWVUSirZmKwVtaZJRKuEOhb29yrPEhi5k2H7adSB7/C2DTSKuKsY8ikK4WydQl6LxL7vTci03X0LOOsdwnx/6klFF7a4rzDwGkIashku7TC5bDsj2CYWz84rkp/fscklfgC2TbApd01IJg2rf6/h9e/sz7aI+zXH2HhcBiSRnSFaW/S/K7D/HQ8ZQOlR7p+RmbqZQgRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DKry2gjhsPjTETZ1vRFjvc9GuFAszLzT50jYX+YN80=;
 b=ZpqwCMD16XRz/Ew6HAJc3Q0n1W+cMpOpbe3Otn4jsMfd587wNroeIjbVEGwMg6jEm5fnmw4qM37fpjFuqDRlUsI9m+c+dHolq/PwWnV/nhS5OQYr1wk4MQSo29Qyr0YHgzA1kcvO6wEC4/ZeDXyId/azrj8w+iU35MK7tgr37XA0MbgvHfEapCsFwbYQXsnhr8neDbZbPO9ivXFCZBaUS+rLIupi8b6ZEY0cuFOR+38E52nUaVT/TxAcNOIHk1JnTKw92cA0RVijGM0psYa83IEjI87xls7x32RiRbBwIpxUXzo8ymtIq3Ecj1LlNQOPIZaETnmY/qdSz6GaXDYuag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DKry2gjhsPjTETZ1vRFjvc9GuFAszLzT50jYX+YN80=;
 b=B9FuRgBelKzUUsO54RT4CycyqzI5I9vC9YMolztUzHFH9syh6tx+H/0Q3onHXESFEE+di9DDpYpAfLMFogsa/aKCMEB1hQKefCNKJH6ydhmiyYpR2jbId/44+zULznUBTDXEOn8b0QDdtG6SBgIA+i2ZamD4aoJghliGrT1cOnA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Mon, 18 Jan
 2021 12:30:27 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:30:27 +0000
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
Subject: [PATCH V7 00/10] remoteproc: imx_rproc: support iMX8MQ/M 
Date:   Mon, 18 Jan 2021 20:19:49 +0800
Message-Id: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:30:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcc79742-1856-4a0b-b32d-08d8bbacd60f
X-MS-TrafficTypeDiagnostic: DB8PR04MB7178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB7178E1DDC9D7EB5568362FBE88A40@DB8PR04MB7178.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PzIrL3y906IZvULSn58KjSszhRKQDXem0gykVAztZAkWOPvsToMPdzbdrMvKQY9gACu7beQA7lP7j9oJmiBtQESAmD/nfhQPPcaZgEiKFMZ7dCiQD2RT0w2wlsV6fOmkNXL0BAGWtssEVSnSbnOlBckjBRL21ORDKB/CutmRaLOmIVwSXHqHb99gljYRW1RI0hm9prYutAXgfIMepofr8T5qlz1vxM9is3D9OiZjYv7EweWTOEvEc/tTvchWms51sNkY5nvPMgh6EjYZ2/aFdsmkQ6xzw8M6izjJz0WkrONYEBHZv/Hz3pJtNnuMKS0qs/PqdTeC8mBy2Pe+VB2CaY/jkKDpEm0G/QoMHeTgL7FwUfToasKPO7HOWwq66ar7WEYUxzvWRzZ4PeSMuCC7ZMsSyQzNCUAWcl5e3mI/a9eJjiSYeb4OY6OpM2Sg9dsOb+NsoCjY7CrGICzuQR3+Hnpk0t0eaPukc09bDZuhnA+upEEJI8IC1EcDiqfeR0lftMq9vLYcpYGhCgU0OmfoAshTLsmyUGB6ACkuzt9bZ4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(5660300002)(2616005)(966005)(4326008)(36756003)(8936002)(69590400011)(956004)(478600001)(6666004)(186003)(26005)(6506007)(52116002)(6512007)(9686003)(66556008)(66946007)(66476007)(7416002)(2906002)(16526019)(4743002)(86362001)(8676002)(83380400001)(316002)(6486002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?V7fqUBHMqaMp0OBhSD7ek56oS4cRZXQwnatxd3+cKZGSFmyOpY3rHIJ9tw9t?=
 =?us-ascii?Q?D8ldolRI7wDwfedvnIgUvuLP7zt67I6fco5OvHWH+p6E+yKgoV9rc2j6tsjg?=
 =?us-ascii?Q?oaMi6R2HmfD1Jwai7vjrDoyG1zYMHdZWbSqHSwZurGgVH1vGmwvUpQvUZH6t?=
 =?us-ascii?Q?Z4NQmj0hT1ltNU/TJV3tKtXV5nPjIBiLcgOg6LeZxuCoqKU/sb6fLq51kfDU?=
 =?us-ascii?Q?gAhtKZCRA7hPBg3iCh5n0qlkiOEwsy+4jkDul+QTs53yLmf4jbeJ8W+IQ2Dl?=
 =?us-ascii?Q?8I2WqCfm1qEY+hXN8d8Cu1v8FdE2sbzYf7pAPp+gm49n0MkzGG0LJYodzWvc?=
 =?us-ascii?Q?P87slHguGFtWj9ai/oEdJAq7W21SiAEQo+jBKYT/X7NON9tjWIlE5vOzqNiU?=
 =?us-ascii?Q?0uYbTpqDhnaZLUWLNOqsFQJrVA6Z4sV6NDoEPDEb5uTTwsyvGrXJqJpeH6mP?=
 =?us-ascii?Q?yrPOQ56dDODkdW/VH/7PRIMV0eCMQ4Z/065Nw3Jy1g7HHt5rq2uV/JezuE9G?=
 =?us-ascii?Q?S0o5MDwkd0ig5KpGUOkbFA2GDdz2H1tqlAHyDC3wsDBt/hS0iqQSSYfTqrT8?=
 =?us-ascii?Q?OnjUCTp7+r2Qmyfc/+Qp5F5NUKA0+89iiTzWnG4Z6wmLPJTK+YnjA63qRWDH?=
 =?us-ascii?Q?pACeXiqbK1OYSuz53Bm9aojac+5+Q5IRHHxeO9k4HYoZMYCUZKSAI2pCZNvT?=
 =?us-ascii?Q?NddEg3X6Kmxm6YwZ0J2cX5lRxOeuiPdtf6MEU3i2TaFterrPeE+GRyFGPGOG?=
 =?us-ascii?Q?ohwhO/puqg6viK2St06gsbjtD7Ch4KHBtNSGemlCNSG19NrNezRWWBIr7/mC?=
 =?us-ascii?Q?eiUIWGPwqBWRhQUXjT8fHUZVkzv83Feixgn/z/Hxyy1nVPwFxmnpyIywN7r4?=
 =?us-ascii?Q?5195KB8ccE7oukzRbBRAz6g33aXxxAlO5g++xHW6uhIlJPdGBAgnAhVXUilH?=
 =?us-ascii?Q?H/7YxXpphpxesr/VGuuyd5GZh0t1/EpSm/hCMXYnxqe7DMnDkiBipkqCYrsc?=
 =?us-ascii?Q?F0sw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc79742-1856-4a0b-b32d-08d8bbacd60f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:30:27.5626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qq3YKTcxuufZrlh/zevNZg8980cKfCiAW2iONSvjjJSAeHcJSW4Av02/SZ4LyZoqJjqgsR4DGRaPvMIALXxRmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

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
 drivers/remoteproc/imx_rproc.c                | 260 +++++++++++++++++-
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
 22 files changed, 407 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

-- 
2.28.0

