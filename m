Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FC3C43463
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 16:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03676208B8
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 16:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="OMzh0QSF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgIRQZo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 12:25:44 -0400
Received: from mx0b-00010702.pphosted.com ([148.163.158.57]:54744 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726115AbgIRQZo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 12:25:44 -0400
X-Greylist: delayed 1265 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 12:25:43 EDT
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
        by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 08IG4dCW002298;
        Fri, 18 Sep 2020 11:07:30 -0500
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
        by mx0b-00010702.pphosted.com with ESMTP id 33k5nasgh0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Sep 2020 11:07:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMXdgn/LAY7fTnDkf1bz2Q7mzWW2ruuSWcz25NoqIaseqrjPMtK34v6rBcvzsGwz0DDcEepiFE1kos4pViRW8NJ8ppmOWN40DU4Eqh41tdYHtg1BoU2K2Stbx4/HYR/jaqwKcP7Dzqgb4i2FhP6dQOQktD87dvqB9tLTDwiHGC0eWdticFsooU2fZjLBUzl3Jt+Gg7BFsI10ObsR6ag9GZbcuWhZugY01lQXxsMqqiz4l02+xkTz5gMdoMKrVUHLoxbqTcsTlBmw4MBplFz3zYidkXUYlzuHcFHKY0xTMRbw7Tec0y4XDnFU2zPa5T/mBKbFwh7g0KqomzfqCTVEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2H3t61ZbGkKEw0Ho5AxZ1vsD/qKCltAUtrSbl7W50o=;
 b=F3rXFMfS4ptiA6wUPpvH7PqJg46H4074BP21HKoKYhdfxhYr5Um9gjvU6eOqiNhbolwMtT3nqZngh/r2icRFetLLhI4UFuA8gjpv8EGuPIzr6uSDS/lX+6W/CCvloft/2AMEj3YstGXbcUleLSH9S1Z4PyTt7YKbLr7K6z3X1FfzGE7YzvrOI4AVe1NxeqfblkLw2D7EqdVYPJeOTnRhcybScVs7b+RSIa7tpLyAT8JWb7a7/1GuSRI0ceOlqEGVJp0BvPbyT8+QGsiCOfCszfUI9vAMxxkdt6cB6dfZdAIVRKZdsaHZWRtoOqxmP79QPFE53XO19sXKazqvUKGecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2H3t61ZbGkKEw0Ho5AxZ1vsD/qKCltAUtrSbl7W50o=;
 b=OMzh0QSFvGXCDxtO6IATF+dkJ/LRzJXxkRyOtfL/3hn2Umeu98s+I5HMKfgJ6iAReTU7zFrXiKOVda+Ji5kfZymECqnmfijzyZMqUmCKfBIfs4VlSwDAKp13qvCKwNpBepoj1n9/YZSpD8BZ7HX0tvpE3m8BxmcCvM8qO35O9NA=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from DM5PR0401MB3639.namprd04.prod.outlook.com (2603:10b6:4:77::34)
 by DM6PR04MB5243.namprd04.prod.outlook.com (2603:10b6:5:10f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 18 Sep
 2020 16:07:28 +0000
Received: from DM5PR0401MB3639.namprd04.prod.outlook.com
 ([fe80::d98c:c98a:dd45:36c3]) by DM5PR0401MB3639.namprd04.prod.outlook.com
 ([fe80::d98c:c98a:dd45:36c3%6]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 16:07:28 +0000
Date:   Fri, 18 Sep 2020 11:07:21 -0500
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <20200918160721.GD15530@xaphan>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com>
 <20200917221120.GA15530@xaphan>
 <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <BYAPR02MB4407A552ECBA907DFC3CEC91B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR02MB4407A552ECBA907DFC3CEC91B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
X-ClientProxiedBy: SN4PR0801CA0021.namprd08.prod.outlook.com
 (2603:10b6:803:29::31) To DM5PR0401MB3639.namprd04.prod.outlook.com
 (2603:10b6:4:77::34)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2605:a601:ab6f:2000:2739:a39e:9b12:ab20) by SN4PR0801CA0021.namprd08.prod.outlook.com (2603:10b6:803:29::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend Transport; Fri, 18 Sep 2020 16:07:27 +0000
X-Originating-IP: [2605:a601:ab6f:2000:2739:a39e:9b12:ab20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a3b29aa-3d52-4262-5241-08d85becf083
X-MS-TrafficTypeDiagnostic: DM6PR04MB5243:
X-Microsoft-Antispam-PRVS: <DM6PR04MB5243B35E2A0539A17E4B03CF873F0@DM6PR04MB5243.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvZFBGFEMrMBnnh86zJ5TWL4qVajLKV84g/vLB2xKZz9LjA5c6OmLe0muHcnG2GCCc4+vT1asXH59dyTwKAjCpRV+46P85tkrEgO38ZV+jSTTV/x0LSNurDkjVLn0+bfJtMG7pWtyil8uZrJGsZ4rf5g+Ag3Za1GfbRx2SdFbgPFn8JCILRBwa+JpBjeU8GQYJPxPFguq3TNMvkS+RzAh4YQdtAPCqOtr8femNO15wm1/EjRl9/6d/G0pvUkveL2bgJTDnBP+6aok9q3ZY+PrZIeVc9dQZO2E1vp6nI7x4ICJC6NTpThZYiQQVzGNfcHztP2jyyTFPMVBdpzUDXvfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0401MB3639.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(346002)(396003)(39860400002)(366004)(136003)(376002)(5660300002)(6666004)(316002)(86362001)(66476007)(33656002)(66946007)(1076003)(66556008)(8676002)(44832011)(2906002)(8936002)(33716001)(54906003)(16526019)(186003)(9686003)(4744005)(6916009)(6496006)(4326008)(6486002)(52116002)(478600001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 2/Ulg79XaIj9SR0buic+v9Cv+mcer3/fKXbG4Jy12THKHE0evKhwVHDP9ngXZr+e8dciSFDwGSdixv50p+QzJgnP5I8+EKjBH5/f9KnBPe4ZWEN7kTNSO08eVSG4frhh3Q9EkclEq7C+CnhNdoRfvxJSBheX8J0VzaIz6mGj7ZlO174kOSs6xcmOpusinJAxBQsLNYxPaHEh839NRNi4xAQWUivh+WeGmym0GxYlpZbTe5DbMupRZnlGw0IIrs5nEQ9v9lLRo2SBnbxyO23mD3LyM2XiZwd3bO40S8cdyYcnlanEa51I043cOwn2M+SofRWeCoAvX2yJEWS0ITV4VaNXDIfoauyEe6n3iadQt1s0wpXMU3wEzQzvyLq+3BNVtHGpBqbrbd4OfUrmFRfY2F22SEkCOw5sODpOxeUNBwGsaVufKxU77/rmI5iZnGcnlfIT4FhXjFBK+yZtCRHHH1JSUb59u7q+eolymBfJq1C/mj3elSVl4E3q32dsmMY+Z1LpXrdZzaNi6Ddha7d7C0P5rUiUxczmjrz1vgZ/wIPKRqv+3HakaRbcM/sveohHAUaDwqynQI2CbOyj/S1bsbu5Y0g4K6RFSTLWF5Ymro6jBg5cvvByBMpzXvNovEZ6ZqUhMzzDdHmL0Md8W5R2dgKyN0H3m7NSmOi0WRA2R4KnjRb/cZ4Mic/zdOdDI1RNq0m0SSFxpS6YM+6AOsPVQw==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3b29aa-3d52-4262-5241-08d85becf083
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0401MB3639.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 16:07:28.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP8IWcQrt4HA9OlOykEaahzEtX8oKYicxEuVsznqX3hTFlxTcLxMWDdIjtWjJMKuZIFR0m1tTIr0HvrbZeoEtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5243
Subject: Re: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-18_15:2020-09-16,2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=1 clxscore=1015
 mlxlogscore=999 phishscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009180130
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 17, 2020 at 10:50:42PM +0000, Ben Levinsky wrote:
> In addition to device tree, is there particular linker script you use
> for your R5 application? For example with OCM? As presently this
> driver only has DDR and TCM as supported regions to load into 

The firmware is being loaded to TCM.

I'm able to use this driver to load and run my firmware on both R5
cores, but only after I change the incorrect:

	rpu_mode = lockstep_mode

assignment to:

	rpu_mode = lockstep_mode ? PM_RPU_MODE_LOCKSTEP
				 : PM_RPU_MODE_SPLIT;

