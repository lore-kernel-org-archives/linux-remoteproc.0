Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB5CC4167D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Apr 2022 09:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbiD1Ju0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Apr 2022 05:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348671AbiD1Jks (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Apr 2022 05:40:48 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9F4972B8;
        Thu, 28 Apr 2022 02:37:34 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S7Qr2D018590;
        Thu, 28 Apr 2022 09:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=R6sewbIOUQyeX+qc6wuM0G7oxWZSUFKW47CBeVo7Cr8=;
 b=nVbn87FtpZGqP3+SMYSAKv7qcjyntUUtxEJYmJEgFWNMQQHe0OWwpAuCt2EB9goAOa7H
 AxsNXnp0+VJavE7+0RbE5hZ/BWE3TFv2GGCCrgxWgeV2K7afenWY49baStBsK7f0WPqO
 pYQUJWk1Uy88lVYotCwqfxrP5yZ8STdrHhaFLA01F5Z3T2t7UtTY/9POTQNrjV6KwNKs
 6oqnXEC97xDRCpQyxtraywuNBiRtrYMubWXRRFOw3F2htNWaHKZjBiBtNQ9UTgATseZr
 f6gFeT186D/pfygLJO0S/274WnKDHbLV+HGuP81uX/sw2ljavPLPKX4gdHQBkAwi2vDN 7Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb5k3h39-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Apr 2022 09:37:30 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23S9abOq036461;
        Thu, 28 Apr 2022 09:37:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fp5ynd9f4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Apr 2022 09:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+otjjN8eOJcNbNToqupOmuvuK2F2OP7BRFaxtwKufVsfECxVDplt0cTltLniwB4v5ki7FW3CeWYo8TWohRlNjbudQmUaNkmtWnZjDbxVxmErqDtGwr2lRNXMBBuNEg8WKSDjCgzhpMi1S6FWfmJQ5Jxl7Fto299b7Y3lvx9YeVekvLxh2ymsSpUaKw79biyN4O9WqO/9eMVFukdOBkcgJiTyW+VcuUkLRk0013RlNMwaqIL8Szx9Inqk1l5kiOOROXD/WHtBRuU7qmFiBY5bdzWykGJcrz3dmRaqArIWKBgRuYyg7kj2eoke2Ff5uZKbFzjMRoDj8d480G1x+c78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6sewbIOUQyeX+qc6wuM0G7oxWZSUFKW47CBeVo7Cr8=;
 b=imVt+xBsf9sKJKU8vvJ0Pbq0eIxKqZXPwjc2OG94dyJyE2eKpKxeK4wp4dnyzFwOlcHWtYNZrgdIj8H8YRBd2XYaOWecJ1MAzKbya3Bp48MPwP1MgmtanUYW+OhzJ87T0hVGPkD3DBCL2t/2Eli7LHR5cIQC/fEXzymhTYj9bGAgS8hrF6gy4wB4NhRCarWKtQWQ5dn7qNVPjbDW6jmsXRVskrSKi0ZMihrp8caEQUYFUgEzmRXRsLB/VNSlr7lVe3+2ywSUejjdt6lGpliebQn0CJTG2zi8cdE+68BJ9OPW8eRbMbupOalARyV8rG5UWrieL3JZjOR2uMLztvsGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6sewbIOUQyeX+qc6wuM0G7oxWZSUFKW47CBeVo7Cr8=;
 b=Na/NRQu9AuPUvNhX3KwX2eVXyw5FKNsWG0MSxuEHvFXPx2WwmjnuL16xkC4wRS14rmumEBshBU26eViImkCE16PnGkIxIrkBSSw61ot8h6o1Fem+aYODJPnDgBQdxKVwjmQzr+2cueGYEMMQq6T9fqxPsVct2IzegC+LGHy64Pk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 09:37:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 28 Apr 2022
 09:37:27 +0000
Date:   Thu, 28 Apr 2022 12:37:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rpmsg: qcom_smd: fix error code if irq_of_parse_and_map()
Message-ID: <YmpgTNlE/niOL8E6@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d1c5424-6e90-4e95-cbe8-08da28fab519
X-MS-TrafficTypeDiagnostic: DM6PR10MB3099:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3099E7C678927ABAB46FB9D08EFD9@DM6PR10MB3099.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8B8rXtbKnAO0+AnycqT6zGryJtetf/dM179S28ERYich6IUDWaJ6LkczfRsoarmNWOUvFqOcl0XYBmy1AaUuiDewPXJIfz/vkXrMt94gSnPSz6YXurCTNbmLzAM0jKGxQHaJazrnUcgjpGzuSJIUzqBh+LOdary1X38biAexOzcw/OPZGaotAwmD9VP2P6qt3fnKNZBAXnP13fc/WohSKLkZe1Df4lo3CxDorSutZz2Bu8HW94bUaMmIamUVhQAMhO02oYC/ZKK3SCb3YZ6TlP5kfhHKwoh8rDLMIUk7sf0z5vD6JuVC+crYwT9MWaaI0EeZK5U2s9VvfHkiu6DnKs0wWWYIy5PG5ARoDnNb7jY7NlT1eeXYgkqyq9KKP+PlWIhFmv6KsA9DoEO/gYDYB0uKkReSh4FShKOpn/5kvdbmBQKDYcxo05hveXdhp+ZzTtzAm3apdUzcClk/+oO3C+GW8gf1VjcBixn2RhRRuf5SCwsb928xh1UICJpGZqd27mF7luGHpTu2CKdqnQWzAfcTMuZCj5nYbclhwdpF5Tx5riaTDyr8ZvoKYilO4VmUhvqD/xBT6Hz7rdbAd3xONy3Qukl/ZmksWHjoldyJs2CWRD5m2rbbxEan6iI2XxWhfjnsruvdFzr8XTwYI4iUR6OJ14uFv+HBqorRNUD37l0/rZsYsmPIng7EqWAVmx4HCWCISwmu+mGfJoY2bxmdPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(4326008)(6506007)(186003)(6666004)(2906002)(6512007)(5660300002)(9686003)(33716001)(110136005)(44832011)(26005)(4744005)(54906003)(66556008)(66476007)(8936002)(8676002)(508600001)(66946007)(83380400001)(38350700002)(38100700002)(316002)(52116002)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tVAUzm4YLluwEBSQVVf7YHclGipJgrjfO/j4/5mkRNCd6iM/1jIETGJPHrVC?=
 =?us-ascii?Q?5heZ8UKzlSia2oBxO+ioMRgys345nZPZI0336RZCYlInMx4Tc3po2fCWv2I1?=
 =?us-ascii?Q?hvw0yX7QbjhgEaeipb0NJu9OAMueWX9hVgF7goyU+JF+PPJ0VFYjZtYnhTCo?=
 =?us-ascii?Q?skEZs66BgSpEBS29rysQ9FPMnPQYZW3CRpnc8Buh2wYy4At4LSTNArYm4VVD?=
 =?us-ascii?Q?aDGaYVFaihUYHC/ga7gL95F5oQRwwtKixZMZJm0flF91ELDbRmgyrQtYueX4?=
 =?us-ascii?Q?sQK9VhwD6P3vq0o7aYJCeIIVHPjsYsNzJiyV98NtdebEO0doxYsTvnUhcPDW?=
 =?us-ascii?Q?XgFChy2XcfumXeR9SWkFYW0mPI+3wWI1tJ1l8itlsSQg2AedPrMpgPs27Z7J?=
 =?us-ascii?Q?zB8xfbiZ3z+q55e9x2GEb6h9fwtOQI+oFBOvvokpIB4KO3UBRub4ud4zDnI7?=
 =?us-ascii?Q?47GeZD5vTo2qfGDaTKfDijMjaGvYNZQszR7jeVSGyq8qYovsinvaHK4KJc4J?=
 =?us-ascii?Q?cRnecGnBoDzO1AHxbW+a7+PovRycfuPZ41ECYRwPVaMf4wJApuvAANMyjcTn?=
 =?us-ascii?Q?6id9G7WCvg7RavPIT6q7EecirCVOCv+OWuaW9p7/gACHCOV6L4yUjkm8uPdo?=
 =?us-ascii?Q?gw/kCUiNkfdBGRTpexB8ceGt7RBTo+1HPPKHUIMewsAcKqrMObgILdILeXYm?=
 =?us-ascii?Q?5nYQA4XYFFZlMO+GBCtyABXMC3Jt8tEqmNMOzNKcauswFdAgqFsWuZwwk6jK?=
 =?us-ascii?Q?/1ILDNFK/iHwNLXtzmUYThMYPIZQHa4/9mYO4p5EfWFZBcIzivUsVckRYQlk?=
 =?us-ascii?Q?Qtf3iH0rC1WlG1tkOlPzru/hHhlB7ySbPc12tQ1IR+ykKjwrzZZuLflxdaVL?=
 =?us-ascii?Q?HatiqOdO7QTqgih0GZLoCSgCDBYoOB3YntdD2QmSfdLfobHa0ffLp2lgTxJW?=
 =?us-ascii?Q?w5PL+0zkrN1FXBmPF+yihcF2iF37b5Wv8zDh13POwA+0X16FS1mk+lgwQnj7?=
 =?us-ascii?Q?XsLGJE6la454EwasuW0p6h1AuCvSaHNOw21I/53Le772L8TrFMGOwhci5mo+?=
 =?us-ascii?Q?Ek1Fh+Vg2drgQFv1RRfi7YJ7raUQqOjf3RGv+WLvBensxde7/ovi9fwcyjT+?=
 =?us-ascii?Q?nJdq3Cvb3isW4swU2ny9YFyqKUsO8X1nbf7D0LhpzfA6uOumx2l/RDiEegAR?=
 =?us-ascii?Q?08YwLMU5aS7ODJ30rqVgXRHmw613dbWrDjiOSOGtKZPB8BQ+KsellAOhqyT8?=
 =?us-ascii?Q?KbnMvhizY54xEDhpcUkVOyBV0setKZiTymu9XqwrBAJDHm6TiU5Ik7IuM83v?=
 =?us-ascii?Q?elUkO4AGwBIfCNVjeS5rpcSFi4ipMhvrLOllwliZXENBIz43DT9QIPq+o5fH?=
 =?us-ascii?Q?7rbLiB717zgdcEAXrNuHFPl5Wjly/EcOuMRioNINnmRxyfdG1ziyOPOLDKic?=
 =?us-ascii?Q?wzbS64qXJatv3RUJB8HkhzywI+JUQQ+6Nd+fmcUeTDF5Np67YOpdi9DT4E1D?=
 =?us-ascii?Q?GlYGroZcgF3mf33atcE+W5X8poz27iaaNGew30zJypqXqMstgOs6I/+JrJwx?=
 =?us-ascii?Q?ux4BmxrgVsU0hQZdmO6R5n0FFinqgcwouRLzByfdmg8Es1hlu1GTzE0aPvRB?=
 =?us-ascii?Q?nMOsXBL8wn+VD1X6gJfJ7ssyCncxBmFfHG33kwLYt0j98/G07uoi0jsRcfzA?=
 =?us-ascii?Q?21Lg+Eo9wf9ZrNib6WA1YbLkziNC0kR526mcYwmfGonkL6bgHq+oHv3NnT7M?=
 =?us-ascii?Q?EOIRBUIqJF2mSDZrk3ihuc7N4hrJD5U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1c5424-6e90-4e95-cbe8-08da28fab519
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:37:27.3210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5cxre/erjWaGnZME1k9UUJGZVH2zfE0z3JKrn2QaT77TfPyBTwNXlXQNUC4z8yycv0AI0c17MmjUiUO1/EStHbywEkaFDnkZkuFJteNAn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3099
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-28_01:2022-04-27,2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204280058
X-Proofpoint-GUID: OLfuDnRWUzEkyYsGin2tFLtJRPKfIZmz
X-Proofpoint-ORIG-GUID: OLfuDnRWUzEkyYsGin2tFLtJRPKfIZmz
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The irq_of_parse_and_map() returns zero on failure but we want to return
a negative error code.

Fixes: 1a358d350664 ("rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 6ccfa12abd10..1957b27c4cf3 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1409,7 +1409,7 @@ static int qcom_smd_parse_edge(struct device *dev,
 	irq = irq_of_parse_and_map(node, 0);
 	if (!irq) {
 		dev_err(dev, "required smd interrupt missing\n");
-		ret = irq;
+		ret = -EINVAL;
 		goto put_node;
 	}
 
-- 
2.35.1

