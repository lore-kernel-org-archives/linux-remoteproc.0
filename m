Return-Path: <SRS0=dp89=DP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC729C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 20:22:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A94D20708
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 20:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="c6cD/ixK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbgJHUW0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Oct 2020 16:22:26 -0400
Received: from mail-mw2nam12on2085.outbound.protection.outlook.com ([40.107.244.85]:41920
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728779AbgJHUW0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Oct 2020 16:22:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5BphsfE0+XNQ/Bz3cdvLiyn7wJZNgkmUyG+gts0QBqF5WOL7huRuKbq86yMBDAajstQVHHbThPQ5zZhAEDU8FgaRCjrwBDDfSLqy4ZrBjNpQHiMJ6N2KUnqq89iYKR/XXkZZ9KBPze9JKDHuE+sWCLtZZIe3Q2RFi+1V2xAQFpbpseoFwDi15Fd4BiwJOw2QSiSIeo4oDpiy6xd25436/smSjgZXcOaEjdj+cvsOLL8fvtCrfD9bnt889YGQBwK+yRvhZ8qHcM+ZvgawGxR09/k5ckWx+iHEDObAnVorVfT2r367nqZ4ELOlcD/rfSrld45RQ80R4mfT40O31h0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHaZyIgr9BrTmRcsKHicLuZJbBCRRQeLUslhE5i71aU=;
 b=Y8kXlXCU3luU7+lEJ+VjVZw9gY0GJMTb7Zy89VkFJu+ygeP4iRcd6gHVLBCVGSisX3xkUmmxHvl9XMtVdjZ+Sw5Po9/k2uctE5YUPpVBRYwwmCC1tMU2vJIzLOW0UboMEGF1akmiPKM9l8lzrZ6m3904LFGMwkxOCVfa13KM9ttaj7pZEGcHLkmVxtSQ8IdNuVV3S4QF9R8MErGm+6UTwf7yBhEv9UetYUv/s+h4a6Q3DhzLQ10dyA9tAtVEneHcIKHE5AX86tl9GdC2ORFeB5Rrr2eTdaiHCvRm+tWkrFxL8jiAo0G3+xMk9YNAB3d5oV+R9MWUhJ/GCKO+GJ5T+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHaZyIgr9BrTmRcsKHicLuZJbBCRRQeLUslhE5i71aU=;
 b=c6cD/ixKr8SI5YkdcO6xJNVyvYDjVjsdubcob445dM5/LrE4/W/5oKOemTqCPWHmDuIv7t/RYdI5LlgEj0IWXW36nH0xGF6y7IHxkb/cQwqkA7hwFeqXmakaC6QUMDC1oAFau3wnybTDgYcaGyp9sZsJEa8VBpU05BWrSNMJ7qU=
Received: from MN2PR20CA0030.namprd20.prod.outlook.com (2603:10b6:208:e8::43)
 by MWHPR02MB2783.namprd02.prod.outlook.com (2603:10b6:300:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 8 Oct
 2020 20:22:23 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:e8:cafe::b7) by MN2PR20CA0030.outlook.office365.com
 (2603:10b6:208:e8::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Thu, 8 Oct 2020 20:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with Microsoft SMTP
 Server id 15.20.3455.25 via Frontend Transport; Thu, 8 Oct 2020 20:22:23
 +0000
Received: from [149.199.38.66] (port=58725 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <stefano.stabellini@xilinx.com>)
        id 1kQcQ5-0003C9-29; Thu, 08 Oct 2020 13:21:45 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <stefano.stabellini@xilinx.com>)
        id 1kQcQg-0006fN-WB; Thu, 08 Oct 2020 13:22:23 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 098KMA2C004284;
        Thu, 8 Oct 2020 13:22:10 -0700
Received: from [10.23.120.52] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <stefanos@xilinx.com>)
        id 1kQcQU-0006XX-6t; Thu, 08 Oct 2020 13:22:10 -0700
Date:   Thu, 8 Oct 2020 13:22:09 -0700 (PDT)
From:   Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To:     Ben Levinsky <BLEVINSK@xilinx.com>, linus.walleij@linaro.org
cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Stefano Stabellini <stefanos@xilinx.com>,
        "Ed T. Mooring" <emooring@xilinx.com>,
        "sunnyliangjy@gmail.com" <sunnyliangjy@gmail.com>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        Michal Simek <michals@xilinx.com>,
        "michael.auchter@ni.com" <michael.auchter@ni.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v18 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
In-Reply-To: <BYAPR02MB4407F9D8A60519D00F317D27B50B0@BYAPR02MB4407.namprd02.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2010081304550.23978@sstabellini-ThinkPad-T480s>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com> <20201005160614.3749-5-ben.levinsky@xilinx.com> <CACRpkdb1x=U28VWZGDJh6gJSzaqeNxx0m+WtnUQZJKGvXjvXYQ@mail.gmail.com>
 <BYAPR02MB4407F9D8A60519D00F317D27B50B0@BYAPR02MB4407.namprd02.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 669c454d-befb-4637-c00b-08d86bc7dd9f
X-MS-TrafficTypeDiagnostic: MWHPR02MB2783:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2783EDB1BE41800C2F1B6CA9A00B0@MWHPR02MB2783.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8umX65HfaWHTRmhj7kAOgf3V1XHSwDSBjB6GI28SZAQ/K2y5OCdi27CoiR9WPv4Mu4xGZtzhc7eYNAcmvwV2oSA2eqRtkuUiaoNu2xZfclyzjNL/2a85dkWp0ZF4bPsm7ElRbYhcuN7G8z1VHo5WTFCB/qThIxbcXqGaJjNUwb5IA15cpAzcohVZ/Igmk1wEmUFBN8esd+gdjXXj4R0fhFbrVngiibuBc0L2M3k7+AIHyHrC0Gd7SBAbg3MRjY46m49u/Ov6wiWQIlhF/7Rvw+NBOki0/Jz+HJM1x2pjYt2f0+KGrN/ZkK5VK1iLwstXjqgWdaddR/KepI4ISY8UsAitiN6bbM2X5j/0a4M2w5gszNBp2K4d+ERKbIlbxEOXU7gmZecKeYyAcoo/AEO9JQJMAm/89qdNfP56TUtXPECdBHeoVLgLvGKD7AzJ997zYMiUwZc/cnc7hFQziTU91RF+C3qgv9Lv2FuQKPLjDc=
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(7916004)(136003)(396003)(346002)(376002)(39860400002)(46966005)(356005)(9686003)(426003)(82740400003)(47076004)(336012)(186003)(81166007)(83080400001)(82310400003)(2906002)(26005)(316002)(54906003)(9786002)(7416002)(44832011)(4326008)(4744005)(8676002)(5660300002)(8936002)(966005)(33716001)(70206006)(70586007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 20:22:23.3673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 669c454d-befb-4637-c00b-08d86bc7dd9f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2783
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 8 Oct 2020, Ben Levinsky wrote:
> > Does it mean that the main CPU see the memory of the
> > R5 as "some kind of TCM" and that TCM is physically
> > mapped at 0xffe00000 (ITCM) and 0xffe20000 (DTCM)?
> > 
> > If the first is ITCM and the second DTCM that is pretty
> > important to point out, since this reflects the harvard
> > architecture properties of these two memory areas.

Hi Linus,

I don't think Xilinx TCMs are split in ITCM and DTCM in the way you
describe here: https://www.kernel.org/doc/Documentation/arm/tcm.txt.
Either TCM could be used for anything. See
https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
at page 82.
