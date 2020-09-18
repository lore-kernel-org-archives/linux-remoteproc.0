Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A261C43464
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 19:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1D5021D7F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 19:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="rtizSLpu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIRTHA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 15:07:00 -0400
Received: from mx0b-00010702.pphosted.com ([148.163.158.57]:51738 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726249AbgIRTHA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 15:07:00 -0400
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
        by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 08IJ4e5l004230;
        Fri, 18 Sep 2020 14:06:53 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        by mx0b-00010702.pphosted.com with ESMTP id 33k5naswa9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Sep 2020 14:06:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LW7Wqcyo4YPm0YjN0Cm5DrCDBCUj/1NmODJYlCDNrxh2lOkvtVMk/pKC+Tf/yIsteSahO1lmzYNWUMn5KochNAAB/JejYpEWvC4qhW5wdLDLa7WTFrmb+Q91cPgycQCrgQU6ZtEkYPCiJnYl9Yba8sd+v7ykjWFYLworpBdVVs7/5h1OxdjAxD0wmgpg/wkEMcohlIq+FYS8TNXk+NAmuqmXnJFryImV1D8zYwq9b24btmMorOb7ocRDSkKauG3mVwfXZQho8oaHA1/HbdgoHybbIdZbthmCnPsXd6bSlId0f72Kcxjq3jXvQ7Kfu+sCCDCGeJfZszug4MaSy/5qaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cap/twZGzB4lYexjVykuPdmgZ5LW2r10815WfktlMNo=;
 b=e9KBLF4I1wiS4c7KKPXjn2ed4/4xHvLWdP/D2Ut0ds4G8rhAR98fvf07EAU/kFCiCcfnqeySGcwnVFEk3KDNp6C38nJGJd8t8tB9qszmoGy55HKmzv+T2mKeZT6kqcCL8Alq5lTCPXQMCFZf/t/fZXIc4nlvDBt/y046nldp80fy1WQ1d8WueuSb5Al4vyOBXHcB7rNr8jScIoLy1BzWgv5A7VMhYR1E6guGIuxsVoqGycY++pFqOHBI5Vz2nr6r/stI2or0OEBS5kt+jg6g0ekH+cqnHzHV5Pcj4QWytljHBakMHQemeXFatdPNETJetTJElHxWpmPZ4o3Kfbsn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cap/twZGzB4lYexjVykuPdmgZ5LW2r10815WfktlMNo=;
 b=rtizSLpugUCYpZE7rLlZFEwld/tSSU7TxxbeI+GvsbXH+HwhJ7HuRFN5xOT1kKvc7uh4IlcRI+cmSIFHW4tDs1nlOcMufdkJsMbBj17wpZxzh92iQkhD/T8sILWzoSxakP/jpc6a2AHoOqhnRk9RpYdg2sHMpo4VOMO8EaCQbco=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from DM5PR0401MB3639.namprd04.prod.outlook.com (2603:10b6:4:77::34)
 by DM5PR04MB3755.namprd04.prod.outlook.com (2603:10b6:3:fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 19:06:50 +0000
Received: from DM5PR0401MB3639.namprd04.prod.outlook.com
 ([fe80::d98c:c98a:dd45:36c3]) by DM5PR0401MB3639.namprd04.prod.outlook.com
 ([fe80::d98c:c98a:dd45:36c3%6]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 19:06:50 +0000
Date:   Fri, 18 Sep 2020 14:06:43 -0500
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <20200918190643.GA172254@xaphan>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com>
 <20200917221120.GA15530@xaphan>
 <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <BYAPR02MB4407A552ECBA907DFC3CEC91B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20200918160721.GD15530@xaphan>
 <BYAPR02MB44073FBEF86F4AA2379D8A11B53F0@BYAPR02MB4407.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR02MB44073FBEF86F4AA2379D8A11B53F0@BYAPR02MB4407.namprd02.prod.outlook.com>
X-ClientProxiedBy: SA0PR11CA0029.namprd11.prod.outlook.com
 (2603:10b6:806:d3::34) To DM5PR0401MB3639.namprd04.prod.outlook.com
 (2603:10b6:4:77::34)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2605:a601:ab6f:2000:2739:a39e:9b12:ab20) by SA0PR11CA0029.namprd11.prod.outlook.com (2603:10b6:806:d3::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Fri, 18 Sep 2020 19:06:49 +0000
X-Originating-IP: [2605:a601:ab6f:2000:2739:a39e:9b12:ab20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10b3d04d-7b0e-47ef-cac6-08d85c05ff30
X-MS-TrafficTypeDiagnostic: DM5PR04MB3755:
X-Microsoft-Antispam-PRVS: <DM5PR04MB3755C65F7EDB3FF9048897BC873F0@DM5PR04MB3755.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGjKA0Lsn40wdhS2g3Rxycahp2SFqbhH3msuHN5TQ4Q21PQG0vR73hTFUnydC7frEBVJv60HM8MPILBbUOWRhlinS0taOA4rBwlvtTxbRV/HbwZP0tbq2Rduz0wPU8cEH7BZGlrL0o/bb37muSncCw7Vc3mzNkRznPX4Ta4c23ZWk9Ayh4BeveBAhpBFHPR9um88RiLVDiQxVlegNCjZNpkjfgW3AGI4O48kOwqa20rCz/qgOEq0M+QBcY9Fng69sD3yWahOcrRo1q0/cz6HT943ulUdw/bXKiTCsg9h9NrnHVtYTpT+d5A7zasndWoW5l5q3hkeh1fPaqFVTONcbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0401MB3639.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(136003)(39860400002)(376002)(396003)(346002)(366004)(66946007)(83380400001)(6496006)(1076003)(86362001)(8676002)(2906002)(5660300002)(53546011)(9686003)(316002)(6486002)(33656002)(6666004)(66476007)(66556008)(33716001)(6916009)(16526019)(186003)(52116002)(4326008)(54906003)(478600001)(44832011)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 7BlWQGholhgewBq5F8OYd9mmupsZ3y6KjATkWHU5kOwjZWe1GuBvSB/taOpUy8Ij2vNCEqyzu2/VGg7cLuDEpIb5fv1sVDFLKsyk/9Di+Jx5EDsOFh+cqsDIUcSCjsX+X83qwYjYS04E84o99aZtwNkFuZPRoXewZRB648kPkVWBi9X0dw12W2bPCPXaFSqyqPZHYnTFhWcO62YS2qKMUO7siln5p8o/y2FtxNHdUe4s0gsYzymylXHsJb1QnzU9HrWDnIozUjCs+FnWQnA+mTN3mGfNi7ok4ckdDaFYuyg+ixhQePwrm2SME7hk4P1+NB4zWuxYr3NzJkofrmNhjZ3xC8SdxN2X+uoHLg40PvSpRYarfXvacAec5bJVgggkWzSJNZvo1OWaR/IfGM83R3jATaqQ9jqRrHgixek+xblc8RTsWoyFw+FgQ/XwtjNZwi+RM30Oh/VsQl0xQFgfQxKqQZRaxIlKlVLm2EndriwgVliPfId6n9TFQFsw7xtdzsQzZmVFlGcEToydQXjU5xKQ7mfdbsqljq+1oNzGyNWoyVC35TQ4XfflfmeksG7giulZGjJhfji/OHFRm4YJ8Facx19U/0xVgeKT5W4i7wlhF99WnyGx7sAjGA8oIvfhkA5PUpyPyfOPxcKGXEbrE5HzmJ1PC8n+Kp0aCqc2r96UPtWXrTAWr3wwyJJaONZ3n8unw+C2xOdDLTP7sLqraA==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b3d04d-7b0e-47ef-cac6-08d85c05ff30
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0401MB3639.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 19:06:50.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCewrNugclaDrEDKW+NtlwX+PyTC1dC+TJHvNuN6Fzk27mrS3g9sdCVdQmRcMYgsAmt5WiBQXgm/UtBtmLWkNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB3755
Subject: Re: RE: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-18_16:2020-09-16,2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=1 clxscore=1015
 mlxlogscore=999 phishscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009180154
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Ben,

On Fri, Sep 18, 2020 at 06:01:19PM +0000, Ben Levinsky wrote:
> Hi Michael, Punit,
> 
> > -----Original Message-----
> > From: Michael Auchter <michael.auchter@ni.com>
> > Sent: Friday, September 18, 2020 9:07 AM
> > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: Re: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5
> > remoteproc driver
> > 
> > On Thu, Sep 17, 2020 at 10:50:42PM +0000, Ben Levinsky wrote:
> > > In addition to device tree, is there particular linker script you use
> > > for your R5 application? For example with OCM? As presently this
> > > driver only has DDR and TCM as supported regions to load into
> > 
> > The firmware is being loaded to TCM.
> > 
> > I'm able to use this driver to load and run my firmware on both R5
> > cores, but only after I change the incorrect:
> > 
> > 	rpu_mode = lockstep_mode
> > 
> > assignment to:
> > 
> > 	rpu_mode = lockstep_mode ? PM_RPU_MODE_LOCKSTEP
> > 				 : PM_RPU_MODE_SPLIT;
> There was a point raised by Punit that as "it is possible to set R5 to
> operatore in split or lock-step mode dynamically" which is true and
> can be done via sysfs and the Xilinx firmware kernel code.

I'm not familiar with this, and don't see an obvious way to do this
(from looking at drivers/firmware/xilinx/). Can you point me to this
code?

> A suggestion that might clean up the driver so that the whole
> rpu_mode, tcm_mode configuration can be simplified and pulled out of
> the driver:
> - as Punit suggested, remove the lockstep-mode property
> - the zynqmp_remoteproc_r5 driver ONLY loads firmware and does start/stop.
> - the zynqmp_remoteproc_r5 driver does not configure and memory regions or the RPU. Let the Xilinx firmware sysfs interface handle this.

I don't think this is a good approach.
- How will someone know to configure the RPU mode and TCM mode via sysfs?
- What happens when someone changes the RPU mode after remoteproc has
  already booted some firmware on it?
- What if the kernel is the one booting the R5, not the user?

Split vs. lockstep, IMO, needs to be specified as part of the device
tree, and this driver needs to handle configuring the RPU mode and TCM
modes appropriately.

Split vs. lockstep already necessitates different entries in the device
tree:
- In the binding, each core references its TCMs via the
  meta-memory-regions phandles, and the referenced nodes necessarily
  encode this size. In split mode, each core has access to 64K of
  TCMA/TCMB, while in lockstep R5 0 has access to 128K of TCMA/TCMB. So,
  the "xlnx,tcm" nodes' reg entries need to differ between lockstep and
  split.
- In lockstep mode, it does not make sense to have both r5@0 and r5@1
  child nodes: only r5@0 makes sense. Though, I just realized that I
  think this driver will currently permit that, and register two
  remoteprocs even in lockstep mode... What happens if someone tries to
  load firmware on to r5_1 when they're in lockstep mode? This should
  probably be prevented.

Thanks,
 Michael
