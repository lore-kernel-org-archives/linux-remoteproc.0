Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA401C6FA82
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Sep 2022 02:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbiIUCnU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 22:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiIUCnR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 22:43:17 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F347D1F0
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 19:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejiQhjWk4L1mWB0YS4yHwOh1g8LqR11eJWK+pmjbRrXmjY7gExbKYfROR2kYDJwDSD61Qm38osIjK11l4lZTsP06Td8lLqQfZsmai64CFMDfsdbYE1iz6lqNEqmd9Z3+hop48oj+n5mx+zuXgVsA31Z+6DALqJYelnjod77ISx4HY5LelvbeNMLOnSSIWnG2IReOpErLiNlZQB+Us5Owxry+q/voDUSie9wRoXDNoWHDGbfeJyAbX1Wqn2PTLa1x3uC9mwmO5Z5rDX7laoOcwG31Gqp9+m2q1PKr3PYXf6SDCLPnx15gn2greuRKt5UMMwYxzY1AVUu/VTlM125ZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCvxf4JzvISVDvqS+xpCGNhuoHnU1UOsqAdNamvoEoA=;
 b=Um5FyOramKLqC9lgCdAkeXu83aH/pNuEnsqzD1yTVbEbtNcuEvq7vKNxo0r7bGpbqLr5Cw/VkN1UynkfC9jVxORskCIrUSvTiHsenEvSnH6Z99zYN7eb5NhF/HgrRt4SuJI80KOlFB+A1MZf7VqlMVZYI+o9e2atL6nIvWQOwrlo0Hbb1KXVo7OMNMJFzAtTsX3vek0QE+8VSnup4bJWsZWk3kW0nsyc9EtcdTvAL4SnmWWsIwSjPxBN+PKplwDVMkXLsua4ivu3/tUsNZU8XUaEfMSxsouogZzWiHiPblaLs9NF+YaqPULll8130OyfJRvhWLNmn3nUOfq6qNYVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCvxf4JzvISVDvqS+xpCGNhuoHnU1UOsqAdNamvoEoA=;
 b=oVaO6HhocSM5rVjl+rpPd2BO2SY8ztW7a27yxBe0mM6bgMgP+lg84UBtXXVtJ8CwPyjrvfk57Mab09aiQtx8BrSnGv22DnBOWOzVOgjmFTN9+Gs4qGw9ey2DgH31CS5u2WNNu8Gsqa94y0F3xKHCLnS79AfhvRnKCOy2qe3RLq4=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB7014.eurprd04.prod.outlook.com (2603:10a6:20b:121::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.15; Wed, 21 Sep
 2022 02:43:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1eb:dcf:8fd7:867]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1eb:dcf:8fd7:867%5]) with mapi id 15.20.5632.018; Wed, 21 Sep 2022
 02:43:12 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>
Subject: RE: [INFO] Remoteproc/RPMSG patchset review order for September 8th
 2022
Thread-Topic: [INFO] Remoteproc/RPMSG patchset review order for September 8th
 2022
Thread-Index: AQHYwyd6/z7bN7vCEUCLA5fbsDg3B63pQIxQ
Date:   Wed, 21 Sep 2022 02:43:12 +0000
Message-ID: <DU0PR04MB94177F4D5C00894049F4802F884F9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <CANLsYkxEex-d=Z2QqVEBYPFocvoaRka8GLnrNfCadiwW4L6qWg@mail.gmail.com>
In-Reply-To: <CANLsYkxEex-d=Z2QqVEBYPFocvoaRka8GLnrNfCadiwW4L6qWg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM7PR04MB7014:EE_
x-ms-office365-filtering-correlation-id: 73f6db05-b20c-40ae-e6b3-08da9b7b06f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z4pev9GVEA8WtOf8Ls+zx8EFfEWVoDkRNzdFmwKJgon+mdkpnsbBpvXiEMG42ElA9C1qKy+jefcCgzhb2k25eC97nJHmMEzKKzT1m/7QXiU7EN9rXJyR6QF0j4L3BC4zNBatUADNC/xVS+AlT7MkmJfRZ++wrek5dp2IBEbWJZu+6x4w55FFRWmL5djGxxaGhzLKgIMC5A80oSnXP9ZbFTnJRTjIvbo9DuQ07RKBbjq+3TMGlpkGSuw6Azfv5f1A/H7gG4lm4MBRppMrtxmvCBAPRdsB7yvHbX1M6g/vfrZAnY+QwiVDrvwN99WXHmbjrW/xsFDSBA0YdERNbEaIAzruf6tXXdaOSkyTprdcL8PqPx4nBcdWr3Cn7FUm/ZzrlqQ9bCFj285yIk25bWBLwMVNgqpNKixzny1VSJqaXBOAglkkbTq55C6Eqep23o2QvxcXw+iQnvk0g5f3cEuEG2yfVp/OsX/sKX0HjRjHxbc6qmDsw16tUPqm/rBZuOxutLWjBFriWdCrK2ezQZBBFbfvVR8GEAStbBpnX4ek9CPM6Oj5fEeV8i4QpalA8cOb0ts19nMC1cbdkVkKfRc5mYExEpR7uNZoEivmDICNK/ilWo9e9Ed9xez582Txji/h4iJ/Wk7lh32s2rklWIsnr8SCUGN2ABX5QQ3du/qTaYITrOYZzB0SWkLehIA52z+1WBqA8MueSz2/asWsVZO2OKF1Z4r4Pb+4H6e6EvJWij2YCtL8haGKUPjXbplRsX1mHluo2pt6nSY8+JreNdNvDRe5uIomeP/4XpPhWxOYLO6UQWTNdmmGidfx4a41yWWsm1JtM0diFDaHIW4CpxpIGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(122000001)(33656002)(38100700002)(38070700005)(86362001)(52536014)(64756008)(8676002)(76116006)(8936002)(66446008)(66556008)(44832011)(66476007)(4744005)(66946007)(41300700001)(186003)(66574015)(83380400001)(5660300002)(71200400001)(478600001)(316002)(966005)(7696005)(2906002)(6506007)(9686003)(55016003)(110136005)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjUyTDlxemVkcHhXSHpLb1RTaDlDblVSUkJrblVMSFprZXhFaHd3VExIUnFE?=
 =?utf-8?B?VTFrcDdQUzJJekpRYTlxdjFpREdiK0VuT0ZOaUZEcWh3bFhDYUFhRzlSNjU3?=
 =?utf-8?B?b25RWGhHdStMbHpYUXV3ZmRJYlNlbEdoRE5SQThPTzEya3dNNy9aOHJoRElq?=
 =?utf-8?B?aVZPMFNlVE9VTlJ0bG9GUGVDWTBDZFNLL2FlQUFSRzRROE9jcG9ZOVplYXRN?=
 =?utf-8?B?MmZmUHMrVWUyaVRaQmt2NXFydDJyQzBQMXpZdURzRnl2NnpSdkFoLzhJUG5E?=
 =?utf-8?B?MzBhUWVQUXAvR0ZiWktkbEpjWFVrVmxTM0tBS2tHNk4wVGxYcVVub3hzait0?=
 =?utf-8?B?R3cvdFdLVGlOUG8vVloxR1J6aWpkZTZydnBLdmF0a1pZQmtzVmVrbjRkZXQ0?=
 =?utf-8?B?b0lQL1FmRmRxYTljS2FQdTFyT1d4dVZFOW95YjJsa1FvTDBBREpqTVRSbmN2?=
 =?utf-8?B?WjBGbGVOclNNd2tINDVlWXA4eGMycWJPcUJ6TFpodXl2N2NPOCtpclRuTTMw?=
 =?utf-8?B?d2F4WUkySVkvRGhzTkV1U2tvS0VHTGszYUhJTEVsZEhVZ2lhc3ZVeUVoUVor?=
 =?utf-8?B?OVhyU0g2OUNRanJKMmovUTV6dmo3eXB0c0VQNFR4Mk5peVMza0Q1WW95dmt3?=
 =?utf-8?B?TXUvM0RQQzZUb0FXNk5qRWFwWXVoRm1DV0RYTWpFNmkyNkEweks3T0lFRWMz?=
 =?utf-8?B?ZEk5cldpb0Jubk51NDBhUkFYd2crQi9tUGd6MThRQncxT0VEVkVZMlVVaXBj?=
 =?utf-8?B?VEFnUDFJUjBFblBHeG56S1FzYUl5bk9iZXpoWTZJYkMzNjcybE1WNWRpRWxH?=
 =?utf-8?B?c1ZNWjFUNWt0c3h1bWJtdFlZNWNYWTZpZnpSeitKR3J2Qi85Tm5senRFelZC?=
 =?utf-8?B?Szd0YzlPM3JGMC9UWFRlWWlxOExCNlhacERYaWlkcWJGRkQvVWpvVzlGU2dK?=
 =?utf-8?B?ODNDeEdPeVlWUXlNZGtVOW5wYlFYN1QyR3dGazlJUDdNZkR4Nk9qekwvWElQ?=
 =?utf-8?B?MWVkVjRnYlNzRS9RaHFic3lTd2xrSEx6MmNnSG1jdXRvQVhtY0h5Vyt0dEZq?=
 =?utf-8?B?VFN6N2NaUlhnNGxrR2ZWNVBrQllFK2NuR2RaNFc1WkVCYkU5YXFxa1VvdUNG?=
 =?utf-8?B?RG82eWUybU1iZmc0VnNLU0FvMUU4aytZK1hOazYzZmlpZ2FleDN2WTRhZE4v?=
 =?utf-8?B?YWtZU1VPUEw2bk1wc0RkZUdXYmQ5eVJTUVg4MWY1eDI0a0ZLWkdqSGhGNW1n?=
 =?utf-8?B?ZUhsRytGMzh6Y1hFT1FYUG9seEk4QkpiR2FHZFpkc0QzSzR4RjAwc09xWkg5?=
 =?utf-8?B?UVJFTTNSZ3pENWEvaUl4YmZtbEM0UWdCK3AwbEJLTVBnK1h4dU83aEFHbWpK?=
 =?utf-8?B?cmcvM3FFdXdnci9RS3QwVGFJQnYxLzRLUWpvMk03YW5lUis0aXY1cEZsd2lH?=
 =?utf-8?B?b1o2NlpkdmU0Sm5lR09rMENJR1VsTkdmS3JYNjBMdDBQNnBRV0lTOVVCbmtt?=
 =?utf-8?B?dGlya015dWhFaHpMQzFabndCOUdFaVZNOVpHaGRaQ0xNdkNVTkpVdEhiT3NV?=
 =?utf-8?B?ZWVFVVFsZm9aUnFNWTJmcWpNZEpyeFNiMTB4UThCMUhzYTFRU2JEdzVkZDRG?=
 =?utf-8?B?cW9JUkZ0ZWtiVUpadlpTMU9ESGsrQlhwb1lnMFRiUDNHaVBzRzVjMW5EY3Uw?=
 =?utf-8?B?Q1lWNUlTYjM5YTBUTFcyU2NyZzNkYXFXcUROdGNxRUxBYm1UQU8xVjlFVkhQ?=
 =?utf-8?B?cXV2WCtqaUN2TnZkcXhrVWJXMDFoSTEvczJiQ3NsOVI3K1pucm1QTVhLd2Rh?=
 =?utf-8?B?S2YzaU5pR1FjRTRiYjJqVlZKV0N5eldzbjBWVVNQZmh5OUJhc0VlYk1MbFNy?=
 =?utf-8?B?SmI2VG5YRW8yNnNOSnpJTDQxQk5sbWc1U25rMXRQdW03NDRTUmE5a29Oc1p5?=
 =?utf-8?B?b1FNWEgveFJMUkJNRlRWOW15UzNpeUh1eE4rdzMwc3ZkQy82VXZhUFI3VGpa?=
 =?utf-8?B?UjZRZjNJT2g5cHhuN24yQ2xyYW45bUR2NWtGWFpQSDRjZXkzRE51RUxOQldl?=
 =?utf-8?B?SVpTeEhNYzZCaTN1MVZ2RVU3MUZnbC80cUIzUE1QdUpHT21hSm9YemUzcnFz?=
 =?utf-8?Q?6nYw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f6db05-b20c-40ae-e6b3-08da9b7b06f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 02:43:12.6357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: czB6LqDwPVlk+hRrEiw9fnJ3RlCCNOsvrVanycQ7ErQGZJ8d5vQkwVA5TWOBIiKVv8lZfqyWgwYGeN+6Pi/EkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7014
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGkgTWF0aGlldSwNCg0KPiBTdWJqZWN0OiBbSU5GT10gUmVtb3RlcHJvYy9SUE1TRyBwYXRjaHNl
dCByZXZpZXcgb3JkZXIgZm9yIFNlcHRlbWJlcg0KPiA4dGggMjAyMg0KPiANCj4gW1BBVENIIHY4
IDAvNF0gcmVtb3RlcHJvYzogcmVzdHJ1Y3R1cmUgdGhlIHJlbW90ZXByb2MgVmlydElPIGRldmlj
ZQ0KPiBbUEFUQ0ggVjQgMC82XSByZW1vdGVwcm9jOiBpbXhfcnByb2M6IHN1cHBvcnQgaS5NWDhR
TS9RWFANCg0KUGxlYXNlIGRyb3AgVjQgd2hpY2ggbm90IGFibGUgdG8gYXBwbHkgdG8gbGludXgt
bmV4dC4NClY1IHdhcyBzZW50IG91dCBpbiBBdWcgMjR0aDogDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yZW1vdGVwcm9jLzIwMjIwODI0MDExMDIzLjE0OTMwNTAtMS1wZW5nLmZhbkBv
c3MubnhwLmNvbS8NCg0KIFtQQVRDSCAwLzJdDQo+IHJlbW90ZXByb2M6IGlteDogYWRkIHN0YXJ0
IHVwIGRlbGF5IFtQQVRDSCB2NCAwLzNdIEFkZCBzdXBwb3J0IGZvciBXQVNQDQo+IFNvQyBvbiBB
Vk0gcm91dGVyIGJvYXJkcw0KDQpQbGVhc2UgcXVldWU6IFtQQVRDSCBWNyAwLzJdIHJlbW90ZXBy
b2M6IHN1cHBvcnQgc2VsZiByZWNvdmVyeQ0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmVtb3RlcHJvYy8yMDIyMDcwNTAxMTUyNy4yODQ5MDU3LTEtcGVuZy5mYW5Ab3NzLm54cC5jb20v
DQoNClRoYW5rcywNClBlbmcNCg==
