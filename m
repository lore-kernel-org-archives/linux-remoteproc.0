Return-Path: <SRS0=xJOp=EI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF758C388F9
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 19:39:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CDAE22268
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 19:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="R7cLxULF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgKBTje (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 14:39:34 -0500
Received: from mail-eopbgr700063.outbound.protection.outlook.com ([40.107.70.63]:18433
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726255AbgKBTjd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 14:39:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXb8skQPMbPVYMeRHzEl1u9z1zNnaX2QLaQo3+OM+hGBTw6lf2DtN0COQiECVNU5fz4il38uhhfT+AZhTHwSQEaEOuUad/z44tDf+PX2dBvCWrKBgVUG45OdVJ0ZyfWRBUxYD4oSTQkLZF55Soezu9Yvx1Eqwu5MM+CeUUuXrG/KTXbQTAaRNeFJIgaTA9vC2NoO2V0lu0/G6Ij68opWpIYNYQ4J2ovwn0tgJzBBkq+4D4jpdfVeASZvte5Wm6R7IDH2sYosddix0orIDfgCKwuFqgpyIvFrQxZHAmmCQh+7Wnwp4E/Ibu4s8543g0Nf00Hbs14tuW9VXRtiPdjOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkP8ZUs7NjshcIi46PxZCvaNq0WfiQSq2TeGOCWUXCY=;
 b=kFd23VsU03evojqSJ0Pq/xUqruDz7iXWjmfknKV6hAr4quypel/Gyq7Hmlm/QVdbVMMDxKWOQpIQGE7PGWDLbxNbEkdIx9qoLOAiMTPgVNPVYYIUf49QxCbf2c3dV6KvngK46+R8ttIBc935Ey71O8jp//wVbop3l32IThMXcedYLrPZejHAnza7L+kLQkS38zs60nIMWdWpQN1ykDryOPlXHMjfvn2xYTjVkKKzLgdW9MRv2tOLuPrlPCEY+S69Xx7xOKDZkqLHpSU17o1RmPWRyRZDMHfXprL+eJAEwlbTtbb+jto/SEH5YYSBjQHTVaG8aqakiXh7avWEl6+Rrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ni.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkP8ZUs7NjshcIi46PxZCvaNq0WfiQSq2TeGOCWUXCY=;
 b=R7cLxULFs5ZnbejIFq4ToqWRJ7YMp4q8360pa4Fg+TAEca3GXexOw3t33eMYrZLFZV+3nfHJp8nnHdYeuoatmY6gRP2vA98sdRtpOav7nfoqcxjr7bwNEdwCXCvvRQNXQv+ZKldxukzLcLTsvF/FF84HJ3AONQAv2wllC4ZRUvc=
Received: from CY4PR21CA0032.namprd21.prod.outlook.com (2603:10b6:903:12b::18)
 by SN6PR02MB4591.namprd02.prod.outlook.com (2603:10b6:805:b0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 19:39:31 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::fc) by CY4PR21CA0032.outlook.office365.com
 (2603:10b6:903:12b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.6 via Frontend
 Transport; Mon, 2 Nov 2020 19:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 19:39:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 2 Nov 2020 11:38:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 2 Nov 2020 11:38:59 -0800
Envelope-to: stefanos@xilinx.com,
 michael.auchter@ni.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=58004 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kZffP-0005Vs-MV; Mon, 02 Nov 2020 11:38:59 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <michael.auchter@ni.com>, <stefanos@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v21 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Mon, 2 Nov 2020 11:38:54 -0800
Message-ID: <20201102193859.31090-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce9af34-0868-4c52-0998-08d87f6704bb
X-MS-TrafficTypeDiagnostic: SN6PR02MB4591:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4591A4A84111F99EC7D85F4CB5100@SN6PR02MB4591.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVspPZgVuRw4i2nnk6u2piNBJDBUPwUb5dXFeKSliDJi7qik6PGoiS4250iFkA/BGQdv0fbCLyBdkp1OBGGtPmMycDiUcalDD9TkURPkTWmV+mX8eY8up97eWMhl6ypsi7NJyca82PT9QxlFtAGKjd9xCGAIxvOPHLdJT8wPJDocekqqXoHfp6z2XPu6q57/HitU59oyi3QB81ioWTRIBfZQ1e2YuC1vobYaWWd+ncIeHUIXsxowdC/N7bCizlikCTAmwOa0BHBNfUl51G6E70UxjHJDXfhIDGZlirskVpZ7Re+yQjIyoexJ+hW855046adHKY2Rf9VKqv9FApiJeXpGucc9oorm8jtoWEyCyV4oTIfzIO6iUGAdXuZMxm27dP29oYFUGHtZqGMsXfAxYq1NRz0iiL5tpDpphrC4rFBCYqWkJiJ08lIMQ+my1K82ox3Q6kR3XBttadQmdDTGCzsdf/lJbXG0fxUWVJMae/EQNhZzKJDBBkVIBE27GiSy
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(186003)(8936002)(36906005)(1076003)(2906002)(8676002)(44832011)(5660300002)(9786002)(7696005)(26005)(6666004)(4326008)(336012)(426003)(316002)(110136005)(54906003)(2616005)(36756003)(356005)(966005)(70206006)(47076004)(83380400001)(7636003)(82740400003)(82310400003)(478600001)(70586007)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 19:39:31.0011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce9af34-0868-4c52-0998-08d87f6704bb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4591
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update Xilinx R5 Remoteproc Driver as follows:
- update documentation for zynqmp_r5_probe
- restructure so that cluster initialization code is all in one place
- add memory allocation check for cluster
- add error handling in case of second core fails at probe but first core succeeded.
- remove unneeded lines in zynqmp_r5_remoteproc_remove

Previous version https://patchwork.kernel.org/project/linux-remoteproc/list/?series=374399

Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 143 ++++
 drivers/firmware/xilinx/zynqmp.c              |  96 +++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 785 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  60 ++
 6 files changed, 1093 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

