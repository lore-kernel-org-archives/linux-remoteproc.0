Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53048C4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Dec 2021 08:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbhLPI0t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Dec 2021 03:26:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48104 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232333AbhLPI0o (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Dec 2021 03:26:44 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BG7hjbG007038;
        Thu, 16 Dec 2021 08:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=JHPntuJ5ewgMUJlE1NncxDrGkiWltKB2J+++Vsjwb+k=;
 b=LY7NrLGFSsdmmz977+YacX1ygV+p/iCDRA5zdcd7al4CLOHUu6W97YNJQWw6uUwjC1so
 +UvO/E3TxdRnP3NtgYkqND8+Gdsvnra4uk2OmpFJtWAx72ddafrzO3KrzmyMonOt1C8j
 1GAiS3T/TT/84xti2wcT7DFOYK6cQwkDM1LRcezFJS9cdXSinCtvpCcbXUx6pqBJu4Sg
 CHHb7fA8zFqDGFqZ/UrXVo/pIaEjYutfiActqoegF4lcuy71hq7KHZZaxeghZI64RJDs
 F1yhlQL5NSP8zVkhbkeTFJofyYNbskvaojFqsPHfW/Oa4ip7pXc9T9IDWOXUjhsgXT7R HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cyknrj157-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Dec 2021 08:26:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BG8Afew117673;
        Thu, 16 Dec 2021 08:26:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by userp3030.oracle.com with ESMTP id 3cvh41kpwq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Dec 2021 08:26:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8x+/+B/ASj71ItoclCiJLTWyVo9DyBX6dO8+iC/rFmYHbY3wCe0drlM16+NYrnMn9+zzrnKrjVLJaF0ocrzq4Sv3MIQPpy4m5tACo9BuJ0filHqsX5ciAbYnn3nfR1YM6aYupAmd6YvTRWdeXn7Eq1stidxRuRRTLhRd3VNz1rKAMyVskh9b4rQIQ4NWMVWyzWQlCffI8wLiWwllICNOo2O1U+Ivlj4OSLP2Khd4z6DPQ8qUXaJ+hw05z+miLdQXuqMfsxF+ZO/PtwDMkwJXPDcftlmw3FRN2WJo9PJ0CJpr4FKeAvvhr0/9amFEU6UhwlLbKplr3tJmuuLBr1Abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHPntuJ5ewgMUJlE1NncxDrGkiWltKB2J+++Vsjwb+k=;
 b=AG6ZdoPkq4URNpVts0WV4r/fRqV0JL2CSGTL7u14AB9BHRlVx3IFWRh/tLIsIMtTUWTclnt3UxBWl5NTrTMsFzQ0w/4O4jS7XG6g1xPgEk4rcEyU8NzJgbSItXGPmpzE2+t5PQM4R0W5bvmYfNCgwzbqWZ3ChjSLPFIEQob3Krz7KF7II/8C/HxDAm7cmDe+JBNkdOQUEGWUhT1dXAOYhHfIbjbd7OK9Yt/4SjCCmGd7p2Xigq3rrHjFH0wwArZvFi1BpjGIDlh0FZCDa4H02qCCh2g4XKvVt0NdjAVbTk502ez4efj3ysMAyEn7w6mqmNJOxOZZjeL9a5lrsP+SYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHPntuJ5ewgMUJlE1NncxDrGkiWltKB2J+++Vsjwb+k=;
 b=sK1WTIIBybTRX5BwvOJoVghibwp1mHs+9Y2G39v5e1wrYW0YvRHwsIo4fCUD7RRM0/KXPxX2S5YBDsedXHCtYNbBp1XHKGY1x9STrN9At/0yFSvrUssmuvmokj96e1oXNDbfXxWd2gIzENvcbzqPW4pM78YnGXx9R3SnUhXaHeQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4402.namprd10.prod.outlook.com
 (2603:10b6:303:99::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 08:26:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 08:26:31 +0000
Date:   Thu, 16 Dec 2021 11:26:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     julien.massot@iot.bzh
Cc:     linux-remoteproc@vger.kernel.org
Subject: [bug report] remoteproc: Add Renesas rcar driver
Message-ID: <20211216082619.GA6079@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e23326a4-2c7a-43cf-df0e-08d9c06dc3a2
X-MS-TrafficTypeDiagnostic: CO1PR10MB4402:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB440252BDD0D5B9C26E5CE77E8E779@CO1PR10MB4402.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNV2ryTCp+tvgBXpYwTGj+xzFt2qrQ+NeEUHb87CfY409P8VATZYcKICVIc/v1UGmrUpAWAHrpyD3VMVWEwrOl41tWnxk35h2AXobVhCRjTONeepQ7wvJGJuqv+aBFyVLXIV716H1Nv5eequMJGnpr9pmwD37Cu5WUsRB7chgybKOij8pJ8W26666cNlaXBFZNRXI3WtnKpPQg/A6Evi6K6l9tfsVX1XotRPbJxNmoFtg6/stpTSBoZHSBKnurNdVvhQX0ztwRdHKcLQ+kb/gdnMH6ewpuPUztdRPMq2BsFQJGZurJ5FT/cmNEqBEVRSX0B3hv2Mjzc9TuoOWJT+/Zzk4X3Y4LoPfChA4Zo+CY/vyUd7rEBi7rTswr7HqmUqbyEAMAKpyqB4TWyjHdw45jFfwlG4kmuvzBg+E15QekXTqO2rMZRQ2Knz3LPTmM57bQYd7hpnN62qwZvzpRw9yIkPzbkvq0C5j/LFDJrwqmTvAJyx2/N+1fB1J5x0/Sj5ePfJ/jp7eEUeleB1hO4wpcDNcmR/UYDeUaS6bmOAnNSic/SAqLGggUDMbbFv3o4L5roMdH1PWgY3xFk8m47zdtLAgu/OiscCb64I49aJlLA8etfy3Zf9H7nKdt2PJ9TK2fiYChf1sJ7q23gmLQt3lLLAarS9dOGFCyZfkk1H/v27Y7lYcgfFnSw86XI3KKnEIpoxUFuBqIIiq9k7zLjeFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(5660300002)(6916009)(6506007)(1076003)(66946007)(316002)(33656002)(508600001)(6666004)(33716001)(38350700002)(38100700002)(26005)(9686003)(8676002)(83380400001)(52116002)(2906002)(8936002)(6512007)(66476007)(44832011)(86362001)(6486002)(66556008)(186003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IxAhzQatObZRhs5nAjORKy41Al1UTPVLU1Gxfni8STn8Ot0TqZ0cUs3hYdI1?=
 =?us-ascii?Q?KnUKtzhzkdR5dO+iWiFpAYh5vkhZfzZ+Keved+M5TB8fqmYIHJb/i8t+drAw?=
 =?us-ascii?Q?UMs/D4Rr9PyS6lMcMntFh56zhApEgOIAPYDrizgA9LmeeWv+mFLOf6kdF09l?=
 =?us-ascii?Q?wqnb9ulXswLI/TywmmFJ2AaqpI+y57THUe9hRwIoR/qIk4SUXN4pk3JLdqiq?=
 =?us-ascii?Q?joI/Lt3JcWk/JToiuuQCefY92txXuTv/VRf7w9/OpKvtmULxnOYsy5rX5Pgt?=
 =?us-ascii?Q?nJTcw+rUhIV68D8G+HH13KfSxb19y0W+qC0weXvcOW08AKoG1iZjdRWlIqgi?=
 =?us-ascii?Q?KmBjTczd/TAf39lBmUdWWz3NKqHxx6lyu2gAsAglnwVbcQZILOwe1133apGH?=
 =?us-ascii?Q?DxGx25KDtfmSdduavGEovnUwd1FZBB4/GV8smQ2gd9aMhjTXXKpKqrjr6Er4?=
 =?us-ascii?Q?g/lPMoTL5+0/8vk2tycBYtZmyEtOtJAJOpzaHVHHFB6HMp+ypDmAFfQW40U6?=
 =?us-ascii?Q?IgUte5FoPXlWYV8q3pdybG11dXPTSpCr9qDRLd+udmjy1mhA2VB8YQ63S24z?=
 =?us-ascii?Q?GxXpsbv0XKX4K1rtSkF9vHi8AX8p/x2NCRC2nUglYGWuSmR263Wnoh2Qc6bl?=
 =?us-ascii?Q?f4mhXTRN6wxoW9AZnTU+j3CrsAJbOLNxyDhuWnV22kXn6/Gvsm8nxWSaflS5?=
 =?us-ascii?Q?gY38vemlTwqOO0VZmGKMB/YUVYc2y6M9N2vjD3BpkqWiS2sZfd2D1v6Bv9ut?=
 =?us-ascii?Q?aolGMwmLoSnMUlocLSQgMjnj8n+qL8lBRC+SlpEhdGkS8gKOanVyKDiSKKAe?=
 =?us-ascii?Q?MBwATiX1T5X3FqC5Mm46GzZN9LbgEnjTNqtA2HLivVEnJDFBGihgbmixkG1p?=
 =?us-ascii?Q?E/sGM4prniyN+HK8cYowNvz95emFlq5wue1rr9F3JczxzpVQgA7u38FWd1A3?=
 =?us-ascii?Q?3/cGZiqBvtx14wrHV66/w426tuG4LETa3IJd3yTMUUUewJvSE2ExiFsnqkak?=
 =?us-ascii?Q?UkL+2/JdkYjifTWHkycoNnJuD3vGmkhoNW/GFE+pqyHqHJU/E04ei6sDxEhz?=
 =?us-ascii?Q?kE2+dIFN1Mfq8v6Px2GLtUP/6gTILMBXWZl/37qvibNRaAY0r5wmhzUIq9Sl?=
 =?us-ascii?Q?Qn1P/XrR8U7PkIgThbKYKoZV0grvbbgCFhi02qKuogFvr+8ieJWY3WMbXGQb?=
 =?us-ascii?Q?kQ6ABLnVmnM2Dr9Xz9usbwKhbGnxGomTlDYpzNnYYTr9KxtVyFJ0tr8U/BWY?=
 =?us-ascii?Q?MC1zyRPt8nxTViOBYyhrP8dl4+SDRP+JYfrBi+9jqT2cXbUrZdHsggvLw3CJ?=
 =?us-ascii?Q?WyllL42xzvx62nJOTsJRa6Sz9RWuJZkELKxsXagD4Ihw5Te719AyyXJZpWsF?=
 =?us-ascii?Q?DScnmE6U9KiM8t7IaxpNrD3SuFu0J1+SgB2NUiWRptADXnBD93eE300qFKgP?=
 =?us-ascii?Q?W+l6bnQ4WN+PGEM40Anp4BTSP4NKA4uTNg0P8swhf4LtI4AaZQkQkUoX1PL7?=
 =?us-ascii?Q?ltWsq3+tLHXk6dDrIrjjO//DLBr5FigcZCNi6fPpo90NaWaGgPFc8XBG62XX?=
 =?us-ascii?Q?9g507jx3koiNEpuObMd81kvGAd3Zau+m0LHQWgJ1UbrUAny6uGSL4rSV6r/b?=
 =?us-ascii?Q?SuSjEJE6/krdV0nOCaQIFy3ET+OL55inf/AR2ZP2Pb9wzgkIr2v7ECtM4kUo?=
 =?us-ascii?Q?BU0HM6o+NA0hLoF9dxTL7xhCjEg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23326a4-2c7a-43cf-df0e-08d9c06dc3a2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 08:26:31.6934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcgSrB/qxuegGjFugcjkC/CoWUcSLMOfkCg7xmIAvm3GCPZO2Y/16MKdroMv1i6fsBNAh+x8Dx+v4rZAd4aUKd49gWhXStP0iHmwsrz+UUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4402
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10199 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=780 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112160046
X-Proofpoint-ORIG-GUID: ic8fJsYZpgSlnDoVcUpMBgN97di9hc_i
X-Proofpoint-GUID: ic8fJsYZpgSlnDoVcUpMBgN97di9hc_i
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Julien Massot,

The patch 285892a74f13: "remoteproc: Add Renesas rcar driver" from
Dec 7, 2021, leads to the following Smatch static checker warning:

	drivers/remoteproc/rcar_rproc.c:171 rcar_rproc_probe()
	warn: pm_runtime_get_sync() also returns 1 on success

drivers/remoteproc/rcar_rproc.c
    147 static int rcar_rproc_probe(struct platform_device *pdev)
    148 {
    149         struct device *dev = &pdev->dev;
    150         struct device_node *np = dev->of_node;
    151         struct rcar_rproc *priv;
    152         struct rproc *rproc;
    153         int ret;
    154 
    155         rproc = devm_rproc_alloc(dev, np->name, &rcar_rproc_ops,
    156                                 NULL, sizeof(*priv));
    157         if (!rproc)
    158                 return -ENOMEM;
    159 
    160         priv = rproc->priv;
    161 
    162         priv->rst = devm_reset_control_get_exclusive(dev, NULL);
    163         if (IS_ERR(priv->rst)) {
    164                 ret = PTR_ERR(priv->rst);
    165                 dev_err_probe(dev, ret, "fail to acquire rproc reset\n");
    166                 return ret;;
    167         }
    168 
    169         pm_runtime_enable(dev);
    170         ret = pm_runtime_get_sync(dev);
--> 171         if (ret) {

The pm_runtime_get_sync() returns both 0 and 1 on success.  The comments
to that function suggest that this should be changed to instead use:

	ret = pm_runtime_resume_and_get();
	if (ret) {

I've got no idea what that function does but it has standard error codes
and cleanup, so I *love* it.

    172                 dev_err(dev, "failed to power up\n");
    173                 return ret;
    174         }
    175 
    176         dev_set_drvdata(dev, rproc);
    177 
    178         /* Manually start the rproc */
    179         rproc->auto_boot = false;
    180 
    181         ret = devm_rproc_add(dev, rproc);
    182         if (ret) {
    183                 dev_err(dev, "rproc_add failed\n");
    184                 goto pm_disable;
    185         }
    186 
    187         return 0;
    188 
    189 pm_disable:
    190         pm_runtime_disable(dev);
    191 
    192         return ret;
    193 }

regards,
dan carpenter
