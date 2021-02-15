Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45841C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F6BD64E68
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhBOMrT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:47:19 -0500
Received: from mail-db8eur05on2076.outbound.protection.outlook.com ([40.107.20.76]:27782
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230397AbhBOMrJ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:47:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qfywkcr51nfK/nKk6phHkMCrU8V5FvHGG8sqWMuYAraZXL6G7vV5IMSWK3/uUhAbX8AtRN4yyPf9FsI5FlJOvEYsGErCtFO0KfLyEU+jbARjesgtUbORrb+Jka3Lmkd54JesfgHl7TTaCP8h3/JwNzIYrq7Rg//k28iZDy79l3/ww4sRw7yKE8fu7D24n0VqA0N9fSRp2vm7wYczllQjQo7q9GqLn5uvL17OOz8rbCgZTCsHOU8gZQ8hXLhnSlwNR+wo72HuGKZtsaPgYSjTk/cnHxaK9+4IFquMU6VIq1PTjFVKVlbQnksagiTwb6JjkCLuMUWQXM/T02MNl0k2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw6qdWEjO7pS0I7AeO/4Rp9HIpEHn3VBbnU2UcSJQZE=;
 b=LDmUQRz/lQvXCjvtQnyDk3H/7z194Cg5Orqk4McymCp12rxOaoipJb3HQE+EEZk0yKEQoLBrCPWDa0SyFtgBkfDFafAYdt8dVHcOkaJ1aDkUNXOJo3Sg6xttTIo9J9tyPPM+rflwxdR+0Kwg9PbgozgCsw/Dg8wueW65O3rTMh6LIkBCqp0IwxF15n/cHerAZ7B9Rt7fy6F8gFOq0wRJOeaLdZ3trJmKGU3Bq2ZhFyk71SdBS2pRG8q3K3peULc3O7jLHstbRDXtpFmW6lbitWrOVGPo1sxb/VUJvt3fe1ge9vO0+I7FLrKP0uX/ancgOk8QgnzgI3QLYzDnK+AFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw6qdWEjO7pS0I7AeO/4Rp9HIpEHn3VBbnU2UcSJQZE=;
 b=c94CqRYdvAu4ovEymQ2QKl1micxt5D4vsWtKdQP3z4SpWVO/+ZqTJS5Bim7fqb/STxMYX7Scui8mJ8MuSUGD/S+oeFXYr0v8psm5u4PMKaJf21D7umpN7+wlW/ME0z4kkvJjB29o/r+edd+m2DGujF8eJiFycVdOL8HdB0YataM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5081.eurprd04.prod.outlook.com (2603:10a6:10:23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36; Mon, 15 Feb
 2021 12:46:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:46:18 +0000
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
Date:   Mon, 15 Feb 2021 20:34:13 +0800
Message-Id: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:46:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09c89f3b-6a92-4a74-dc12-08d8d1afb029
X-MS-TrafficTypeDiagnostic: DB7PR04MB5081:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB508155925DC1E94E5CE0D9F8C9889@DB7PR04MB5081.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lIN2hQr2lifOnPDTA4nZ6gFAJJ+60h10C37YKN++fjkvCY2y8wpDnL5KzkyRvGEQSXeCPhrMM387xI4gaRYmfHiOlWj1Zjlz2pzSiktwuG65mVd+UafnbWJPKhyYFHhq+zOAMOFM461bMJt+f1AnQjJwzG2xhWqvJjkdwYHaz/bx21PQ0hJJwZMgqPZZ0joUrzoGUgaY/5R09FvMynHWQRFKGIWsZvysZ1FxR3BH0TSoRoa3SwamfvW88wwXoZMr4L2JeRp3EaQ484ADRVht1iGvN4lrp8KyU78+GTmS5nXj/Aidz6eF7nF+d+Gx1ozYN61n0LlQtp2IcrhJ7+p1K3N/QxQP4vuVciCJ2uAPodXqetkDb6GvMPS7ugh0W9PL2sWaNGUtxu8RLOsInhcxW9xo8zFJ3UCZxXY93hsZHeCOGYGF0CZ2AkCdgzl2aPk2/iag3qVhWE1iaoWqDxf1IIBTGnd1nkeUCPEpK0EVRKKjUYm6EqpJt8yWyOFDG3ZrO7sGRWxeh4haY5Rre639mcQjHTEbwzNiqm/2xwdHXrbalsZgtbNbXvuIfUM7ZdC4wgLrIayZOEvPIBzULEU+8oA9/u/x+NcNRLr3pQR99O1M5/Ix5rVZGzwSx2Czni4EU/nc2K3I94m2paqEyJGVcpJBJWyibk9IYhj8VIlzvOhuByj978ONtNYyWu5JGNoA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(4326008)(86362001)(16526019)(186003)(66556008)(6486002)(69590400012)(66946007)(2906002)(66476007)(7416002)(956004)(2616005)(26005)(83380400001)(8936002)(8676002)(9686003)(6512007)(52116002)(5660300002)(316002)(966005)(4743002)(6506007)(478600001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gAwjP/wrgJnkpWoqaM4dexp28RgvIKwHlIjVkPIPT02sQeYCVEgQyATKuQ+4?=
 =?us-ascii?Q?/8lgGXei6UeMTYFhy2X100jDdQOYkkXWnLKTs8bHkX+PzNXj4m2OGPq4aLMH?=
 =?us-ascii?Q?TzeYn4f4oyXzgN2yxCPTDt+UmR3ChFxJLpq36OVrwlTlhof5Hf7XgN1VksJU?=
 =?us-ascii?Q?srDH1djqgUvbxCTSLLq1yAFxQttmy3shcZmbje8naWglV4ImKH70sod6YzN8?=
 =?us-ascii?Q?FtEPYONYT0H93iOtFRuxBYnlMeuWm1o8isOObZZaPgluN+N2NFJ+UkqV8F48?=
 =?us-ascii?Q?j4Y2O0NcCT9BsOjEVdNamQz16RFAf6XY6e1+v0y1EID/zm/c4K3eAObq0aCy?=
 =?us-ascii?Q?GPXbD4IPRLgCW3F/Go3Z4aQrPTzVKVz9WHbO+wtz4nJKFlC671pNrMab+8eJ?=
 =?us-ascii?Q?6zLjht6RAO+rcZjlWJ2T0RuWI5veWlaw7RxleNXVpkqfmuqTGPZ1cMCJ2elk?=
 =?us-ascii?Q?UXMDN+7HJrYx47dDvhpZogc/Onj2htV3MRxsvMxaulRc1dLiACsy8XcLNzQ/?=
 =?us-ascii?Q?c6nqeXVDuut/J21fwMWRFYSZMxPfdVOJrSzcUfNoMxvBg4ZkGsZWzGxVLSe9?=
 =?us-ascii?Q?N+VS+9fzeiWYs5SjW8a+pjYoOauDy2Gz6mLVrFunVGLnsdtADWrJHauAtnLM?=
 =?us-ascii?Q?4BmWoyXcc+eGXabJcxrhG6SImpk062Tq5bteezyiIugaHH2curShBXXQjIZ/?=
 =?us-ascii?Q?w3r4cSChpHste/3Hn4ltl0MoGkzaS4Czv9VE+11wm3qbphEqpdzlQFaMSnti?=
 =?us-ascii?Q?vh/EQlSkdMCdPZfsusRSvkv1Jt/BTHDEihepsGRLKlrz9tpj9d7lsx974ILa?=
 =?us-ascii?Q?1oL62XaRIo9fI172ZyQ9dUX/SyeP5QvNpN3Dlhgn1jsrFWRl/fHk0Agfffbh?=
 =?us-ascii?Q?3wgKgPo9GTZ5V816Fcq8mcBfC0lmtxgxBYJz0CUf/E7je0sVETQigOwMsaFv?=
 =?us-ascii?Q?ARi6Pw9Ru7cM2P5hpumM6lb3eceJ557fS5G4MFBGYIVzNR+e1Weq4wqoYuSm?=
 =?us-ascii?Q?3GhtG7XGZOpeJ1kSDSu2JSzxF+IJoM48XuXiZ7YmwEcWi5vA5BPjt1lBqixP?=
 =?us-ascii?Q?6RdSGySmkU1LCgXUc08F7DQtkum3Qj7LOI9SDYLH1Nkpxg4cE2MS1hj8fRr6?=
 =?us-ascii?Q?sqNtMjlJpg/0OPV6GxplJrrsXkoeUfPllzvvGTfFr1mhNGbOedOahB+1M2XL?=
 =?us-ascii?Q?lwugHrvtWHfs5vw8kefzvqs1RiQx1kIp2Mf+D41qplAr+dqKrkQ25HepS8qh?=
 =?us-ascii?Q?y6XKBW0qbpdrwwglINLoH4wpTxLb46YxnjQro7KVynqva/rObpHi1DMJyt8k?=
 =?us-ascii?Q?rMbS5g86SYOEFc2WTMwkZ4n8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c89f3b-6a92-4a74-dc12-08d8d1afb029
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:46:18.1878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uu1VMxCWAh3DREqBgYdKpvKKW3PtxJIimbjh6NroA4ldyso85mSosz1YnQ9IPEEvz+SOy0cFcwBwZuHcnMiDlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5081
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

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

 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 109 ++++++++
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
 23 files changed, 412 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

-- 
2.30.0

