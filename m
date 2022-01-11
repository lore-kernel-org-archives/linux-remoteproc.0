Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369F6C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Jan 2022 06:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbiAKGwU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 11 Jan 2022 01:52:20 -0500
Received: from mail-eopbgr20059.outbound.protection.outlook.com ([40.107.2.59]:50627
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233846AbiAKGwU (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Jan 2022 01:52:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7YBHNYfe/1uwClqQ3Kl1UwKyhXMmunLbLdKakqG7v+5tgD/V6k0eS2DuQ9o22n6KbiXSUCDXg1Y1TQyPcjSMRqgLuViPo7S1Bt6Rh3x1t9CLE+23XEslq3FPPBM7yvmXRPCB8HwzwBoah57xKK83Rj28HpGkgU6m8wuYg1flWi+y1By/vJj6G9WkXnnYCLdo+6h6IQyhBe9hHiLrVaOMZZZyvaVG/L4lOgqSAVT894fJJTFpr0lcgtsbLb/qtlUKWJNLEO0hA089t4B2h5ynTVWHCMOD0moFGf6NGlkPI5oyoc6FyTboGuOLmc6Z9+vUawJMDFZzwCfKSqV0qUH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQEo9aMPxTb3o7RK2BDw393toMpJFx27TooVoBnaAN8=;
 b=YlfFjo7ebOH5advrsfXrdJ/s8ngItTd7F36WsV9172dsY7W7KqY4ziEndbjRUf4rvYY6pobA6e+4VbE0our421fvrncOGvBukNW8OeYUK3JeG1qjabsiQK5fEH5Eu1RDjasV2qdEBe4iI2Bxw0WpDH/G38TNfNRPE5i2AzQhg2QypsOR9yTNuHxDKMJg5eH1wfx/NrE5d7ZoWBwipUVIwHhZSw8a+uJIdZ7PV7YJGIRFqWE4zavt7g8bIolNGXl23LFfaU3Z6sXwDLTtRLD1zr+J2JyiASZdNiiabgG0MmjGUhxaX7F84ck446D0DGy9SAZQ9iTpMqDY1F4ZlPc/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQEo9aMPxTb3o7RK2BDw393toMpJFx27TooVoBnaAN8=;
 b=gfePLsL7QmXagtAVtkDEVVcVP9WQ5W0aQDDaqzOx/yXgjE12H2Z1FdEpFwPWmcs2LqWv0O5z1oXjJnSmJpeOblihTIToTZ6Anh/rD7Rqi7k3uaVdhsDyrs8caHAQ+YhB2+47PNd24PcNnFMelgGSE37LKfiuMAmtEwwvOJiR6c4=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 06:52:17 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d4dc:8c9a:55d0:81d8]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d4dc:8c9a:55d0:81d8%3]) with mapi id 15.20.4867.011; Tue, 11 Jan 2022
 06:52:17 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
        Arnd Bergmann <arnd@arndb.de>, "s-anna@ti.com" <s-anna@ti.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>
Subject: [Question] remoteproc: use io helper
Thread-Topic: [Question] remoteproc: use io helper
Thread-Index: AdgGtwLm5TfPXtW2T6SlK+/p2/8MRA==
Date:   Tue, 11 Jan 2022 06:52:17 +0000
Message-ID: <DU0PR04MB9417C120356B3B853CD6176B88519@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdb08c03-b00f-4744-9f6a-08d9d4cee86e
x-ms-traffictypediagnostic: DU2PR04MB8790:EE_
x-microsoft-antispam-prvs: <DU2PR04MB8790638164749834AE6F3CDC88519@DU2PR04MB8790.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kg2vFA017OK0T5QzIi/dadalEuoUDHo5giFjtGbAwwwQknOTUwUTxQaOkbyVJwPSjTCASMX7sJbV9kwiDyQFxZyneN5PP/1oRALdX1/Z2RHMhkgW+KbqhDPwTrx2uw8IDvHu5GfWgpomaDSk4Kg+48+/UhbNWYuy0rADCbrxJPa5uzwqKQYwKStgM4Ggo4SfoCXsQRUbot1cUxELez2rDLPD2P1KqNqTQ019w6F+k9SXEjDoeVQA2dooA8T6Uo0jgTX3RnhxqQX68a6JAxurBt5DQ6gHPYvol6Om2Yx9Refsr0bI32aJ4TDuZn4KcMKXAhpAwLIDxbsWYX0oUbyRPLy1DfDzFWqlA2VVl0u1sWbCDh0no5UTdZijHPXbz5Hoh77h+Iq76q18EZvbkM0iyDk/aw6jpu5N5XfDnz7dBmjic+azsuyS6uzscUz4weZflqQmNVMlc2G0Nzw4CAjIAC87cbexn7RCn7pkKOQll9mcHUa+vJAzc4p+RetxtakHITz6jhgVpzexa8C0nKAucSph581OH4NARZI4h/TcVxE4PlCne/x1HxXNEwtNRveJryNsy8AbWDsM0hFBRfCjct6numkKIyolDZcmNIP1DeAidb6pgSMxFVTZg2cHD75i2bVC+7ZjTEOlMBSZwF9wtsJqrv68bF0TU0Crrz7unz7w4Uk+qMc0Akqy9SlVKUTq6EzKEmMuG7CpgLT8Yn/H1g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(44832011)(66946007)(8936002)(71200400001)(508600001)(76116006)(86362001)(110136005)(54906003)(55016003)(316002)(66476007)(64756008)(66446008)(66556008)(5660300002)(4326008)(38100700002)(8676002)(122000001)(83380400001)(38070700005)(33656002)(2906002)(9686003)(26005)(186003)(52536014)(4744005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3OK3uSh9fSwKXkH/4gH5Kz7wZz1fMNsSapbEhjDTtpmLUcw2mcmxOwCdKgpE?=
 =?us-ascii?Q?y1GYbJibcsFZIIef0PzBQj5X2wnJPMW2TDRB9Msl1BXkdYjJkD5BwOIhDaJN?=
 =?us-ascii?Q?QkQmBw1xoACtDzLG+2dy063plH3ErehF3IxgNbCRr6rX1IzQZP0qCWwXergH?=
 =?us-ascii?Q?CbPV0pZYK97fD5Dj3ox82gwzH8NR4IL9g7q+PrAE8+q0nVf74WSz4kPEZx5O?=
 =?us-ascii?Q?1LtWznLSedG5Ni7yjkgpqdampSALewE8klbssbtr2YEFi8AOet4A+uoeIJr2?=
 =?us-ascii?Q?en9LYk0AXQZJvfIgeJAwJlKUng934fyZ+1+xIl9nXFVGU61Y4qc17FNzrXbn?=
 =?us-ascii?Q?v5G9NnbroPjiM1A9c9oUVw18/76xNcnk1mB+YJr7SXkQlfpsKKDSkCt0vCZq?=
 =?us-ascii?Q?xZjfl5wnxVsdnyr56QTzJzyJVoQ0BnOhPBJcshURMZ0vaPmRvwrtgRszsbJB?=
 =?us-ascii?Q?3MLbAnLvejDK9EiA7ADP9A8VEv87dvY8jFb+aRkWnsj4+GoCxMfQqjtHjVrX?=
 =?us-ascii?Q?b94TEmgxQ0LkXBoSjksEkvCKOBrjPobG/4YJALzFhOZqnLYcajatXrqE8RH5?=
 =?us-ascii?Q?Z8sJaS9mkmCndUZOX8rr7wWSgpXQkFImxbq6K2bdC7heLqdItINaGc6uiwNS?=
 =?us-ascii?Q?nNy0Yq0eako+jeviFmRIeDiJmdgwTk2p+SoIhoIi4yavs1IMJ0xSYfYkZ7wN?=
 =?us-ascii?Q?rdoYY/WMk3p2vJ6op+0l0pqP/c89a05ssxutlnOk/grzLJSYfABdcnh1q/9l?=
 =?us-ascii?Q?GsZjLTjwUjbCXbMA//TAUlidExdR9JzMGhRpsplpludoXmCOyFM/s+jmjynw?=
 =?us-ascii?Q?mfElVhseb4vB2slRuAjUUDqAf+ew1Gf4pB0//t8FaQBdN+BWCBYiX0fhX5Uw?=
 =?us-ascii?Q?Mc0dZ0ynRkaC/sGFC/nnEtEBHkuTDnG1W3AwEJtVvsHMGL/o7pPIVfe8HF/k?=
 =?us-ascii?Q?nX7ErDD53vsBEZp6i8y0EOIOPOYMXc65dgKPa2QHkJtTOh2DUTSRQmEIGdPh?=
 =?us-ascii?Q?T+mb47/lmEtig5I09fSk20aLvZjhk2lDlk/oiGF9eS7Va3Is0BrHCI5dJHIp?=
 =?us-ascii?Q?OOd/KguTDgjFOZjOi6xjyZvd2sH4WETeU1RrG2svxzKqaGYTpqK8/k3d5qir?=
 =?us-ascii?Q?sw4yye+ktRUwBhFnHORjTmCT9WrNPJEKpbYLzalaDSZz5tep2wPR4guUmPJQ?=
 =?us-ascii?Q?Zf3J7L5OUByytgTHMvxxUMRgfZluTytywQAB8TPLTCd5yQeDxpbSrHw0IG/A?=
 =?us-ascii?Q?SM30mKhii51uVc5u1DelInmrBRnsQCY7vPh6b8CMmerZ7p2VGSONTKG06Fzt?=
 =?us-ascii?Q?173GSrAO7uwkCNirhuS95bnZyzi/u8w+ORjOh3Z/kGdn16PnyZhWXKAfbomk?=
 =?us-ascii?Q?ZVfieOuj3C+Q3+8uMt+6a/vlr5SWRLOF3KigkTdHZD6gqXpLzYyKTlS3VLwV?=
 =?us-ascii?Q?ZKHxo6qnHKB8N1QttByImHueuRILk7zzJA3PfiIRJZA4y6FwioXIVT5q9s37?=
 =?us-ascii?Q?RGHrkoRkXlul525qCnM3jfWCkoKjVT+UbAGvjzB3c6BTfF44zDCfha4zI1pe?=
 =?us-ascii?Q?vdMMFGKle3QHUTytOwI0RGUIWL34mzzre22JOsTWjPEdkoDUqCCEXBrC05aq?=
 =?us-ascii?Q?laUXYLLQfQudl8VrhxkZls8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb08c03-b00f-4744-9f6a-08d9d4cee86e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 06:52:17.6613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6hOVw6h35ieMHM/p5aujnJL9UZreb0Lp48PN1cbyAxK+1m8hn1CjowR0vR2gyP/hq4OFT+rjtfahP0rhrFUfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

In remoteproc/remoteproc_virtio.c, accessing to resource table
is not using io helpers, but resource table are normally mapped using
ioremap or ioremap_wc.

Should we switch to use ioread_x iowrite_x?

In drivers/remoteproc/remoteproc_core.c, there are places to
kmemdup resource table, should we use io helper?

I asking because SCMI use io helper for shmem. For AMP, I think io
helper should be used even we not meet issue now.

Thanks,
Peng.


