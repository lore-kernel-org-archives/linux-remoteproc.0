Return-Path: <SRS0=DqHI=C6=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CD4C4727D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 22:37:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A25F923A63
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 22:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="kapxVWZX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgIUWhv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 18:37:51 -0400
Received: from mx0b-00010702.pphosted.com ([148.163.158.57]:13434 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727062AbgIUWhv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 18:37:51 -0400
X-Greylist: delayed 1526 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 18:37:48 EDT
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
        by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 08LM9DHH009090;
        Mon, 21 Sep 2020 17:12:14 -0500
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        by mx0b-00010702.pphosted.com with ESMTP id 33nft7mm7r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Sep 2020 17:12:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l66KtAeoqaXsBYL5lphrcnH+up9wbOUlRdKpV4NpBi5Kp8x8VLYw2K6xzfTypN+ew/cxr/sAiW4va7BWemN8WCte83aWH+sxZtDYxRRvhLqy5MYZCTaZx8qNUoD9EO24aMplwwrFiapjjcx7DZfIVMlYYibfoW9Yx5SG3mtai9j1oKpl/Rt1FGIitFOhAGX8RgxeYqAdkYDve7JZJfZ1FHO/qjgoKMwaJ78GI0Yq8KAUKFP0PN0giHzRUTBGedf/lPuJ8G6A9M/FBCYomJeWNRhac0NzXn+/vruyDAik8t6lb6NMo2AqkhkesOuG1Tf8z+ZcexQuyxF0NmgDWEVXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJvgZFfHR+9JUwuKETsUyYwdYcmkKVk3txOJymqPHUQ=;
 b=S3vXGj5yzQLIkF8ZYUi8v4F6YYCIeE+Pr4iVjoZBn+B84Bdl3+FDnwc8z2eYuwJAuRrBvWII/UG4xyRJc3tTp4QOaa1pLcN3dIcWqsuHljkPaQitLWfnUwOS8G+Jb1KJdWssIcWDrfi2tGDPPO3wQzV+RuFHDikGrCrLOoyR3oeRmBN5MapN9r98IQ8oxFeUxXetJkrmeEzFYqkrKCKyQAf6Ps1WONOGUX55MpO1l9/Q8KByudzbgXM+xtCDDfsJqtyLsAya1fXPYRBCxFPJW7VxAPUjBVzRtsk51Voybm74wR/WwyoOPsKMKxqxL5g3inDZWXFhKr+aJavYyTDN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJvgZFfHR+9JUwuKETsUyYwdYcmkKVk3txOJymqPHUQ=;
 b=kapxVWZXvca59vlAJFIFqBkDbBwWDytAwZe7bOlJK0mm0DOtpR9H1rIuur5VWm4es8K1cXdmelEvdlMEZ1ZBJj8nVhfwtfUu5HA5SvjZNAS02sMTgo+UrFtcT1M4NcC98BhNIzrCc3EVBRvFqQgoaeQJ4iv+mIJz4+TZETqSgHk=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29) by SA0PR04MB7194.namprd04.prod.outlook.com
 (2603:10b6:806:e2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 22:12:13 +0000
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::f4f0:f1bc:f09a:da84]) by SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::f4f0:f1bc:f09a:da84%7]) with mapi id 15.20.3391.023; Mon, 21 Sep 2020
 22:12:12 +0000
Date:   Mon, 21 Sep 2020 17:12:06 -0500
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com,
        devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wendy Liang <wendy.liang@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Ed Mooring <ed.mooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
Message-ID: <20200921221206.GA296714@xaphan>
References: <20200921161406.11929-1-ben.levinsky@xilinx.com>
 <20200921161406.11929-6-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921161406.11929-6-ben.levinsky@xilinx.com>
X-ClientProxiedBy: SN2PR01CA0072.prod.exchangelabs.com (2603:10b6:800::40) To
 SN4PR0401MB3646.namprd04.prod.outlook.com (2603:10b6:803:4b::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2605:a601:ab6f:2000:2739:a39e:9b12:ab20) by SN2PR01CA0072.prod.exchangelabs.com (2603:10b6:800::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Mon, 21 Sep 2020 22:12:12 +0000
X-Originating-IP: [2605:a601:ab6f:2000:2739:a39e:9b12:ab20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8807d3b-6155-44c9-79f1-08d85e7b63df
X-MS-TrafficTypeDiagnostic: SA0PR04MB7194:
X-Microsoft-Antispam-PRVS: <SA0PR04MB7194599F4076E0C36D67F6EB873A0@SA0PR04MB7194.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2GI8rSxnKv3BfdKiukFO7QtvLdsro/9jhw5drl4Q6A8A/Bh8NDZJZD+UenZod4JhBpdabBQQzfd+6LOMvzp/vzqtS/JqnXk9Ss1oiXmHSs++ys3/I66xTgNfEYlfMiY+oHn2sHV0n2OSBIh/c0T2/6df5XkJQcePl1MEDMD7dZ1pmRRACAHR3rSu8uBEkgfcm6akPQFah0R5F2qJYdj2WFXzb46FXSwo/hlMa2+7dvIkppRGRkM1SmvySViqr3RI4IU0WXISQX112+YTklL2z6gpspFJw4sbNtcQiMOqbtJlUL9LagXdkTMuROVfmC4+MblnqP3D4dc0TTXHwvcIyXYHTp4D7azSaED8SDHy1EIQug3V48fTvdMz7VAaoMFY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3646.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(136003)(366004)(376002)(346002)(39860400002)(396003)(6486002)(52116002)(86362001)(44832011)(8936002)(6916009)(6496006)(7416002)(33656002)(54906003)(2906002)(33716001)(316002)(83380400001)(8676002)(1076003)(6666004)(5660300002)(66946007)(4326008)(186003)(16526019)(9686003)(66476007)(66556008)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: eqYMLsw6Jywo/YIL29RcB5IxAiG55QQ8UCh+PJkalfdrs8o8Ymd2vVJg60JBmQPcnxWpWcA7S1VdYjrgWjzs5qunKIy12sO7H9yQV/2yDh8fjZsoQ5CS9Lyaz8PrHvF7ykz36eSZjoGLvTrSJ06ycUsWn+OKFgsj4VU4CVZedfgGnu9ZgAi9PgIFmp7d1xqjZJurIfkMuvbSETlvp1J/oNmsdFXs1Giyvi66bIsJ5G0PPohPDS9ViTuAeF9AcK9X4WA6zuuYqeH9k/f72pZD6BE45E6IwmnDhoPnbBjUNkshjy2Vx3a6MYME4/IWByG38qJIjpEJOXtuAIN7XPxbDi14OA96UnvUHzLrvQZ3JClpJ2T9O7W0QV52f/pBzkrEx2tHkql3BfNk+/h5a/ZJV1cFDC74AdeaYcGrRot6pKiQ3uvyy7TjJmdlWPXU3L/ru1oKlyqubfd5uMXegVFaIHNtYG4ZtKhZlALXdjw8Fhbdiu4fgFxupCtSmvuB4yuXsoHZrsS0i38vbElC2/IhF3tfXOCO+4MYzRBE8wnREdrJwJLkH6pzgLebhq7oc4wlK2kKrmga/bYs5mc1dbqsLHYVERQGjAe+4lIwU2l3mknDaaJKaYAZALFoSOlJZNW0q6gA6f3lNwgSM/IYceNHcGjbFPGrH4OboFE5HL5Iyo2tV3B7ICgqEM5l1PIUP0MvRztkxkcSUICUg6st76VLOA==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8807d3b-6155-44c9-79f1-08d85e7b63df
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3646.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 22:12:12.7101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1TopNPW5G2GSKZHRqB9y9aWdqnmkK7m5Eva2S2acLGx8h8pK0i8G41PEAW/NTCtOWvb/jdxzXhFFhVg4M3XYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7194
Subject: Re: [PATCH v15 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-21_09:2020-09-21,2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=5 mlxscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210158
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Ben,

Thanks for sending out the new series, this patchset is functional for
booting both R5 0 and R5 1 in split mode.

A few comments below, still working my way through the rest of the code
though now that this works.

On Mon, Sep 21, 2020 at 09:14:06AM -0700, Ben Levinsky wrote:
<...>
> +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> +{
> +	int ret, i = 0;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *nc;
> +
> +	rpu_mode =  of_get_property(dev->of_node, "lockstep-mode", NULL) ?
> +		    PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;

Extra whitespace, and of_property_read_bool would read a bit nicer here
(does the same thing in the end, though).

Since rpu_mode is only used here and in r5_set_mode, I think it'd be
better to plumb it through zynqmp_r5_probe instead of making it global
in this file.

> +
> +	dev_dbg(dev, "RPU configuration: %s\n",
> +		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
> +
> +	for_each_available_child_of_node(dev->of_node, nc) {
> +		/*
> +		 * if 2 RPUs provided but one is lockstep, then we have an
> +		 * invalid configuration.
> +		 */
> +		if (i > 0 && rpu_mode == PM_RPU_MODE_LOCKSTEP)
> +			return -EINVAL;
> +
> +		/* only call zynqmp_r5_probe if proper # of rpu's */
> +		ret = (i < MAX_RPROCS) ? zynqmp_r5_probe(&rpus[i], pdev, nc) :
> +					 -EINVAL;
> +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> +			ret ? "Failed" : "Able",
> +			nc);

It'd be cleaner to check the child node count before the loop:

	rpu_nodes = of_get_available_child_count(nc)
	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && rpu_nodes != 1) || rpu_nodes > 2)
		return -EINVAL;

> +
> +		if (ret)
> +			return ret;
> +
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < MAX_RPROCS; i++) {
> +		struct zynqmp_r5_pdata *pdata = &rpus[i];
> +		struct rproc *rproc;
> +
> +		/* only do clean up for pdata with active rpu */
> +		if (pdata->pnode_id == 0)
> +			continue;

This seems like a bit of a hack, resulting from the use of a static
array for holding the zynqmp_r5_pdata for each rpu.

Consider allocating zynqmp_r5_pdata in zynqmp_r5_probe, and adding each
instance to a linked-list at file scope. 
	- memory is only allocated RPUs actually in use
	- no need for this pnode_id == 0 hack
	- MAX_RPROCS can be eliminated, just traverse that list in
	  remove
	- No reuse of the pdata across probe/removes, so all of the e.g.
	  condtionals below ("if (rproc)") and NULL assignments can be
	  eliminated.

> +
> +		rproc = pdata->rproc;
> +		if (rproc) {
> +			rproc_del(rproc);
> +			rproc_free(rproc);
> +			pdata->rproc = NULL;
> +		}
> +		if (pdata->tx_chan) {
> +			mbox_free_channel(pdata->tx_chan);
> +			pdata->tx_chan = NULL;
> +		}
> +		if (pdata->rx_chan) {
> +			mbox_free_channel(pdata->rx_chan);
> +			pdata->rx_chan = NULL;
> +		}
> +		if (&(&pdata->dev)->dma_pools)
> +			device_unregister(&pdata->dev);

The condition here looks very wrong to me, as it will always be true.
What is this trying to achieve?

> +	}
> +
> +	return 0;
> +}
> +
> +/* Match table for OF platform binding */
> +static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
> +	{ .compatible = "xlnx,zynqmp-r5-remoteproc-1.0", },
> +	{ /* end of list */ },
> +};
> +MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
> +
> +static struct platform_driver zynqmp_r5_remoteproc_driver = {
> +	.probe = zynqmp_r5_remoteproc_probe,
> +	.remove = zynqmp_r5_remoteproc_remove,
> +	.driver = {
> +		.name = "zynqmp_r5_remoteproc",
> +		.of_match_table = zynqmp_r5_remoteproc_match,
> +	},
> +};
> +module_platform_driver(zynqmp_r5_remoteproc_driver);
> +
> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 

Thanks,
 Michael
