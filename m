Return-Path: <SRS0=oRpn=DN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4013DC4363D
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Oct 2020 22:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2382208C7
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Oct 2020 22:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="DlLd4Fyn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgJFWUq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Oct 2020 18:20:46 -0400
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:30676 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726709AbgJFWUq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Oct 2020 18:20:46 -0400
X-Greylist: delayed 2924 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Oct 2020 18:20:44 EDT
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
        by mx0a-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 096MEqsP010696;
        Tue, 6 Oct 2020 17:20:38 -0500
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
        by mx0a-00010702.pphosted.com with ESMTP id 33xpttqk66-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Oct 2020 17:20:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwusWcKjKfLu5QCjBLk+Wy22o/o1dtQsLGS7GN18NOiH/d7t8sEGevx8dpyDvJtgOd37LIQ9S1SHMo+6+Vj7uBo70chHfsUNZ1cDepavuoG94m19K+4VaMYcnT7Bv8xduBxkrbV+YYlVVUI/SewemRCnKnQ4lHtt/dMSsMNPQTH6Vpw1OdDSafj0++Yb36AUq2JRSHoZymmMz3xsQAKO+P2teHUpXnJ37nIaNktklmAAl9Jj9iTid2yHWbluzBDWDu+Y3fxts2N3i8cnwnxJdPKvXKv0tvFzhtUsW7p5xw25LHHJL3LJN+7PL9KPNU7t6iqW1jeRGVSlPtz8UOJ1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoNi5b4sQHhgh8RHvTIdoEK6DN4w5AUDvF5ZSXtMu0M=;
 b=d10HIAL2HlsYE+89AUaXHMwjQXvCNF7uX6X6QE3YCZOwhEEimeXQeSULafBnM239ylT9k8y4l5uE0aECiRV/JGc7ML0m2JWB+YJQMvFsD/dHt2bLOISaJ/0wTZlt4FxvI6kP6PVZRgN40VVJbeiB3edlpqOSy32FE7OtB9/n93r5TSWQkMzzQhBoqQ+fl3I3dUUTOqLks0V2e+FoHfEgVHM97ewhIVqNdfLnXKB0JFA/kfQ3sHv0dEGzIR5LQjJFQmiZRhzPsqk4KbleO0n6ItSV8aIv8zO+85jK/u+NbJV5EUwDVEoraGKT+ydvXFytyt4Af9/1S5/MImJlK1PYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoNi5b4sQHhgh8RHvTIdoEK6DN4w5AUDvF5ZSXtMu0M=;
 b=DlLd4Fyn+mUW+iWnbfHZfpsWUeLhXXUhYvtHVr1xC6DWqO+jiF2waN8zIsdaP6zfRtUiNIP8mBIh8CWNMJUrQtBlh/8rTFkLutjUR+2cDjrstmWp9OGnf4ej4Fo6Ggxn0Mi8ta/fohaR27mDTXswoE7zwen9ag9HNRaPDfUAbrY=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29) by SN6PR04MB3936.namprd04.prod.outlook.com
 (2603:10b6:805:48::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Tue, 6 Oct
 2020 22:20:36 +0000
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::f4f0:f1bc:f09a:da84]) by SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::f4f0:f1bc:f09a:da84%7]) with mapi id 15.20.3433.043; Tue, 6 Oct 2020
 22:20:36 +0000
Date:   Tue, 6 Oct 2020 17:20:31 -0500
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     "Ed T. Mooring" <emooring@xilinx.com>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <20201006222031.GA809209@xaphan>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com>
 <20201005160614.3749-6-ben.levinsky@xilinx.com>
 <20201005193449.GA701433@xaphan>
 <BYAPR02MB4407B7F06962DB30ED90761FB50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20201006213143.GD701433@xaphan>
 <BYAPR02MB4407B356B56B9A1D561950B7B50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR02MB4407B356B56B9A1D561950B7B50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
X-Originating-IP: [130.164.62.229]
X-ClientProxiedBy: SN4PR0501CA0006.namprd05.prod.outlook.com
 (2603:10b6:803:40::19) To SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (130.164.62.229) by SN4PR0501CA0006.namprd05.prod.outlook.com (2603:10b6:803:40::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13 via Frontend Transport; Tue, 6 Oct 2020 22:20:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f728a023-b6cd-4594-3049-08d86a460c3a
X-MS-TrafficTypeDiagnostic: SN6PR04MB3936:
X-Microsoft-Antispam-PRVS: <SN6PR04MB39360096F8CD9ED738EF9DCD870D0@SN6PR04MB3936.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Irv5EbhBOhCcvRgN1g9sEZOnXcmO1XJtZN8NhbIDzwQD6Er/9/I9/GcQcxXPbbQLYMw3dfytdjPDaOUegwOYBzIk2U9yu3oqesMpZ6DNyj4FDGOXvSnzEggUzIDJQTfV3Q8rQtOtDMmBvcQG2bbuTpvEAiWxY09JFTmpwHSOMss60PBgQZ3jDg2WwgygSUuBMHi+o7048+19bsi6qnd1Gsr3iDwQcE37e1mm1aRILGbE1uxcYJSC/0hj6BYVTOM/nI/wbJX81BHskTbPZCQ9Fq/pMJ4SsAWMcOlps5VqEeKQOfysDF+RliSJtvSZ9h7BChlUoN3W+JtfkgglHBFj2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3646.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(346002)(39850400004)(396003)(136003)(376002)(16526019)(186003)(8936002)(478600001)(26005)(5660300002)(956004)(33656002)(83380400001)(6666004)(8676002)(66476007)(66556008)(66946007)(6916009)(6486002)(2906002)(54906003)(316002)(9686003)(4326008)(52116002)(33716001)(6496006)(1076003)(44832011)(86362001)(53546011)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: H1mG8BA9hzklEciygUxmcF73NGKzYOFPSJ3MVuckKioez+4e+5uNm3bEiNU89ccLjJg+hvF0vB7qdJbhEATQDAZI5JG4KNCV+TXcBn+Fs8aeFIaFA59IWAP7flPBlzTiJzIYlT9yTdMt+kcrcl3iZbXHzRhqcZzX3AdJ2YujVHilKTGYr+CKn5ia1aQgm/Np0sqDCvHGAK3nxFaJdcz53yfnTi+hf8aQ2AnLtPV+YRQot50sweFtuTDKEW2tBxvwEYs/jPrKkgIkmJkaQXmvi1X2hGuvgAQDPl1HKoISM5KVQAfa2eySkJ8cGD8tV67SUNLy3PSQoRjyj+AcSYNbgmrKGtp+EkWH08aNdezI+irLT6STLb+dFc/fG/k+1r4AGFwyuVejKlQE8iN21BCf5Rcof7IqVvT1rA9fK009zLjVrDn1f9/xSG7XWC6kttL9/obUQD9nvEZbuV1BvtI1bvShVb6YtvckPja+giDn5JQ/WvXkMcGwjBW8yrqnsQHhEntH9dunahWERfUuWMJrvTDCoy9AWt7eFrKSRhpfgBzkZIyXkxJ45TQDwlrLrv2339ZFkCjwDxtBmgruFplgAINVTvetY21hSGW1mppS5hbgOHfWd/H8MngkxdaJake0TGQJ7JIysaFisw1jSuVcTw==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f728a023-b6cd-4594-3049-08d86a460c3a
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3646.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 22:20:36.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPrX/FjZfjT9qTCfZYfuG2y3y6EvYy1AFlVrQwnFf8RaWyeo9JaiXm0murd1cK8jHYhC63XEZbML11dN3ARUUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3936
Subject: Re: RE: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-06_15:2020-10-06,2020-10-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 malwarescore=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=1 phishscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010060145
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Oct 06, 2020 at 09:46:38PM +0000, Ben Levinsky wrote:
> 
> 
> > -----Original Message-----
> > From: Michael Auchter <michael.auchter@ni.com>
> > Sent: Tuesday, October 6, 2020 2:32 PM
> > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > Cc: Ed T. Mooring <emooring@xilinx.com>; sunnyliangjy@gmail.com;
> > punit1.agrawal@toshiba.co.jp; Stefano Stabellini <stefanos@xilinx.com>;
> > Michal Simek <michals@xilinx.com>; devicetree@vger.kernel.org;
> > mathieu.poirier@linaro.org; linux-remoteproc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; robh+dt@kernel.org; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5
> > remoteproc driver
> > 
> > On Tue, Oct 06, 2020 at 07:15:49PM +0000, Ben Levinsky wrote:
> > >
> > > Hi Michael,
> > >
> > > Thanks for the review
> > >
> > 
> > < ... snip ... >
> > 
> > > > > +	z_rproc = rproc->priv;
> > > > > +	z_rproc->dev.release = zynqmp_r5_release;
> > > >
> > > > This is the only field of z_rproc->dev that's actually initialized, and
> > > > this device is not registered with the core at all, so zynqmp_r5_release
> > > > will never be called.
> > > >
> > > > Since it doesn't look like there's a need to create this additional
> > > > device, I'd suggest:
> > > > 	- Dropping the struct device from struct zynqmp_r5_rproc
> > > > 	- Performing the necessary cleanup in the driver remove
> > > > 	  callback instead of trying to tie it to device release
> > >
> > > For the most part I agree. I believe the device is still needed for
> > > the mailbox client setup.
> > >
> > > As the call to mbox_request_channel_byname() requires its own device
> > > that has the corresponding child node with the corresponding
> > > mbox-related properties.
> > >
> > > With that in mind, is it still ok to keep the device node?
> > 
> > Ah, I see. Thanks for the clarification!
> > 
> > Instead of manually dealing with the device node creation for the
> > individual processors, perhaps it makes more sense to use
> > devm_of_platform_populate() to create them. This is also consistent with
> > the way the TI K3 R5F remoteproc driver does things.
> > 
> > Cheers,
> >  Michael
> 
> I've been working on this today for a way around it and found one that I think works with your initial suggestion,
> - in z_rproc, change dev from struct device to struct device*
> 	^ the above is shown the usage thereof below. It is there for the mailbox setup.
> - in driver probe:
> 	- add list_head to keep track of each core's z_rproc and for the driver remove clean up
> 	- in each core's probe (zynqmp_r5_probe) dothe following:
> 
> 
>        rproc_ptr = rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
>                                                   NULL, sizeof(struct zynqmp_r5_rproc));
>         if (!rproc_ptr)
>                 return -ENOMEM;
>         z_rproc = rproc_ptr->priv;
>         z_rproc->dt_node = node;
>         z_rproc->rproc = rproc_ptr;
>         z_rproc->dev = &rproc_ptr->dev;
>         z_rproc->dev->of_node = node; 
> where node is the specific R5 core's of_node/ Device tree node.
> 	
> the above preserves most of the mailbox setup code.

I see how this works, but it feels a bit weird to me to be overriding
the remoteproc dev's of_node ptr. Personally I find the
devm_of_platform_populate() approach a bit less confusing.

But, it's also not my call to make ;). Perhaps a remoteproc maintainer
can chime in here.

> 
> 
> With this, I have already successfully done the following in a v19 patch
> - move all the previous driver release code to remove
> - able to probe, start/stop r5, driver remove repeatedly
> 
> Also, this mimics the TI R5 driver code as each core's rproc has a list_head and they have a structure for the cluster which among other things maintains a linked list of the cores' specific rproc information.
> 
> Thanks
> Ben
