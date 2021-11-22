Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B852C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 06:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbhKVGoW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 01:44:22 -0500
Received: from mail-mw2nam10on2083.outbound.protection.outlook.com ([40.107.94.83]:2657
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229906AbhKVGoW (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 01:44:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVCl943PEn2SJujXrBkQHV6L3s7/HKa+K029dg8nHdBfx+hvqcwfnuugEYTph6XTMT0ptXBTtbZhPH233ARizGC7cZROBXWaqb5/bispRKA03nWPwmgamV39ZXIXmnc2t5yDqFx78nNbkGX9u4MKODKUwt3DrZIoyB6s7AfFrnNA623GGdFHhbvnHWNbGKwjIkMlaNksQNhSxM/x7RIUx1NMTmNkso+RfDJVcqjTkeWhxNsYtnQBKoOWdbJBFjUfSQ4SrFfJLXgbFLgYct34Y2iZDtaU8O0Ys6i9hLIrC5bk6NsUlwaIpCx1vS7z2nPbuL1D0KYAPdBEmAMgwOU6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AQPWPBg8KDp7ax79vniXOdGp9gtqy2QP1o51hygw5I=;
 b=bXUHJeb9wNQuSFEitJW8zUvoGbsRTLucVm3TW0dI4u7x6zYHR8SJNe6hGApTSuQtKFPmNWADN7LJG5B3JriJ5qy5ZaZQhSyOnQJFwQS7eNB4PZENhFTd774XMf1iVcydTQXpVe26Gu5pwbrWvXIwDcYcaWqLXb1fnzDQXB2WMA4Cp169K42YxA8nUSsmah+y0fOcIOfjCvWdXxt8baHQFyWzTFSi+sKoFNHwSZh9eMB3wmZW1yDh8wCYDuBr8S5JsM19n/eULPCiwx/YiWb6o+EmUOfyvY2yznFy7ZQ2q6MJbuzPBcxovY5BqgoxnWx9FXdP/1gN9kDaqdexPoPn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AQPWPBg8KDp7ax79vniXOdGp9gtqy2QP1o51hygw5I=;
 b=SNE0vubEMvIwo+g7pi/M4ZpeEIjPWB6zBGQc1fdQ/RhAfVIlFm/aYLPxVSoSIHivV0MrvPNSnu9LFTYYcN9jtn+FWGRJsT666gB9Img94VlWFyHB+6CIkHFvfs96T7ZxYkBwHqaBiw/tuA4pB4bF2UA1v4wW4cKz8eWQPay9ocU=
Received: from SA0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:806:130::9)
 by PH0PR02MB8859.namprd02.prod.outlook.com (2603:10b6:510:df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 06:41:14 +0000
Received: from SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:130:cafe::ca) by SA0PR13CA0004.outlook.office365.com
 (2603:10b6:806:130::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.7 via Frontend
 Transport; Mon, 22 Nov 2021 06:41:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0011.mail.protection.outlook.com (10.97.5.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 06:41:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 21 Nov 2021 22:41:13 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 21 Nov 2021 22:41:13 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [10.23.120.12] (port=63331)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mp30r-0003UG-8I; Sun, 21 Nov 2021 22:41:13 -0800
Message-ID: <2e06646d-67f0-1560-d968-e72c3164d6df@xilinx.com>
Date:   Mon, 22 Nov 2021 12:11:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 0/6] Add Xilinx RPU subsystem support
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ben Levinsky <ben.levinsky@xilinx.com>,
        Bill Mills <bill.mills@linaro.org>,
        Sergei Korneichuk <sergei.korneichuk@xilinx.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
From:   Tanmay Shah <tanmay.shah@xilinx.com>
In-Reply-To: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ebd2d04-dedd-4f66-4b05-08d9ad831445
X-MS-TrafficTypeDiagnostic: PH0PR02MB8859:
X-Microsoft-Antispam-PRVS: <PH0PR02MB8859CFF17E631ADDFC404ABCCA9F9@PH0PR02MB8859.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXBop40COLMBpTXSNsfXNSMoLMDdOTXtfwksGFyiB/XiTcq1blG/vlgRuew1A71z2ttMs4SmjPmYhHP+gXAIAFuY9DGscHADClDlcnS5eLoj6slMuaIr5xkFCs82M3UKzE2/fHQsVcH3Ck+u56U23JqYK2ZlCppTddwE/yvka5ALFKlCvgZu+Ux0uB2T/py4E0GRZUHAtum++Lt/Ma+xn1p8N2tv4ruxWFdF9Cwbj48M9odQP0jMELWB4E4glN3/KNPKJkYQa7GUvDjeRJ5KzOeKtnJpEucxnW5dIPM+IxpZR/KR83/Jo23PLT9HC9vw65kk8Vpmt2RDZx5l8g3A3cS7avik5HbUjTKE7pniYFUMnB0GKhSz63ghe3fh23BdCxHKlnkHfm/VUzEvKxGG4vmhbkWkLk+NORT+6AdjGf6rOSLMmeeEMZddOKyBOxmVaTJX0b2qo2Qhx7GRdL/O0Pw2Dg06t1xROwLPjiYkHdnwPTbR6sNr7O+zRbV6UPrkXwHAzvMqGW/dJebmXMi0fPvfq/l/lFTiVyBf3d2N+8cYf02tPm9F9bvKyPN/Xj/rulAxfwrv46dvn9RGQ1r02CNvCBaU1MnrRsx7ZWQKTDAvkGoIOvbI/mXtEeSw2Oko/mJ28EfrUQCEbvcEjAVFWXpS6I+ddWdUdgJncirMmwyg3vSkijaw34NdIHxmRBjI1/fQKYywbv6bFg0ENPrPfSeuitkmGq3GxL45cz52AygO/0jCpRvWku0+G+vjKF+XFLpHSK0CTUz2mh7X25e+aA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(31686004)(54906003)(82310400003)(8936002)(316002)(186003)(70586007)(53546011)(8676002)(2906002)(70206006)(356005)(5660300002)(36860700001)(44832011)(36906005)(83380400001)(426003)(110136005)(26005)(36756003)(4326008)(508600001)(6636002)(2616005)(6666004)(47076005)(31696002)(9786002)(7636003)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 06:41:14.1222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebd2d04-dedd-4f66-4b05-08d9ad831445
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8859
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 11/22/21 11:08 AM, Tanmay Shah wrote:
> This patch series adds bindings document for RPU subsystem found on Xilinx
> ZynqMP platforms. It also adds device nodes and driver to enable RPU subsytem
> in split mode and lockstep mode.
>
> Xilinx ZynqMP platform contains Remote Processing Unit(RPU). RPU subsystem
> contains two arm cortex r5f cores. RPU subsystem can be configured in
> split mode, locsktep mode and single-cpu mode.
>
> RPU subsystem also contains 4 Tightly Coupled Memory(TCM) banks. In lockstep
> mode, all 4 banks are combined and total of 256KB memory is made available to
> r5 core0. In split mode, both cores can access two TCM banks i.e. 128 KB.
>
> RPU can also fetch data and execute instructions from DDR memory along with
> TCM memory.
>
> Ben Levinsky (3):
>    firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
>      configuration.
>    firmware: xilinx: Add shutdown/wakeup APIs
>    firmware: xilinx: Add RPU configuration APIs
>
> Tanmay Shah (3):
>    dt-bindings: remoteproc: Add Xilinx RPU subsystem bindings
>    arm64: dts: xilinx: zynqmp: Add RPU subsystem device node
>    drivers: remoteproc: Add Xilinx r5 remoteproc driver
>
>   .../bindings/remoteproc/xlnx,r5f-rproc.yaml   | 139 +++
>   arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  17 +
>   drivers/firmware/xilinx/zynqmp.c              |  96 ++
>   drivers/remoteproc/Kconfig                    |  12 +
>   drivers/remoteproc/Makefile                   |   1 +
>   drivers/remoteproc/xlnx_r5_remoteproc.c       | 959 ++++++++++++++++++
>   include/dt-bindings/power/xlnx-zynqmp-power.h |   6 +
>   include/linux/firmware/xlnx-zynqmp.h          |  60 ++
>   8 files changed, 1290 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
>   create mode 100644 drivers/remoteproc/xlnx_r5_remoteproc.c
>
>
> base-commit: c1fe10d238c0256a77dbc4bf6493b9782b2a218d
> --
> 2.25.1
>
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.


Hi all, above footer (with proprietary copyrights) was appended 
automatically out of my knowledge after using git send-email command.

I will work on this and send v2 which does not contain this footer. 
Please ignore this patch series for now.

Thanks,

Tanmay


