Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2412FC4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 20 Oct 2022 03:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiJTD7l (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 Oct 2022 23:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiJTD7i (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Oct 2022 23:59:38 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831DD2181F
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Oct 2022 20:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDK6zW3mnTkaHr6Vm/byYE/uLTrmvGD9QLy3zVNOJLOq1ifiNiVMcDjx6A4TnTE1f22mfzC4CiL00SPn1My+PfpzCHea9RWfOZVoDXkjE7vN6m1ZlgWqJqdtpF/Z58wO441yw3QijQa0gvuqx4e2XCgkOHC3FmlvV+plifcblquw3FI7szejAaWsjU1fvZRVfNTGlnJSwkzYbZtoJ+z2sRjw0cG05RiawQmXRM4seb7bzPmOFmpWGZxumWLc+0QVEXb2xStF5AmtcblVofNb3i1R1e/eanRijfCSR/UW7IbIKjsmQlSVsJfMZm341BpO7dSM/03oA76y+S0k7aNjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgaBq6CvlL2JmeoTiwIRKXI65ovqhINvnAtcQwcU8Ec=;
 b=VOsEvVzg/iwyynf/Fob6HDenXaumYK8O7pJoNit8VDfNApK13ExX5BOaMl5RZZMDoUx8uE/9iEZbE8JfWxP14JQ0PXtHLGa3sqCx2frvUSrbbLf3yPX7mpe1GdGcJ5gG5/qc7Dklgwxk34Ssj+iS7IlFqvYG/aqmecy5VV07OeMT6itR0JXttcTaiaVcj6zXfin7bJx5CBhNQS7tocheTWQA3uyykWzpFBlG0HQWaXVtyVdzXFbRixkvFRINz1aqBppjZYGIvw1UCi3eqir8rpS5QC8BzZwlhCJxHHVKSXTBUCiMXml3a+E/P6afSvB6XBAu1fEWwCb+4lgbfYEhHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgaBq6CvlL2JmeoTiwIRKXI65ovqhINvnAtcQwcU8Ec=;
 b=WojxwGccfpOb8kcSz4prjkVmT2mhmub1JzS0qWR4+ZceDggkNgNHVXMKK2ENoDtM2F6VWvh0fSpACuhq3FChV/8CHo1brlThuWuiUuWASDaeRbqBbBNH/112PWCD9iH0LX/sMrB6fRk1QzWOzGwBIGonXVMk1V7gT30aS6xDx5w=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8794.eurprd04.prod.outlook.com (2603:10a6:20b:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 03:59:33 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a5ff:3d28:4bbc:e1ed]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a5ff:3d28:4bbc:e1ed%6]) with mapi id 15.20.5723.032; Thu, 20 Oct 2022
 03:59:33 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>
Subject: RE: [INFO] Remoteproc/RPMSG patchset review order for October 19th
 2022
Thread-Topic: [INFO] Remoteproc/RPMSG patchset review order for October 19th
 2022
Thread-Index: AQHY4+BjvTyoZ/8RPEqEzfezvXJ7Ja4Wp/cg
Date:   Thu, 20 Oct 2022 03:59:33 +0000
Message-ID: <DU0PR04MB941792CF75BBE8A0C6E1D3D0882A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <CANLsYkzjTnXxqqFxZp2ya7tRj0JWyifHHJvprTLysQWU-V1ksw@mail.gmail.com>
In-Reply-To: <CANLsYkzjTnXxqqFxZp2ya7tRj0JWyifHHJvprTLysQWU-V1ksw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM9PR04MB8794:EE_
x-ms-office365-filtering-correlation-id: 0b1632a4-e452-4077-263b-08dab24f7f21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bN+ydgeQjp5QD9xqf+V4nRKuQ8Z+sDEKvDoZpySiCP/MWbADmq0etLoK5PfBSwXGDIgPFDZ7YwzZmFdxCnVvBdfRnK7m3ICJ1GrX5KeClYcJhTqooa76OUEvl/jOA9/arthiyZIxnOfmGn7ykSBEfhbiwrq6nan9XowoOSsVLKE4rQ/3zodKuFxM0+JRz1gYIq08JSbyLG+F3BnkOTnS7g5walEkJRlV/x/YIbI/mwI6ZSTLp+LwWQ54MSTDIAKkBFyCW4cvjMzC9OpRdk8+7eqxMubL0wnM9cSMLUesf7rbIXi3D/hW1aeRqIH4LuRdt9IJnN0WqS5poz35fcHk4ETZr6vaS0eHW9BUuBRHU42JPChHqUJCktAr//hI1AFt+2i/fBFEQuHm3MoPNyjqr57ERyG3tPPUXzasExBwcYxX5iXWjSnHmkMxXpGJQZsLmr/kR3fMmBj3BwvCQnwNoSO+aUfjGLRiW94MJ43k9xwdWeiM1TAwBaPLnQ74juq7uTsSkGK91+Mz7hAMLIUscHtszoddUpBnMfkQEtkTxr/oFik5eslt4FZgzlcE042fsTk/sAdfo3SZochZFYfk8LdCHlk9B9gitK6dismxVMLRml7iu/gGkRkRwI1F7irJTBhkqjEC8yt+1vytPfsaIHxAJOZ2fQyqg/WnXcY/jqoxnrzyeqAqo22aYA3yPQOAP+9578I+AFpcX25s+GJ/Im3whdYxew6Jd8FKHl1I3Pgi5SN25nAQQW01+ahVFt56u3joaQgsdblKIM/6jPK3HBx1frGdPrHmSkfZRRiC8Qc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(4744005)(86362001)(110136005)(44832011)(8676002)(66946007)(66574015)(64756008)(66476007)(66446008)(66556008)(6506007)(83380400001)(41300700001)(5660300002)(7696005)(316002)(9686003)(55016003)(52536014)(8936002)(38100700002)(76116006)(26005)(966005)(186003)(71200400001)(33656002)(2906002)(38070700005)(478600001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q01ZRVRRcVNDa2lhc1FhRFBLc1RQSHFtSDl3ZkNMZFNwK1htY1d3ajBZUkJu?=
 =?utf-8?B?dm5icjRFK09ZVDB0THN5L05SRmtVUHgrV3pEVmFja1FFRHlyTTBBT20vbG5h?=
 =?utf-8?B?eGE3a3FNQ25CVHUvZTd3NWF0blhReGZBeWh3V1VuSXphSDJJTTQxVGlsY3Iw?=
 =?utf-8?B?Z3RuU09sOSt5OWlYdDRkZk0xbzM1bERmeUcyRlU2YVRac0NFOEIrREhiZkdH?=
 =?utf-8?B?N2ppbUxPK3RSbmV0NnRTWHR2UjlqaFFEaFFYMTh1MmFpaVBwaFFRR3BVbTRE?=
 =?utf-8?B?SkgvZWhTeVBrRzVxb3pHZWxGQ1o2UmdKQmU0bmtYZHFLUzM5RXUvVE5XQnJI?=
 =?utf-8?B?YWJBVmpaTW9VWmN5bEtpckd5R3pJWTBldVZGWVB6VFhIQWRNTFJ0NTRvcnov?=
 =?utf-8?B?aFh4ZmJyTUJ1UUhxUVhTeWU3LzBNbXFPRlF2OHVmY1Yybm93WDN3RVJ4Q082?=
 =?utf-8?B?bko5c1MxZU9oNFROVmtxOWFqWEdFQmNteE00MUR5TkRZN1FZMEc1bWczVjE1?=
 =?utf-8?B?UFlFMm9kYnF5WjNaMG1hMXFRQWxrVnN1RXFQRHBOT1RTVklVVHozck13anZQ?=
 =?utf-8?B?N2l0S1BGdlZ4L0xBSW5UMEg4WGdhcUNhTkh3clNDQVJQaHdlMk1UbmNRVm12?=
 =?utf-8?B?VEFSUDhBQ0tRVW1HVWU0TWYzZ1dFcVFwaWd6cDBjRE14cFl6VnRUSXZka2Er?=
 =?utf-8?B?elBnd0QzQktCN0ZqNE1oUXFkVGtuK3p1UHNEZVQ0bm5jdk9TT0tBMFdCcHQy?=
 =?utf-8?B?a21hN08yQ09rbkNtMitnYmlnV0FHb2xuc3NXNmpyMGRnYnlicUEzNTFscVEv?=
 =?utf-8?B?Z1NDaFB2UERla0l3SVQvbUE1N2dpVzZKMTRtaUdnT3g5aXRGa3B6VkJQK2lB?=
 =?utf-8?B?MzdYYlc4RE9PZ3ZqSHFwTDdUTlVFY2RvdlFSNFlxbFozT3hsUWJ5ekltc1Jr?=
 =?utf-8?B?d011RVBXYzB0MzE4QkFXTENwajlhelluQkZiUVdGaUJRNnh1MW4wNm9vbW9X?=
 =?utf-8?B?Unh6ZVBBdWI2cmVEdVZxQXpLbUQyeWNhbiswdS9COHB6OUtWaWRYcjFEUkNB?=
 =?utf-8?B?M0hKK1dac3FhMzMxaDQ2cTVkclAyeGlRWXN0V2RlTHRwVk9HanFWU1BZT3VQ?=
 =?utf-8?B?bm1XVUtnMk1LcnBxOWtJUEhwZGNmcVhCWnQyRkgxQTNHN0FiTTEwN0hiMVY0?=
 =?utf-8?B?OXd1U3RlVGJCdjRmN1ExRUNpWmVrcWJTRW56ZDBEVFFTVUQ3aCtLTkZDVHdi?=
 =?utf-8?B?ZGhpeE5JNFZpUnluT1pvVkNiWFI0dm04bDZOT2hzNUowQkc4MGJPaHN2cW1B?=
 =?utf-8?B?b1Y1L2hicHlKdFhuTkJmY1VsQXd0d2FLWmkxc1UvcUp0K2NoTmt2SExJT3FN?=
 =?utf-8?B?ZmNyaUVTY2p0aFNmeTlPRmU5cjRqUTFRZjNqZm92RmhYU2hoRnB0VjhKSFhp?=
 =?utf-8?B?VGQ3R1dPMVJFRk05M1JRWTIvOVFiWE1tMjhtTUlSZTZhV2UxTWo3TDFPZFp4?=
 =?utf-8?B?UkZUUkRnbDR1M1R6UjU5dVZCa3NpSnpSdjdwOXhmd0pyOVR1QmdDV2lsYjA3?=
 =?utf-8?B?SGsrK2xCbGN1ZnBtbkMvTnRLcVJsVFR2bzMvN083NTJzSG1xNEQwSTdhbGtF?=
 =?utf-8?B?aXpiQ3JwNFFLeW41dWxHbG1KQkdBcmd3Y05HUnRUWkw1b0thS3dzMHFSZVdk?=
 =?utf-8?B?dU00L1NVSGpSWkt0SU9IRlBROEJXdXI1dWtSMVJHV1JYK0NQaFo2OUxFM0NY?=
 =?utf-8?B?Smh0SERrYnR4QmxLdW9wS2VUcTVmNHhRVGFpSkU2eDFFWkNNL3I1R2RGQ0Q0?=
 =?utf-8?B?S1VuUnp5S3ZNYXFSeEFsNmpEZllNZFhISEhWVTdOdXFPM2Vka2FyL3lydTJT?=
 =?utf-8?B?RmM3Zzk0c3MxanR2M1FuTlczRktraHNwVG53MlVRaUNoMDU1Z0ZrNXZSeEtK?=
 =?utf-8?B?UEs3NzRGR3NjbVZZTk9SUkl2RERzeDRmRUdocmEzMGtjQVQweDVjb1o2NWRX?=
 =?utf-8?B?QXJSaTVqQktPWlVXcDI2bng0WnJmVnoxcElqMVhpL3lCVzBlNVQzOHN0L2Rh?=
 =?utf-8?B?c2hhOWlUUUJLVzFLcUM2TUlxblRvL2dEYk9yWFh5ZnJxOElrR1YzVGpLR1hs?=
 =?utf-8?Q?UKfc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1632a4-e452-4077-263b-08dab24f7f21
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 03:59:33.1073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EMf7gIYlnKXREikFN7M86RJK5Yf/LM9sMQUPaOk80eiUDBjUZ+FTUHZ1gaITnd7wUyccJfok6/JlZharStcTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8794
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGkgTWF0aGlldSwNCg0KPiBTdWJqZWN0OiBbSU5GT10gUmVtb3RlcHJvYy9SUE1TRyBwYXRjaHNl
dCByZXZpZXcgb3JkZXIgZm9yIE9jdG9iZXIgMTl0aA0KPiAyMDIyDQoNCkkgbm90IHNlZSBpLk1Y
OFFNL1FYUCBpbiB5b3VyIHF1ZXVlLg0KRG8geW91IG5lZWQgbWUgc2VuZCBWOCBmb3IgdGhlIGku
TVg4UU0vUVhQIHN1cHBvcnQgd2l0aCBvbmx5IGFkZHJlc3NpbmcNCnRoZSBjb21tZW50IGluIHBh
dGNoIDIvNz8NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMTAxNDAzMTAzNy4xMDcw
NDI0LTEtcGVuZy5mYW5Ab3NzLm54cC5jb20vDQpPciBJIHdhaXQgeW91ciBjb21tZW50cyBvbiBw
YXRjaCA2LzcgYW5kIDcvNywgdGhlbiBzZW5kIFY4Pw0KDQpUaGFua3MsDQpQZW5nLg0KPiANCj4g
W1BBVENIIHY1IDAvM10gQWRkIHN1cHBvcnQgZm9yIFdBU1AgU29DIG9uIEFWTSByb3V0ZXIgYm9h
cmRzIFtQQVRDSCB2Mw0KPiAwMC8xMV0gQWRkIHN1cHBvcnQgZm9yIE1UODE5NSBTQ1AgMm5kIGNv
cmUgW1BBVENIIHYxMCAwLzZdIEFkZCBYaWxpbngNCj4gUlBVIHN1YnN5c3RlbSBzdXBwb3J0IFtQ
QVRDSCB2NiAwLzZdIEludHJvZHVjZSBQUlUgcmVtb3RlcHJvYw0KPiBjb25zdW1lciBBUEkgW1BB
VENIIFYzIDAvM10gcnBtc2cgc2lnbmFsaW5nL2Zsb3djb250cm9sIHBhdGNoZXMNCg==
