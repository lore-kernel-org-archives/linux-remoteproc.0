Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B0EC71156
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 15:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46E3D2076C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 15:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="XsWf4mOx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgK3P6N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:58:13 -0500
Received: from mail-dm6nam12on2060.outbound.protection.outlook.com ([40.107.243.60]:21525
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727373AbgK3P6M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Nov 2020 10:58:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jp481aXJPOMCWLIQF/NrY/EpHjpvTeYLxpv5o6HvZdZtwTl23d6YoBMwk63hjE3Fl7JRL3C07t7WabVBauwQ+qXG1vI5rbwrvpkB4iisDAlvsjafYYC7xz3P1k2+chNJgiNfXjaCK5QGlvnK+6B/v/AH3JNtuqq8VGhabEsIp/vwZzs5ifh2/+NvVJiQNzKs+6AzliNt/oVVc2X+xCN8Skl3W0pOFopN9DrYudwJC74TQ8nhUk2L+HD072ou+OaOa0gGKJBqqd/AkgD88zqkVPn1xu+B2mQn7cCe65s7E3EtJv5aAWRSvvoZPUotzNu07/tE7xBHri2RV5p2dptsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIULJmF7wjtlaGevAKRRqKeEwv9aSRzQj+Yo/L7n4Wk=;
 b=RUObsu6cj1tW37t5LFcP4CA2JgAnL8OUHfKbEFoEW+WRU2COudyqyx6haz4h+XNZbpmuBiufKwVZKWsJ+/U5youD2R2mbTPOF33/aFwQWmcTDD4J7w2YNxC+sI1WVIVCivlfgU5EfO0Sbo5da5jO9cb68GQezvV/2z0UqdUeX7ZyJBEZCyFPUlAm7spoiOPnexMkb82RTCCCLUhsfV95cJj7yI2JZNwEQ96pvakjBvKdbWYEFRXFDj2Qz4oqQ+inwyF+bFNxhOjyiKpukKM6G7GURwY7PKmox3X3xq1pQMirV6uhyzSJtuf+DKjZY0xWXStSMj4x5nmvzOknbkwXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIULJmF7wjtlaGevAKRRqKeEwv9aSRzQj+Yo/L7n4Wk=;
 b=XsWf4mOx5r5lFtz+3YVgjazErSj9EH8y+uEWH+ZpI/TQDBvSpwO3bt6RGw+a4FCzRPZNH0Hw9To+4oCLEjjLs54I/oEsMYjZCSoGLrdEuHz6FvHJS9cmH2zWShTJvxYRnLbDkQg4ISNUZSj1Mg9bAczr5hGpWbOzFZoChtA4nRU=
Received: from SA9PR13CA0046.namprd13.prod.outlook.com (2603:10b6:806:22::21)
 by PH0PR02MB7653.namprd02.prod.outlook.com (2603:10b6:510:5e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:57:18 +0000
Received: from SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:22:cafe::3e) by SA9PR13CA0046.outlook.office365.com
 (2603:10b6:806:22::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9 via Frontend
 Transport; Mon, 30 Nov 2020 15:57:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT018.mail.protection.outlook.com (10.152.72.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 15:57:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 30 Nov 2020 07:57:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 30 Nov 2020 07:57:17 -0800
Envelope-to: mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=47338 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kjlYD-000342-75; Mon, 30 Nov 2020 07:57:17 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v24 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Mon, 30 Nov 2020 07:57:12 -0800
Message-ID: <20201130155717.26008-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d77b04b2-d701-4aa0-e030-08d895489d17
X-MS-TrafficTypeDiagnostic: PH0PR02MB7653:
X-Microsoft-Antispam-PRVS: <PH0PR02MB76531FEFBDEAB799CB23F675B5F50@PH0PR02MB7653.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eo1Pw5X5OVa5SsoIVZcwG52KHOjeAdiDMY/jVNc3Y/9pV2TEkazM+sMjiSt/h790aSxbwbpt/z7ymLwRYoNzNOPlpx8BAzyu8m1q0w2o3BmXfuzIwBVhpPtRYNf2hDeih9Adrm5rMI9jThnp0DzOS82tKlolFLYD6ejRi8zEx8dtgIqkUw68BzvXnGMh3mCR4+KojLBmZmSBZwG0bxBzrRikbMrmx7HDfzHM+niJamQ7J+aY+hkq+PlxRP2y6lAroj8W5+9sStWko/j3NAKizwRW7sGWRmVoHkl5Lgy3iP3X42BLl/hlYN9UMbRcIN/vEV6IhHXp7uE/lM3hATP2ANwcRQxlyJg8De2QKHGLuXuUjGyGQ9tR6Omwvw9QxCstPYEiNj5mI/Y/vvQfp+EY22MAPZ46c0OtN8X0kFs0OLIOeXJBFnqJJ7rKyGUeQJEFB3qpxsOkauuuIaDC/fhWALBpPLN7wGsliHh+YDsOugTqkvqLmIPSz3IAjbD5WV2q
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(83380400001)(4326008)(36756003)(8936002)(7696005)(82310400003)(82740400003)(6666004)(7636003)(1076003)(47076004)(356005)(2906002)(5660300002)(44832011)(70206006)(426003)(70586007)(26005)(36906005)(316002)(8676002)(336012)(6916009)(966005)(478600001)(186003)(54906003)(2616005)(9786002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:57:17.7877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d77b04b2-d701-4aa0-e030-08d895489d17
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7653
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


v24:
fix  'make dt_binding_check' errors

v23:
- add TCM Nodes to xlnx-zynqmp.h to be used in R5 Remoteproc Driver
- Update grammar and capitalization in device tree bindings and R5 remoteproc
  driver comments
- Update device tree bindings and driver to align with TI Remoteproc R5 driver
- fix minor comments in v22 review

Previous version:
https://patchwork.kernel.org/project/linux-remoteproc/list/?series=384227

Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 +++++
 drivers/firmware/xilinx/zynqmp.c              |  96 ++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 872 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  64 ++
 6 files changed, 1264 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

