Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B1EC43464
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 22:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33BD0208DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 22:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="jIPdrDef"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgIQW3g (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:29:36 -0400
Received: from mx0b-00010702.pphosted.com ([148.163.158.57]:42250 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725874AbgIQW3g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 18:29:36 -0400
X-Greylist: delayed 1078 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 18:29:34 EDT
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
        by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 08HLwH2s002990;
        Thu, 17 Sep 2020 17:11:28 -0500
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
        by mx0b-00010702.pphosted.com with ESMTP id 33k5naqc8g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Sep 2020 17:11:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVkZ+etVGJcsXEDyKOP1FV7mFvJ4rcPhPtf+I59YgtAeJIwRaK9RcFY5Mv3l1vBrQ47ffxHwcx8FPy6OOBglIj+UgHPCPgC7GupE6ZqAV0tWVBV0Czr1/GPYbcpVgfE6x8elDwQIyL4Dvn0W6yZpOciPAa5+9kHKdmFj8kKYfpgH5VEpfbDaGNIPWs3LvonXFYaL43yqHrWmepEjdAx5F2Pzr5uI8J0dM2gsYnPfWPu58h/ogut7tPyGUkYPP1/O6+4jOtRlvXOoMRHVnzIb/ysEqZtWWXE4K3LshmqTQSm+WV68DD+7IyUVBCfuMAuSts/yXX5jP6JUm4EbTQqUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkgL0OPpgf0bOICdvwPSIafYRl9th3SLhV52O4p75SU=;
 b=cyvjfsD7wJFyeMMnhvcyIK+9IsbA3YItmq9eoLuktQSXOQVGP55oeg/POOGBeK7kiMJXKeveSswuyNtAiKlrHsA5s4aRzxRmoOsReDLNYzL3JF1iXw1C+RBfyOCqEq1PKL+kbdrdK/jMeEtn1l3VDRrZ8GP60KzFmLMhDXLndQROBt7dU6jYiZuem6Wsszf79Hw48XH4VlqXIl9pJ8gNz7Qxy50yxGqBGFpWAj56qjMXY3iLaGV2KWfImdp3BDkEkbprF6ENln+jTUf05QyYSvsskJkhWP63zUqQxrCvhMLleCMFqczpddUlMoKIj49IS55iuUzI9GDVLMT9nj8nWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkgL0OPpgf0bOICdvwPSIafYRl9th3SLhV52O4p75SU=;
 b=jIPdrDefhVSPbkYZaIQjL/s4HEU6lWa6dITwlUiiGpvxGAxbeF7f8YudbcQEs/5F5j2Qx8zalh2RIbLpF5Sb+eWfS3AY1VZcPzkDUj2/LHiXIuZmJ+Kd8MY5FVWuClF8LHlCEk9OK/7vG+8RffKQYeCDLqDxE3uo81+CIyqUusA=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29) by SN6PR04MB4751.namprd04.prod.outlook.com
 (2603:10b6:805:b0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 22:11:26 +0000
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::30f8:af2b:efff:2750]) by SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::30f8:af2b:efff:2750%3]) with mapi id 15.20.3370.019; Thu, 17 Sep 2020
 22:11:26 +0000
Date:   Thu, 17 Sep 2020 17:11:20 -0500
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, devicetree@vger.kernel.org,
        mathieu.poirier@linaro.org, emooring@xilinx.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        jliang@xilinx.com, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wendy Liang <wendy.liang@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Ed Mooring <ed.mooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
Message-ID: <20200917221120.GA15530@xaphan>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917194341.16272-6-ben.levinsky@xilinx.com>
X-ClientProxiedBy: SN4PR0601CA0021.namprd06.prod.outlook.com
 (2603:10b6:803:2f::31) To SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2605:a601:ab6f:2000:2739:a39e:9b12:ab20) by SN4PR0601CA0021.namprd06.prod.outlook.com (2603:10b6:803:2f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17 via Frontend Transport; Thu, 17 Sep 2020 22:11:25 +0000
X-Originating-IP: [2605:a601:ab6f:2000:2739:a39e:9b12:ab20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b83929c-f440-40c3-6762-08d85b569e85
X-MS-TrafficTypeDiagnostic: SN6PR04MB4751:
X-Microsoft-Antispam-PRVS: <SN6PR04MB4751ED3AECAF496D34875CEE873E0@SN6PR04MB4751.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5aqmJsOE3UJeJQJhMF1zZBMX7lxIS7ME2Pccj4X4gLUuo+En2BsFGsal39Fd9b37R3kwr6Ms7RP3Fy9kPTlPUrG+FpNH4GeEOziPF9nEGz+kO7HX4nz36pk6lOefHzACFQzAcEF6tFYJS9M7rlZM/UTdl7G032blJ2HWgMqiBhsKAAECS1i1LOsdt8q/l4wGn4qfKh1sJVo0DfZRvgkDiln031RK1zyIaFz4v6kW44gcjJehfczASYozA3m7CvPC24sFmv2n6UX0jUHo6+1qqknCrUBq6YkY4izx+HIn2s5v9IAmyX/4vJ1I8USGVUsmeKVBdeOIBXCFRLcd5EeU12KRsewE8yUVq1t1vDBJ7a5nQbGoUyM8hEGAVoZ5j8B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3646.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(376002)(39860400002)(346002)(136003)(396003)(6916009)(4326008)(8936002)(186003)(6666004)(8676002)(16526019)(316002)(6496006)(2906002)(33656002)(66476007)(33716001)(54906003)(66556008)(7416002)(52116002)(9686003)(86362001)(66946007)(1076003)(478600001)(6486002)(44832011)(83380400001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: tkzn6wdRpadA2GgzGiy7z/3p3vIN3nwyidrVuNM9bEGjx061hQQJYwenhNV3sIY09+1DANdTR+rl+1m9EaHLY6sDWjhjASHv4LpyOSB5Ld8G7AOFWEm/5o139uHA2YSXb7pjJ/TGrqnRreNQocxuaC6gZKOcfJ10graxZ26UtbaFbEZw5M+QnQNuvR0pGDlg5z37KKMpwTIafMgveqIfXB6l7ex102PrkhTuSQ5e1w2PPPqQToaBugjA7iB6roAnSZ0Z5ap93lGNay/3gWAuL0jlxPlEXrfhIY10NnlX9hTZkzO0EdobWrlE/Ys1m4THMfh1BG0YhzSphya7+jKfII8/Ge9s5DKXMddloJ/EqWMLXBGa0xkWiFmXwDR4EiKKuSiZa/7UzLVE+NJz36x/GbHkPomJ+MsnxRjJ+bm5ikE719ajKh2EAYavMJbw8+EsBRbmVaR3fnSDEevyD1XRpPg+aZWgcsw86JHHqZtLJxRCXn0f/4JGs/frW+CLWtLG8+AUpqBX5QFYh4WQ1nSq7VauxdEoLKPmaubA6iedkqHJPrT34CwPeN/e/4851gzqP7YlbxY0YXJXjj6Jb2sn8gpm+Hb2cVkl1XFHGjMn4tnv0pKyOQ/Vb/5QpYZ4ECJSVRsBHApgJeGsvUk4z0LhFFF8qxPPi5QHDtF6nMA88EaB39MzN0qx3eP3u5xsnRx2MXyxqhjzy0g8CnraO4KwcQ==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b83929c-f440-40c3-6762-08d85b569e85
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3646.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 22:11:26.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p73Bru4e7gljxqO5iZHJS9/jae0h32h1iEKX0s83Ni3mitkVec05qWvwNpQ9HxDVMuMIJMJH4uadRU167RbHDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4751
Subject: Re: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-17_20:2020-09-16,2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=1 clxscore=1015
 mlxlogscore=999 phishscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009170162
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Ben,

Split mode is still not functional in this patch series (as was the case
with the last few revisions).

Before sending out the next revision, can you _please_ ensure you're
testing all supported configurations?

On Thu, Sep 17, 2020 at 12:43:41PM -0700, Ben Levinsky wrote:
> +/**
> + * RPU core configuration
> + */
> +static enum rpu_oper_mode rpu_mode;
> +

<.. snip ..>

> +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> +{
> +	int ret, i = 0;
> +	u32 lockstep_mode;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *nc;
> +
> +	ret = of_property_read_u32(dev->of_node,
> +				   "lockstep-mode",
> +				   &lockstep_mode);
> +	if (ret < 0) {
> +		return ret;
> +	} else if (lockstep_mode != PM_RPU_MODE_LOCKSTEP &&
> +	    lockstep_mode != PM_RPU_MODE_SPLIT) {
> +		dev_err(dev,
> +			"Invalid lockstep-mode %x in %pOF\n",
> +			lockstep_mode, dev->of_node);
> +		return -EINVAL;
> +	}
> +
> +	rpu_mode = lockstep_mode;
> +
> +	dev_dbg(dev, "RPU configuration: %s\n",
> +		lockstep_mode ? "lockstep" : "split");

The binding documents lockstep-mode as:

> +  lockstep-mode:
> +    description:
> +      R5 core configuration (split is 0 or lock-step and 1)
> +    maxItems: 1

(Which needs to be reworded, but it looks like the intent was "split is
0 and lock-step is 1")

However, rpu_oper_mode is defined as:

> +enum rpu_oper_mode {
> +       PM_RPU_MODE_LOCKSTEP = 0,
> +       PM_RPU_MODE_SPLIT = 1,
> +};

so the assignment "rpu_mode = lockstep_mode" is incorrect.

- Michael
