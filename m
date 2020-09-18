Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF36C43466
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 16:30:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E143B21D42
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 16:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="LoG+/Y8+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgIRQaQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 12:30:16 -0400
Received: from mx0b-00010702.pphosted.com ([148.163.158.57]:7016 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726417AbgIRQ3y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 12:29:54 -0400
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
        by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 08IFwf16021076;
        Fri, 18 Sep 2020 11:04:31 -0500
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by mx0b-00010702.pphosted.com with ESMTP id 33k5nt9d5e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Sep 2020 11:04:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xfm10EVD8qVfE1sLaCRxNhwAbYt3zfWB0JKVfMWp3d9XSmwJ5DFJ26i5oFXhjJvK2jHUToD2YjyN7lxrUAD6x8nX1FE2qV8mFw7YJZ64jd2wbNV9uOCjiDY87ZA7XkcNG0gozQupfu3vUl8YxUkLV3yUTaY2gvpuIXPaOhvnXoUXRjOLBlj4D0nFDa4AmyG5K0mtdxcX4PNp6qxETEz1oiejz8p+/F1+N4dnPFovt01bDro3rlliSRgXxTJayQ0Rqx4aHuWA1BYa3+kukMgBvFYjisnnXCTJ22I7LOp4cPf/FOhSQ15Go93+vOSitwAqUDTqgi+kEymEVzSkkbUAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY/aseWf7sHTckCwLC6BTObI1STh49SGkeJR4tkJgQg=;
 b=E7MTsHHK5yjuwyKf9aiEDr8oeOVHVRE9SWZ0vc9tVojf0VZf5yBshLe0AWZF8l+LR7mLYlB5ibrIQGFq8Ql6FJ86yBDMnykZbGmE7F0tN9txaVvVIx+yt1fxjHJKJQ+i2wy8vxGUalp40XUmjTLVXG20yOWrP44GTA3VnkUCQNEnEALPS4yhdnRzbb0dv5OQB9RowTGLSqcrGtNDISWTYDfGagDSECOKnlpuJ3lTzWCPRJki0anNIrrlEkBd+r3umXZiT7iXxtbKMs+z60YFAQcwqUaz4IUP82iDFXusLAtdzn+00JEwkHjYlcoVUXABjY5csa6E5I9jjdmqZfU7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY/aseWf7sHTckCwLC6BTObI1STh49SGkeJR4tkJgQg=;
 b=LoG+/Y8+fttFb4sHs7rW7LyAbx60cCF0CEn8Ve4QJj5nkOPFntt02SJeL3IA4WOrpvg4gaV5N4I+LELWOkf4+KCujGsGeLuPCLyBRb6OgNWr3Wfd5TsuowvDB9ycIZfNp7ijdcv2YZTeCQK9lPLOVeJr9c0d+phf+LrtTJneFj0=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from DM5PR0401MB3639.namprd04.prod.outlook.com (2603:10b6:4:77::34)
 by DM5PR04MB0668.namprd04.prod.outlook.com (2603:10b6:3:f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Fri, 18 Sep
 2020 16:04:26 +0000
Received: from DM5PR0401MB3639.namprd04.prod.outlook.com
 ([fe80::d98c:c98a:dd45:36c3]) by DM5PR0401MB3639.namprd04.prod.outlook.com
 ([fe80::d98c:c98a:dd45:36c3%6]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 16:04:26 +0000
Date:   Fri, 18 Sep 2020 11:04:19 -0500
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "Ed T. Mooring" <emooring@xilinx.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiaying Liang <jliang@xilinx.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, Jason Wu <j.wu@xilinx.com>
Message-ID: <20200918160419.GC15530@xaphan>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com>
 <20200917221120.GA15530@xaphan>
 <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
X-ClientProxiedBy: DM5PR06CA0076.namprd06.prod.outlook.com (2603:10b6:3:4::14)
 To DM5PR0401MB3639.namprd04.prod.outlook.com (2603:10b6:4:77::34)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2605:a601:ab6f:2000:2739:a39e:9b12:ab20) by DM5PR06CA0076.namprd06.prod.outlook.com (2603:10b6:3:4::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Fri, 18 Sep 2020 16:04:25 +0000
X-Originating-IP: [2605:a601:ab6f:2000:2739:a39e:9b12:ab20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2fdcf6e-c704-4094-2caa-08d85bec8400
X-MS-TrafficTypeDiagnostic: DM5PR04MB0668:
X-Microsoft-Antispam-PRVS: <DM5PR04MB066801F3B8DCF9DA97DFE39B873F0@DM5PR04MB0668.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPV6Ug/KG8P582zKCG9exTOfDh3DpgbFVXMG+Kv/SPCbyYiDoNq7Ma+Pj+jNTb0j0BS4xLG5OAIkz+sBhmUVH9MSsJ/UARVEBr5g3/sX0lEpUktsSYw33fz5ccS7GoSMPNVo4V5F5k40pDnO/T4iV4SwyBfs8ux9z0/ZMNAWyQAGGNPGfofq4b0R6zDXTBYKAPwtVhmhtfTWRbapadLD33hnArw7mnQpr9ilYGtdQ5zqQXrphs7A5KFZICVso99FXkndlrTNfOCBJHiyRlqmCe+2PTuzU0bJxfYSMDyQDnyEotE/c42boUjcsYH4qir6kNJDlOxPi6hwbJ1Ep6VwgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0401MB3639.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(39860400002)(346002)(136003)(396003)(376002)(366004)(66476007)(66556008)(1076003)(33656002)(86362001)(4326008)(6916009)(66946007)(5660300002)(6486002)(9686003)(2906002)(6666004)(83380400001)(6496006)(478600001)(52116002)(8676002)(7416002)(33716001)(44832011)(16526019)(54906003)(316002)(53546011)(8936002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: iy6Lg57n99AvdS8bpEJfijPL4m/WEnfXWydJj2MWSI1bZqK9Sy/xBiDjMvjzS+fQLdW8jISbBsoj0OBOy2MHAujFMyMI3f+FqKXd9onkazG7vU1aZdimIrhDWjFIDmCMoNKTwEzEjasPpVs5hxAtIyr2YLOd0GLeTMDqUIlolfLxJwWPpkNpfGzyglspF0byWcwqzz9ZdeWCH/9uPFyM3gpgoag8y+6InBJ+XJH/VeVTmIDRbo5CWRKECXuoj/Fg4m4WxIRhNRskgFrHgLRWZu0R2h/BlXZk+Wr5CmvcI6zLY/dfUw6JpkMe5JSmPMRyoUZBGg6/KxbI+9tnafCEOi59X0y0cBZkGuyIOEGDHxQaEPjHYgiGYzsPesL73bjLSeQhNG1asdpemS1lsnMKabml6CbpE7JBLuaVbBVoZNHLQkJTlnFwLyeDzqk/8bsnoWcaeZpEFjerIqL7ULX+PJl+G2ToWGnzMxwzog00BXaCEVrhm5Ot1x0IIu2vrMOXpiQe+bvmHdYO2iAHXYH7h+t+GhcXe6rOcvnguz9NmTC3ZozQF0Ro5D40zGeKdZjc2+GYQP5PitMf8oggoLiRruqkz+rellMbokUEh/3VU/VmzMIZbHV+4vMH5v0Ss8zP4+FnwSamV8gZyYL6rOQ5dq+mPiB/YfUkXCGJMc4UNgo11Aiywh/9NpFHVnQf9SagBFU+W00CSp5Q0lnZSzRMiA==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fdcf6e-c704-4094-2caa-08d85bec8400
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0401MB3639.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 16:04:26.0816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ym6vM+waDjIdq1c5hxLXH2oTnng322TDfrUK7ZddxrPeCY/rGlZu6ywzJ4Fn3zloqHKrXr5olpvu+4eKBXX+ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0668
Subject: Re: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-18_14:2020-09-16,2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=1 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009180129
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 17, 2020 at 10:18:39PM +0000, Ben Levinsky wrote:
> Hi Michael,
> 
> Thanks for the comments,
> 
> > -----Original Message-----
> > From: Michael Auchter <michael.auchter@ni.com>
> > Sent: Thursday, September 17, 2020 3:11 PM
> > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > Cc: punit1.agrawal@toshiba.co.jp; Stefano Stabellini <stefanos@xilinx.com>;
> > Michal Simek <michals@xilinx.com>; devicetree@vger.kernel.org;
> > mathieu.poirier@linaro.org; Ed T. Mooring <emooring@xilinx.com>; linux-
> > remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Jiaying Liang
> > <jliang@xilinx.com>; robh+dt@kernel.org; linux-arm-
> > kernel@lists.infradead.org; Jiaying Liang <jliang@xilinx.com>; Michal Simek
> > <michals@xilinx.com>; Ed T. Mooring <emooring@xilinx.com>; Jason Wu
> > <j.wu@xilinx.com>
> > Subject: Re: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> > driver
> > 
> > Hey Ben,
> > 
> > Split mode is still not functional in this patch series (as was the case
> > with the last few revisions).
> > 
> > Before sending out the next revision, can you _please_ ensure you're
> > testing all supported configurations?
> > 
> [Ben Levinsky]  I will make sure to update in next revision.
> As per review, I tested on QEMU and hardware firmware loading in split
> mode on R5 0 split, R5 1 split and R5 lockstep and  was  able to
> successfully load, start and establish IPC links
> 
> That being said, I will update the to reflect the values between the
> enum for rpu operation mode and the documentation in the binding.
> 
> For testing, I can provide a pointer to a publicly available device
> tree I am using if that helps. If not, can you expand on the testing
> of supported configurations?

I'm testing exclusively split mode configuration. I load and run
firmware on R5 0, and then do the same on R5 1.

Given the logic error, I admit that I'm confused how this could have
worked in your tests, unless the device tree you used to test split mode
contained "lockstep-mode = <1>", and the lockstep device tree contained
"lockstep-mode = <0>".

But if that was the case, then that means the device trees used for
testing changed this property's value between v13 and v14, for seemingly
no reason.

> > On Thu, Sep 17, 2020 at 12:43:41PM -0700, Ben Levinsky wrote:
> > > +/**
> > > + * RPU core configuration
> > > + */
> > > +static enum rpu_oper_mode rpu_mode;
> > > +
> > 
> > <.. snip ..>
> > 
> > > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > > +{
> > > +	int ret, i = 0;
> > > +	u32 lockstep_mode;
> > > +	struct device *dev = &pdev->dev;
> > > +	struct device_node *nc;
> > > +
> > > +	ret = of_property_read_u32(dev->of_node,
> > > +				   "lockstep-mode",
> > > +				   &lockstep_mode);
> > > +	if (ret < 0) {
> > > +		return ret;
> > > +	} else if (lockstep_mode != PM_RPU_MODE_LOCKSTEP &&
> > > +	    lockstep_mode != PM_RPU_MODE_SPLIT) {
> > > +		dev_err(dev,
> > > +			"Invalid lockstep-mode %x in %pOF\n",
> > > +			lockstep_mode, dev->of_node);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	rpu_mode = lockstep_mode;
> > > +
> > > +	dev_dbg(dev, "RPU configuration: %s\n",
> > > +		lockstep_mode ? "lockstep" : "split");
> > 
> > The binding documents lockstep-mode as:
> > 
> > > +  lockstep-mode:
> > > +    description:
> > > +      R5 core configuration (split is 0 or lock-step and 1)
> > > +    maxItems: 1
> > 
> will update this as you note so that lockstep and split mode are accurately reflected. 
> 
> > (Which needs to be reworded, but it looks like the intent was "split is
> > 0 and lock-step is 1")
> > 
> > However, rpu_oper_mode is defined as:
> > 
> > > +enum rpu_oper_mode {
> > > +       PM_RPU_MODE_LOCKSTEP = 0,
> > > +       PM_RPU_MODE_SPLIT = 1,
> > > +};
> > 
> > so the assignment "rpu_mode = lockstep_mode" is incorrect.
> > 
> once the binding is updated, why would this still be incorrect?
> Assuming the documentation is updated, the above line would be ok,
> right?

It might not be incorrect, depending on how you change the binding.

If you update the binding documentation to say "lockstep-mode: 0 is
lockstep, 1 is split", then this line would be fine. However, that would
seem strange to me, as this reads like a boolean: setting this to 0
would logically indicate that the device is not configured in lockstep
mode.

I don't think this is what you were proposing, but I'm not sure.

v13 did this correctly, and lockstep-mode == 0 implied split mode:

	of_property_read_u32(dev->of_node, "lockstep-mode", &lockstep_mode);

	if (!lockstep_mode) {
		rpu_mode = PM_RPU_MODE_SPLIT;
	} else if (lockstep_mode == 1) {
		rpu_mode = PM_RPU_MODE_LOCKSTEP;
	} 

Changing this is what broke v14.

> 
> Thank you for the review
> Ben
> 
> > - Michael
