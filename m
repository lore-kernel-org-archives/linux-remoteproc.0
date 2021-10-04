Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2CDC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Oct 2021 10:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AC3561372
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Oct 2021 10:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbhJDKzH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Oct 2021 06:55:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7278 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230380AbhJDKzG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Oct 2021 06:55:06 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1949mkWg026334;
        Mon, 4 Oct 2021 10:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=zibnPQxiIx9gK1wVyGq/0jiwZwHuUN0YpRz7OZ/yLCE=;
 b=cPx7Y9clI3eXUGlORCHKPyCvFReffaPgeFqCxzYFWa6Gm1KRI9lRaBXSdRXcpAjWFkif
 MKO8MqJWURji/sXt4i2ihQG3IPnC+P32sASHT/PME6Hfsle6ky8AMwqzYQwREqMTbP7k
 dMY2fI32YeO85PuyHtEw4ffl/xDE2b1vh4hBWnQjEzn1uvXYKiiZRHQZPmVSo8BVMafr
 unZDpQtHo7ylPSHkOfTPWTQ/oUTpNxORP4Q/7vPmN8m1/J8bHMbbyi16PJGWj6Wko8PF
 jFltmdEcSDSydAXSvV76efstbpntKJYh5CtcNUh0dgbW+xW0uAjRqcXCpnupfgABU1eW aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bfbb135gx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 10:53:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194AicHi146412;
        Mon, 4 Oct 2021 10:53:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        by userp3020.oracle.com with ESMTP id 3bf16r7qq4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 10:53:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9UyDZV4piM3UI4tuDXcDl7WVBX/V70Uv42N9XycLUhQIpCh25jdn/saBkvW06SPrYb7+sTICfAzC7z4uvOnmQdWpk0/M4SxnakB14Az+kIVe8ncfxvGAlbWfEzhBKLAkAnLsJChQ/VgZRBkTtHGw2Zfpbdm5rMbZlJzDOQh+xHdA/kmvmYffHaI7/FrImt73ivVl7EBI0Dyzdye3yeof1VFe165roTyFoGSQszJKVn3pJbYvyS/XTt5Gm2KtHg2PwZIXlInz7iD4s9VkBdk2KAqbfp7qjWvDvHkGCOiobicSoYo1ckZi2/p2slYm3/d4Sq0CpDGCEYwhvxkudK8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zibnPQxiIx9gK1wVyGq/0jiwZwHuUN0YpRz7OZ/yLCE=;
 b=j1SuSJ0ojwvUs8lZ416DbsLGC0fh1JXAmakCKDmL1vML1xfGRkAKZGrpw1Ja5UAbEKga67bFb0mQqHIUalgt0zIfHUm9I+/Y9KTpXP/XR/IToQI0L4JCPTs3lD8Ry/1T3x0xfoM/FeY7bQMlJ7ICkaUW23bScdWtvSy30uzCEiJ2xT+Dtcvr1Zro5rV9SARJGH1NlpTyDwAbzFUXRpshZOT4Gp9AgSrDUyAf15//NhqmNUJ8Nbgw5GNEe8puehaGidxYZtGoaGMgtKb8WNZP0e+zNWfuH1fL/KVePYCS+jiqxuMZDJ0N4ssEXy2h7tyiFYrYjTzBnD52LrZgBLPa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zibnPQxiIx9gK1wVyGq/0jiwZwHuUN0YpRz7OZ/yLCE=;
 b=ehUSBIrNOdr04wJLE8K7Pk3OicukCVYRpIGqCtezvEzytq1jbPNqtkqXydwPTPmSdGiLuhOTF2XCvwWOhuWSAzf2J9m/js+7VIEC1rZT0zFPhXrgc0TyR1feWsq0Yoh0ANLD2V8Jh79JifhgyRgaCckMXHhbma+7ZWJ7TgPzXqU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1486.namprd10.prod.outlook.com
 (2603:10b6:300:24::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Mon, 4 Oct
 2021 10:53:10 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 10:53:10 +0000
Date:   Mon, 4 Oct 2021 13:52:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: meson-mx-ao-arc: fix a bit test
Message-ID: <20211004105257.GA27301@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.8 via Frontend Transport; Mon, 4 Oct 2021 10:53:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90a1e1cb-ec0e-4b61-9099-08d9872527da
X-MS-TrafficTypeDiagnostic: MWHPR10MB1486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB14860CFF10D29425EB55C48D8EAE9@MWHPR10MB1486.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0l+ykH83s1NeIyTukqaTrWNa9gGeeOVpJd5cGosBg4cl1Gu+ButKR/i5bg4AFrGQK/oiQtTvv90QGIEA+2xeK/fUJ6oC8sdTOqHHW5wA0ugGKlMVgKI/zKGibhziVQFiY53ilak5A6gUay+EQkD8/kL8563ZTTragPnhrSTRr1zMlZac8/cwFpDQH8D4PpWTkjq3ERm9pi3QlEwTGslSRHIXs/BxOME5ze7No7DeOQ5wlBZFXwfaFZvRHB5P6/ld/DtvaWqTmB4Erm8vDHp5iBIch2vJE7oePPlEhNlatniMSjrWzfkacpfar4pimYJJVEFYyMpVCSmGBOH68/sq5R0zlCbPjW6rbRycm2n/OIegZEKhLEEow4oSd0N93rK2fHjRpEdBI9HG1H+RXip/DSLal9THmPNRTFR+zT3ceitBp8WDRtzVOErP14lJMKIanDmsmu5P++4nPS2EP2dVJpem5dQyFdbs+0psR1GTlrFrwVBECwk7UtPY+b24gY/9TAaPc3TxAg/AxGGLIPUCcGqKF5EcstE7WmAfbG2hob6B3I7RRkc3+FmE987bDe5EUToDzULGsJebb4RG43uOu2776Q1u5BgmVRjqCsNZgzTAdhEUKExngiamzS6pJ3lbOyuqkAqM4v2LMiRjVD+UxavmH0XaFn0JHkiEmsbaw5u1pD6+YI/Ad3gvwLlYHfvFIsIXgd0WelN7ilt29Vi9gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(33716001)(8936002)(2906002)(66476007)(38350700002)(38100700002)(44832011)(8676002)(4326008)(83380400001)(9686003)(54906003)(5660300002)(66946007)(55016002)(110136005)(956004)(26005)(66556008)(7416002)(6496006)(52116002)(1076003)(33656002)(9576002)(6666004)(186003)(508600001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ljVKB3hElEpzzHlXjEeI5GZk+QcmwG5G13FNiVkhbREA8QStLYmBeYy8f9J?=
 =?us-ascii?Q?ZxeFZnxpwOq6B27CyL/7VV2DXsCReiH11omg5WaZjx8CjV10Y2d2aA7vvi2t?=
 =?us-ascii?Q?n7GBXSHRx8LVNgVE/e/qluoutQXCBMGncUlLNQ7rZnM3mFvrHIOyYKxMVsSK?=
 =?us-ascii?Q?w2SavZKBlBY+waVBL5Eh/NHy82ob4Q82c8PGTBmpD2Ah2O4Xf7j0Mg2kf7z5?=
 =?us-ascii?Q?okiWfC9dg9zqqfiri8/7HIthnO4t+8yMKv4PvIXiygg4+7JrbRVDbL63S0RB?=
 =?us-ascii?Q?UdrGmamFRUKLItDvMDY/Vj4v61uutoQ/ynef4TfJg0HZiTYma+9X90z5xzOE?=
 =?us-ascii?Q?FNBQrMm4nxP7BB9o0Ch3Nunz8Q/BvNX8r30v3Tull7XEex2C9XgMQRRJOU7+?=
 =?us-ascii?Q?uOnVHIPYw+3vSOrpJyk8uX8VGs7gI3eOMWr5KCg+czXTU0iz9+toYgip2P1f?=
 =?us-ascii?Q?SwanOQxYVEcEW4YEZ8TxPWzqGum+wbQtlFQZoCV3B6gb9QgsLiyQLNprEX5a?=
 =?us-ascii?Q?5p4RG21EUA2ivygmakZQKDvdQOAQ3KsafZ0L8X0OGGY7Fk1lz8tBZtrg445b?=
 =?us-ascii?Q?7FcFZdUg/fFIUWrs4B344UiNQEh2dDhQO1y6Irk3vNQ2B4uRvEHAQ18bE54h?=
 =?us-ascii?Q?rkqkJng1dzdcXRGKg3JbX5SWsrZo4JzKpRqZ7Z/jO44Ph8y56L5hT01oaSTw?=
 =?us-ascii?Q?v2linCSCsW8emJ0YL2KDkN+n9ySWUWLUgWUj6Rm76lA65mQWkwmNyumAto2u?=
 =?us-ascii?Q?Z4wFpN9Rb/VE/IuToc5o9+gJ5dUZ1yDlqQ5xD+teSFiyy+PjO1x0++p6NcZ9?=
 =?us-ascii?Q?cLkQGA48lb5p+1SAJCcFnavkn/RcqputPaFYoW0nQ89m8NOONpkp/DBf29X5?=
 =?us-ascii?Q?bU6NZ7H/lg3sq/6xifnCRO0E/vpATMNhby/OYsd3F+/cpmNUrKH736sRTeLT?=
 =?us-ascii?Q?MnDCKIgONzYRZdN9727F6ybMAyWkTqj9w4okjdXRV5lOgXZ78queUvQpIp7t?=
 =?us-ascii?Q?UR+JfzLAUagnnd+YTM6Ac4w5GTFRk0RiYIpc5DPM9XWyiy9qjQDY0pqsu08P?=
 =?us-ascii?Q?j3yi2QXs8Lc1VMDNesUdsl8YX62oip6IXmmWC+zFvigSfg8mG769YOp3rwnV?=
 =?us-ascii?Q?ZVtAJDc8JYbA+oVenmacVxx94fcfD8LLuRgexMRBSOeDA4zB0igXHnvjv8td?=
 =?us-ascii?Q?bBiV7kQhvO9d9qpAdxm01MYS9hv2ZEtOOvnEcDcSR+qAK+fnNJAjK6yuin6H?=
 =?us-ascii?Q?yYu5sgM79uHh+v9PCRfiqQm02ktAp6pPaz8yqapsGNBzoG7wVfn0mSB8AbHj?=
 =?us-ascii?Q?hYjWZYCyHm2t98YWGu4vxLpo?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a1e1cb-ec0e-4b61-9099-08d9872527da
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 10:53:10.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3pUJIZb7NwvyvzlM4BAfqjTh5iovOHwCZq+hKT9C89c7s7A7IGa+WdZUWJM1zmDjwowFxnE2gterzAWTjAJonSAVlzqI4k9eyTORv5DWn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1486
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040074
X-Proofpoint-GUID: rU3NoTJdabUbqHIghr52ugob3Ahbe3ad
X-Proofpoint-ORIG-GUID: rU3NoTJdabUbqHIghr52ugob3Ahbe3ad
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The MESON_AO_RPROC_SRAM_USABLE_BITS macro is used like this:

        if (priv->sram_pa & ~MESON_AO_RPROC_SRAM_USABLE_BITS) {
                dev_err(dev, "SRAM address contains unusable bits\n");

The problem is that "->sram_pa" is type phys_addr_t which is potentially
64 bits.  That means the MESON_AO_RPROC_SRAM_USABLE_BITS macro needs to
be a 64 bit type as well to ensure that high 32 bits are cleared.

Fixes: 6cb58ea897dd ("remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote procesor")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/remoteproc/meson_mx_ao_arc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
index 3d8f927ae448..462cddab6518 100644
--- a/drivers/remoteproc/meson_mx_ao_arc.c
+++ b/drivers/remoteproc/meson_mx_ao_arc.c
@@ -39,7 +39,7 @@
 #define AO_SECURE_REG0_AHB_SRAM_BITS_19_12			GENMASK(15, 8)
 
 /* Only bits [31:20] and [17:14] are usable, all other bits must be zero */
-#define MESON_AO_RPROC_SRAM_USABLE_BITS				0xfff3c000
+#define MESON_AO_RPROC_SRAM_USABLE_BITS				0xfff3c000ULL
 
 #define MESON_AO_RPROC_MEMORY_OFFSET				0x10000000
 
-- 
2.20.1

