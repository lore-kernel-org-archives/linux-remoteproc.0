Return-Path: <SRS0=oRpn=DN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74B4C4363D
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Oct 2020 22:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 508CD20B80
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Oct 2020 22:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="lw3s12bt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgJFWxl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Oct 2020 18:53:41 -0400
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:31544 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726771AbgJFWxk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Oct 2020 18:53:40 -0400
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
        by mx0a-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 096LJP5t007767;
        Tue, 6 Oct 2020 16:31:51 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
        by mx0a-00010702.pphosted.com with ESMTP id 33xnb0yr0h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Oct 2020 16:31:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iK17aP8cUs3Nx4duMFR99PvOGRkxiBqdq/aLqAGq7w8b1WC6/roDAXg2cDgjD+2GlIOIA1++ZWZp1/JEQfIMo2ytM+5F+J6TfunG3dl4LPv18tAdEJ2Is/grDfS5Fdf8LpXiTOopckDz4s2DpNYDuxFGd9pebhxQeiyuEQg1umrbSmQ8L/BbDOMaOwbnJydduB+4fD7MOaD3xRwi7IwrptrICER7G+urvqvKlMl4TO5CPHBNr94mecVk3URi/hLmmP0+zXCVOUldIT1PQ9OSJcVbb5EoH6Q5eCygtRGqYZcc9MrC1lRyA69oZyqBQpS1DehEk4DbHtZw3u4U/iEwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vgRO+C+EbzwLwKtvklhwp9pcOLtQhYuqDw0r0GECPg=;
 b=Wueh0y/QrnYHLqi/B19rmE7StI4szsZGsYqUkomUi2F9WtBI3gPgbo85wWM9rlSAzZo58tEduq+W8bWxwHnAqECzykg/r3shHvrcJsW2yZVVyCKf/itGclKQg4YXhXhJNVCsiHx+32wGdWBjDgCKy1874IGtD2rC61CQdOPIZ5II4CIWCUR27MrkS8mXQjYG0C0MnV3cOjP129JboGruGLq+nSxzJbzZR3xbbbhVYwNVR8x7KQ8rMSsGd7KhO/6ZZK9MCCon8Tk7n6qlbMm5VLCW+jYOEG2DePLDR2VsfW04PPDqzESqPStj7ZtOuZ+3h8wj2urZymgdRkhsU0RMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vgRO+C+EbzwLwKtvklhwp9pcOLtQhYuqDw0r0GECPg=;
 b=lw3s12bt7uydILOzyk48Ze5bJ3W+JuVTvxKbVBgtEGiQ/G5Z/zRHpQPSAT9nqoOh3FWAaMz04jr9cj/Ms+Lyk+J90N1cuB5HDuafSXEsu8XViRgkZgORRMX29gzo3Sy36Ovv0zCVkvW58tYxUZhxdEnkGOHTr3BtPTr/6SOTJCc=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29) by SA0PR04MB7403.namprd04.prod.outlook.com
 (2603:10b6:806:e3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Tue, 6 Oct
 2020 21:31:48 +0000
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::f4f0:f1bc:f09a:da84]) by SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::f4f0:f1bc:f09a:da84%7]) with mapi id 15.20.3433.043; Tue, 6 Oct 2020
 21:31:48 +0000
Date:   Tue, 6 Oct 2020 16:31:43 -0500
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     "Ed T. Mooring" <emooring@xilinx.com>,
        "sunnyliangjy@gmail.com" <sunnyliangjy@gmail.com>,
        "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <20201006213143.GD701433@xaphan>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com>
 <20201005160614.3749-6-ben.levinsky@xilinx.com>
 <20201005193449.GA701433@xaphan>
 <BYAPR02MB4407B7F06962DB30ED90761FB50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR02MB4407B7F06962DB30ED90761FB50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
X-Originating-IP: [130.164.62.229]
X-ClientProxiedBy: SA9PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:806:a7::9) To SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (130.164.62.229) by SA9PR10CA0004.namprd10.prod.outlook.com (2603:10b6:806:a7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37 via Frontend Transport; Tue, 6 Oct 2020 21:31:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c64963c-4e58-4701-e1c2-08d86a3f3ae5
X-MS-TrafficTypeDiagnostic: SA0PR04MB7403:
X-Microsoft-Antispam-PRVS: <SA0PR04MB74035DFBAC9D00587AC1FDF8870D0@SA0PR04MB7403.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8hCkRcVLKQ8vYehhKgVjaiKr1jXZjWXfu1OjANap6QeNVtc3Lr+hI4C3T29CmQWGrzBtrJM9xf8F2r2egG+Ywsn8bInCWEl7Y08EjbhZ+Cpzl7Mp+eNWMsHhJubNTtGhEdMseFKoNDuAsDW7WWHfhXhBsFYqUY8yTzY/X2L3BPZPBEH177CQIrwYv76wAnKN/5oZ14Ubo68sBtXgPMb8LQ9E2DoEBxJ/lOUDBA5aDTJoSsPoTW8gUouRF9CouRTkRl1fP4TZFot+GAk6Rh5fGHLFZP3m3zTcTXxRsvyJ+/FTYrrZIato1VmmnQuh5diGrGh5We4aOnxWxUJM51T4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3646.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(396003)(346002)(376002)(39860400002)(366004)(136003)(83380400001)(4326008)(7416002)(33716001)(86362001)(33656002)(8676002)(8936002)(6916009)(6486002)(9686003)(956004)(478600001)(54906003)(2906002)(26005)(44832011)(6496006)(5660300002)(186003)(1076003)(66556008)(66946007)(66476007)(316002)(6666004)(52116002)(16526019);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: ziU6Q/33Q2d53yJy4jXyYMos5meFUn6j7Vu12iH7IuTI8NAmqvkVHeAAyQp7+orNP8bS9mCsPHUVkr/9MemZQjEgJKRFENH8bzm8+ejOHTjQOau3iVt0apqGonnqku/YPpOMikMpN41SJ2emEJiihMcKPQApNlHH4k16roSfarFoC0/o09yBM6AmCcarONoWOhQJtBSkc6+jE1KqC8qr4F/k4/QwNB0T2RU9F8xnYesTztEmt2JzbN16Em5dpZR729Dxvy/0kPeOx2VKnhoy1vpfW4lTyRQck47K6EZhhxdEPFvJeDXUv5t8887p+Eb5SgjwcDVdOSxBtV9Qe5OUTP6HRE3haJf9e4XG7wPTMIVXCjJzHDovU2MP5uU0T6GisStHEnJbWiz7oWnpBY5PjqLLtgyyawD2Hs2Ci2a559Qta/T95e2OJC9nCbIVCwzoKbyw6wceRrnBf4dtfSMAquYyVIquism0pz9j2QHYqZ9xL9wX6IHbu6k9y8heD8xk2fmG7EPfojtXt3MbsaZZZBzfQGnVCZheSGQun2sBY8KAVT1uEo0BYPQh7tZ6HTTaQh/AD/WplmM5RgMj/QG/pXYPrXszvJSxdB4BYlrKnc3XFyLpu3SMXVlpGsulaKztH/LlIeE/8j0edIhoJEaazw==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c64963c-4e58-4701-e1c2-08d86a3f3ae5
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3646.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 21:31:48.1220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9Bb8OFc5Ebt1lPZ8WFol7/l9apdB6/Hk/YyF0XECFi9jlRK7NcxqpTXRe+Nc1e4QdX02EKDyGbIAtKZ41KsaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7403
Subject: Re: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-06_14:2020-10-06,2020-10-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 suspectscore=1
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010060141
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Oct 06, 2020 at 07:15:49PM +0000, Ben Levinsky wrote:
> 
> Hi Michael,
> 
> Thanks for the review
> 

< ... snip ... >

> > > +	z_rproc = rproc->priv;
> > > +	z_rproc->dev.release = zynqmp_r5_release;
> > 
> > This is the only field of z_rproc->dev that's actually initialized, and
> > this device is not registered with the core at all, so zynqmp_r5_release
> > will never be called.
> > 
> > Since it doesn't look like there's a need to create this additional
> > device, I'd suggest:
> > 	- Dropping the struct device from struct zynqmp_r5_rproc
> > 	- Performing the necessary cleanup in the driver remove
> > 	  callback instead of trying to tie it to device release
> 
> For the most part I agree. I believe the device is still needed for
> the mailbox client setup.
> 
> As the call to mbox_request_channel_byname() requires its own device
> that has the corresponding child node with the corresponding
> mbox-related properties.
> 
> With that in mind, is it still ok to keep the device node?

Ah, I see. Thanks for the clarification!

Instead of manually dealing with the device node creation for the
individual processors, perhaps it makes more sense to use
devm_of_platform_populate() to create them. This is also consistent with
the way the TI K3 R5F remoteproc driver does things.

Cheers,
 Michael
