Return-Path: <SRS0=H4uj=DH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00440C4741F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 22:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A22162075F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 22:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="gwW1SWSS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731722AbgI3WkV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Sep 2020 18:40:21 -0400
Received: from mail-eopbgr750084.outbound.protection.outlook.com ([40.107.75.84]:14450
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731699AbgI3WkU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 18:40:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRwmveQBsfS335fXK5vSIJK0xYMyp5ltrTsxR7xyQ+2+Z3fKn3+5Sowg7qWMBcv1Bbsr1eNqjJdYThEcXpb9mUGrQbo7QSMhiOVvAA/Yee4fY7Fphv4HWAEHBeXemsQwQuasMZXW/Dks5RRa0DeEkE3lTbzQv2hlGAKwGBfbQ8RmFKt6nAa6AXybrvm9sfXPJD7jrLHG9wCiLbHDnGIobPY8hGNJv7Dm/mB3GISgbnGcpmZRLCtyNr+apKvTC7yqAvQKCR0lmdH39XKScE2eOXFfoIWkC/odM8kkKMLsQvzUgKrKaBNHHqOolTMph9MXykrW8wW7XOnuR+EI7CMyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjUXamIu4057vaSsOHtv633cpdreWsiILEgN6+GL85c=;
 b=NJBJYr9d27IO2+m+FbPsQHcsBJtSNnMtb7ayyu/6DQ3iA/ewX4DDV76TOqLZKfuxbbhc4yG80RyUj9/MlUBjXeFZ3fmHfb2nkhhrZDC63B0Aom/ER7lAd13BpZn7zhLfsqgs4Zo2RgF+wi3y4+iS6NISBkcdOKToO2bk6O9H1H+wAvq+eo4JzM/yfY7CSIN94u65WONWl5zOi/KJiSb4hTWJnDDgTRgauANgO1+Nil5Vew6Bi19SrRNF3uZMLb0Fh4rm7J3DsNwaPgNT9AyMRfFWr80v3ZpPXyBxT8AtRQioQLrBK3V/8C9fHO1AeFIQoQP9TXreBt9Vp2crsVRGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjUXamIu4057vaSsOHtv633cpdreWsiILEgN6+GL85c=;
 b=gwW1SWSS0Gdfx/S9Ppyg9A14XdUK2Sfluc8tnOjt8kjqUGCtZL13YpXSBq/ZmC5gHuZqdZXPSr/uhJFknSb6tfz/6unEzzk0C4J4b4PEkgu8pxwHTzrmW2arat1525UJDUZzYyYPV9Nguzaz/tVrbk3X56M6+VVG/dxEUtAimUQ=
Received: from SN4PR0801CA0011.namprd08.prod.outlook.com
 (2603:10b6:803:29::21) by BY5PR02MB6081.namprd02.prod.outlook.com
 (2603:10b6:a03:1f7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Wed, 30 Sep
 2020 22:40:17 +0000
Received: from SN1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::60) by SN4PR0801CA0011.outlook.office365.com
 (2603:10b6:803:29::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Wed, 30 Sep 2020 22:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT029.mail.protection.outlook.com (10.152.72.110) with Microsoft SMTP
 Server id 15.20.3412.21 via Frontend Transport; Wed, 30 Sep 2020 22:40:17
 +0000
Received: from [149.199.38.66] (port=52188 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <stefano.stabellini@xilinx.com>)
        id 1kNklK-0007HN-Be; Wed, 30 Sep 2020 15:39:50 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <stefano.stabellini@xilinx.com>)
        id 1kNklk-000326-QA; Wed, 30 Sep 2020 15:40:16 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08UMe9aZ013833;
        Wed, 30 Sep 2020 15:40:10 -0700
Received: from [10.23.123.31] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <stefanos@xilinx.com>)
        id 1kNkld-0002uQ-Dg; Wed, 30 Sep 2020 15:40:09 -0700
Date:   Wed, 30 Sep 2020 15:40:08 -0700 (PDT)
From:   Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To:     Rob Herring <robh@kernel.org>
cc:     Ben Levinsky <ben.levinsky@xilinx.com>, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com,
        devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jason Wu <j.wu@xilinx.com>, Wendy Liang <jliang@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v16 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
In-Reply-To: <20200929183601.GA892636@bogus>
Message-ID: <alpine.DEB.2.21.2009301536490.10908@sstabellini-ThinkPad-T480s>
References: <20200922223930.4710-1-ben.levinsky@xilinx.com> <20200922223930.4710-5-ben.levinsky@xilinx.com> <20200929183601.GA892636@bogus>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c715a1a-9582-435d-4266-08d86591cdd0
X-MS-TrafficTypeDiagnostic: BY5PR02MB6081:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6081511BB96A737B2EF6F6A5A0330@BY5PR02MB6081.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kx5P0Fiw3LkMUriY4S7DMV2/kqcwUFPFg7LF/i4Khci7i0rm3FIU5Z5ll2P6xET9UFX1tPkf7ZyqkjiCMjM7sTLDC0MBsckO+FWSuJ+Q0r1FJkA9J6uDwTN+G9t2FV6xqhMxyjRzRak7vNbfntqHhwUlNDx9I0I+eicKchIBPbBplFW9g0AGixgnr5TYBGAmu4Qso4ge73/GSmJpzWV2ZMJi6Z5tF4+OGM7MFOtW/9YGUEHfPPHG84lXR7JKFWLpEAk0xOxoHGmcR/cNtGORyNdyZBNHgvpMjPDcVdXVJvdpfnGBMcT3vESyvpM6CdBH+SzKmQO6DM0ft2XpCZqKY3DCeSVOq9E6ZwJgBmlcOgtaNAfBzeq0SSObO3Cro1r6IQTkXNWTb4Wy+7/Yn2ohtNe+vJiKAECi2o2HgThXGk31QSwcnZCiaCHPqqpHG3JGIolQqkw+LHVq03YfVJ6HPdvkIPCpGiuc38YEZfAS9Aem7+eKLImGacoYEU/JsEolvHO66lCpBHQbck5h+xEfkw==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(7916004)(39860400002)(346002)(376002)(136003)(396003)(46966005)(44832011)(186003)(478600001)(5660300002)(33716001)(426003)(107886003)(6916009)(336012)(4326008)(54906003)(70586007)(70206006)(8936002)(2906002)(8676002)(356005)(9686003)(316002)(9786002)(26005)(82310400003)(82740400003)(81166007)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 22:40:17.0476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c715a1a-9582-435d-4266-08d86591cdd0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6081
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 29 Sep 2020, Rob Herring wrote:
> > index 000000000000..ce02e425692e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> > @@ -0,0 +1,120 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Xilinx R5 remote processor controller bindings
> > +
> > +description:
> > +  This document defines the binding for the remoteproc component that loads and
> > +  boots firmwares on the Xilinx Zynqmp and Versal family chipset.
> > +
> > +  Note that the Linux has global addressing view of the R5-related memory (TCM)
> > +  so the absolute address ranges are provided in TCM reg's.
> 
> blank line needed.
> 
> TCMs specifically I'm concerned about how they are represented in system 
> DT and here...

So far I have been keeping the TCMs in system DT as regular nodes under
/amba. E.g.:

		tcm: tcm@ffe00000 {
			compatible = "mmio-sram";
			reg = <0x0 0xffe00000 0x0 0x10000>;
		};

(I am not sure if "mmio-sram" is the right compatible.)
