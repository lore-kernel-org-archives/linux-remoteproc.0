Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF4FC27C40
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Aug 2023 04:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbjHXETK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Aug 2023 00:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240191AbjHXESf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Aug 2023 00:18:35 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::627])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4DD1734
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 21:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diQ6RkfMU8chYajrV+bkZ7M9ZPt5u8eB5TJ/FFryKSsWy7ykkOcoYZhkUnm14fHPl1m6qBYrjdCF4tt6bvgda4l8BSnOpUg9wsbPTx0wf4+SBtCBLLpr1yPhntuWJoOMQDI3Ok8jAJpI8qD1CHP21UaeWY1IQbyhqkAl/02bWnpSHI/kx7CNyBUK1RVVNX4zlaVv7oM27/rgrOEiJnM9sr7AlAjYNH+kPup6BNHCRSlHqLi1QvB3JdyE+/xK+ZiEUgXuKBZqKYING1rqOj22pBGHD+EDMFE4hh2AdXYJ0MeF2yHCJfOdkMn+Rqildpd/xA4z26rbBTocz6D1bUhuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HWcjT/kvMBn4mVZmI/m6x1MbYrFj0MB29Dp0E4ZCXo=;
 b=f3TYDiWCfJe4w6hVphu5YEhuWTjWb6rR8H9nkK7fC4ZLXl2wHAXqTTV23pH0ZrMT460c8+BwmUt3l/bQd8OoePZxSZBwZUo/x9InlawBu5pLx2AXPimPJe58VAooEjrPkSNlUpLhDfQQVSuhU/zcxtvBzTyzH28ZOoJbg7csXBaAhcCjO/haUEbCzVvA6nm2/Sv3bXs1itPk1ZBO9rh+Kfpue8Kdq7WRgbHm8Gjp3fq0USmcTzlZzS1bseNCS0j9DsmZIkOQab0S6CKJFYiuheyy4EmA2fHJUg29sQn2mVk1ORxT5fTd3vY5hxsss8j9k2L+i+hRSk0KlJvKdhwtzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HWcjT/kvMBn4mVZmI/m6x1MbYrFj0MB29Dp0E4ZCXo=;
 b=DMjjNiSJF3DBI4u9DsNPSKPOJ93m5XItd5AqYhd86Nm+PvRhrQiO7/BExFOaucATue65N+23lRgWU1cTLuH5p53IuVghX19VOObQvzJKSfT5sYdnqs1RBq48hm9WDgDTeWeqmMrc59kuWBzj15nDAOkuqD0elWHlfgGsAxPCKrE=
Received: from PA4PR04MB9248.eurprd04.prod.outlook.com (2603:10a6:102:2a3::14)
 by VI1PR04MB7168.eurprd04.prod.outlook.com (2603:10a6:800:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Thu, 24 Aug
 2023 04:16:27 +0000
Received: from PA4PR04MB9248.eurprd04.prod.outlook.com
 ([fe80::cf13:31a0:f65f:592b]) by PA4PR04MB9248.eurprd04.prod.outlook.com
 ([fe80::cf13:31a0:f65f:592b%4]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 04:16:26 +0000
From:   "S.J. Wang" <shengjiu.wang@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Daniel Baluta <daniel.baluta@gmail.com>
CC:     Iuliana Prodan <iuliana.prodan@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>
Subject: Re: Discussion about imx_dsp_rproc FW_READY policy
Thread-Topic: Discussion about imx_dsp_rproc FW_READY policy
Thread-Index: AQHZ1kHAZmTvfy8wREeO18oxCwdBGA==
Date:   Thu, 24 Aug 2023 04:16:26 +0000
Message-ID: <PA4PR04MB92487C425A59AFB4F1C9253CE31DA@PA4PR04MB9248.eurprd04.prod.outlook.com>
References: <CAEnQRZAHzbCBuYvyTxzLJWmEUw4ytY+F8i_Qk0O9Z3ZW0L1bOg@mail.gmail.com>
 <CAEnQRZCqS4+zaUDrFVcHo+eu-8ko4WC2TQtuG=-b5qeA4YU=ew@mail.gmail.com>
 <ZOYwfs0f++QXUJ2j@p14s>
In-Reply-To: <ZOYwfs0f++QXUJ2j@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9248:EE_|VI1PR04MB7168:EE_
x-ms-office365-filtering-correlation-id: 10079b9c-9bf5-49ea-50ab-08dba458e299
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RhuXyNlT2TDknF45QuXSbWviFLvR9q774KJXGuk/ZfbED9tx87EZJUSwjTeuIgW/nvsLNdMwBIJxH6BQGRHKM2T/bQpGQXVqX4knB/3gRKVwLwDnxWPfnWfJbfRgTcGAtn4ZIOWS8UvGbCzuQZeTJiEGxSQXPjrF/Z+wiMOZHCVBTwg6JWZjinVNhWjUw3QKL8cwlMtmB3LpA8gR/66OmRzobfT07I8fIp9jh1utBN5vnzEbaOB5w8l3IDh/itxshi5xk8wwI3bjvBqRy03bCWtp63r8fSOOR0TfMs8FAiZaKaEu7uDOjUJNN8vq1Td6WPFLvpFV3MRqgHGu1HbWEAtsOLEXCuVunbgFOUXEI1r7gE0QmkDTc0dhPIa69Zj5lDIjZ6O9vS5Ohw8SDVGHuO4TJzB/wG1BWIDe0bDsC3irxom6C74TWT7BaPOf/3RdSXkSHOJRJVAk6WJyb2SDc4nQR6Ov/LZ/dbwqh7yLFfuzAkOQIXLpkpffW/J0wA73w90N4AznD0Be4imsD8hy7K25kBsZ4GmXZD+58FdkZcb9qdT0vu053uH1q2CEPeaqaeaGXMQ7jNBXgTXjexgJF0dB1eRgSjIzdfI4Kb+u+1BJPvXXDM3YWP5OG0dDorBMd9qOLCBWY3YLDYqyLNfIBxPSu2tknrKRs1288cHfM4M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9248.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199024)(186009)(1800799009)(66946007)(52536014)(66446008)(2906002)(4326008)(66476007)(54906003)(41300700001)(8936002)(5660300002)(316002)(76116006)(110136005)(64756008)(8676002)(66556008)(478600001)(53546011)(966005)(71200400001)(6506007)(7696005)(45080400002)(9686003)(26005)(83380400001)(66899024)(38070700005)(122000001)(86362001)(38100700002)(55016003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWFIa3pGVVNZaGdCQ0RLQk0weU5RUzlka044SnhMYkNYcEhUZnFkVlR4UVdk?=
 =?utf-8?B?SGRlV3dVYUUvZVczUXd5bU5JNmZKdVQrMUFxT3hLZmR3d0FLQy8vSjBxRGlE?=
 =?utf-8?B?TjV6WEVRV1J0RmFJRGhrelF3dFlVMXp5QnI5cVdzSVRZTFhmbGhSeVQ5U05w?=
 =?utf-8?B?YVFQL25xTkdVOHoyK2tMNkFQYkhJUXU2RHJ3SGh5U0pQbFFLMDZRNWVsTmFM?=
 =?utf-8?B?dU5DZGtXRXVKclErWEFSNW5UTnZYV0x2cXZ1RVJ3RDJwOXVlSnUrbkExeFVv?=
 =?utf-8?B?dHV1RDhaL1E4cGgyc3Y5R282VFozRkdpNzFjTFFpOXJmcU5kcW9veDRhb1Y3?=
 =?utf-8?B?cGxtbDcrc1RqUndOQkJoNkljUlRzRVg2NHpUeUtObGNTTWt3UUI0UEJsN1lo?=
 =?utf-8?B?UFU2RDNWdEZwZVE5T2RTbUVEVzcxSjJ1N2pFZ3lia2VOcTd4c0o4OExTdkdq?=
 =?utf-8?B?WVlVUDZDRno2djNLUTkxZEFxNXdWeXF0OUxWK1orZmN5dVgyYS92TXN5Zkgz?=
 =?utf-8?B?dkdzQndQVm1TUzZXWDZtdUJyZHBkV0YwSWxZOHZhUE4vbUpSeHA2ODI2c1Zs?=
 =?utf-8?B?eWxGeHV1V0JJTk9LRm1NWHNPbldRTVptcmo0c3U4dmlyZVc1ZDkwVXJuK3NZ?=
 =?utf-8?B?K1VROE9mdVcxKzlYdG9tUzJkck9ZSXBkTnlmSFVYT3hQL3BGYUp4OFk3Mys1?=
 =?utf-8?B?aFNWWEVtS1YvQUpqakJ5MGpjZDF1SU5mZnp2dGNEbDQ4TDRpSWFUNkN4cEh3?=
 =?utf-8?B?RHVyYXJkWktqL1JDUHYxL1VNcWszcUlvZmFWaTV3VWZqemJsdEwwZTFIMVJI?=
 =?utf-8?B?TzlpcFU1Y2hiNFZPWHFVdkgzc1UxYjFQcWdoc3l3bXRFTjQyRVlVdmMzcVQr?=
 =?utf-8?B?dHQzdkNhb29LRmFwVVFIdTYyN3Q1TGlMWnJmanBPSWorN0t3S01hNTQ4ZWdI?=
 =?utf-8?B?dW5ueFMyZ1pkRmg3L1FEQlJwRjdWMGN4ZzIyVDRhemFXcHFMeG0xTFhXbzVC?=
 =?utf-8?B?eUNxdWxCT0JXQ25aeGhpaHllZERWRWJnQWthU0xyNHNYWm9oUmlsZ3J3S2dI?=
 =?utf-8?B?b1RxYjhtNm9EcWZ4ZEthSG5lR1RURGFhQnRBTTRHV2ZNNE1nbGlSWHJWODRl?=
 =?utf-8?B?SW5oZnJRT3pMSVhjL0syMmxkb0pHeFdMNktzZDRXUWdnQ1BhYkdkZm5WWHNG?=
 =?utf-8?B?enFXN2NQSWMzV3BqeTNWTHVsYjR1cE1hdStDSHFYYU5xMmhBRzZsNEZyUU5n?=
 =?utf-8?B?UGQya1MrOWJNN3N1S2h5RGN1MHdnOGIwSVRJQzNBQWJxV3pWU1ZzRWtTbita?=
 =?utf-8?B?NnB4bGNBM0tYSktRQS9qd3M5VmxWZnQvTktVNGhJQzBFTitGMUR4cjZFOGQw?=
 =?utf-8?B?Yk9ZVitmeE5Ic0J2c0pTN2QwKzZJVFRZb1dUaEpqeHB6MjIxenlGTmlJSk9p?=
 =?utf-8?B?MWZSMTZZM29FeklTUFVkNWFkWHo1dEFjWlBvQTJhcFcwN2tUL1VwL2poc1F0?=
 =?utf-8?B?OEtMSTA1WFJKMzFpMGhMUzZ5M253dUlYbkFtWVd3dTlZTWtsbDdQQ0hKL2Jn?=
 =?utf-8?B?L2FrenZGUUZiMjhkbWVXS0t0NXpwenFiQWo0MEFBQzJzcHBacHVyRnBnS1lE?=
 =?utf-8?B?d3lNcVFNVzdsU3QxWVhxM0syN2V2V21ZTVhKZlNJbmRWU0lKRDNhdnB2VElS?=
 =?utf-8?B?R3d3Rm12a2FvK3duTGxGNkUxaFM1bWJ1L3BLYis2S2RQS096anFydmFDTFBQ?=
 =?utf-8?B?Q3djV25hckRhTGVWbHp0VjBlYlovZVJpZndVaDdQQy9DS3dyNllNOVQ1K3Zk?=
 =?utf-8?B?R0x1RmFTdWFDUFFTNHhlbThBRVIzcnJBSGJoaDlWWXRqQ0x3SUdJR1ZaNGQ2?=
 =?utf-8?B?S2VCTmdOZ0taQTRicnppaklyRnNzYnlTNzcvZ3pVWGFPNE9uMkc4SnNFWGpk?=
 =?utf-8?B?WHhJTnJNTDVYQUN6Zy9RWGxzTnJ3TVhhOGkydEk5c09CN2RMTkVjLzJyRm9w?=
 =?utf-8?B?MTE2VlBGNDFrRTBBVXdpaVVOcVNlUUdrTVlTbzBSbGpTT2ZBU3p3U1ZzS05n?=
 =?utf-8?B?Um9HeDY3Mk1zL3liQ2pRNHQ2ZTBlUXFjSUhzVzZJS3o3VFAzMWx1dXpqRzRR?=
 =?utf-8?Q?ZRN8gZypSTvYgmU80cKdLWrkO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9248.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10079b9c-9bf5-49ea-50ab-08dba458e299
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 04:16:26.8694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z+zQhehS1lyCALwN/sKPtYLAuijDSpqvgSDW0uaiu2DI8T+THKGywXnBLjQXimqyr3T8XE3WuvGmOnzvtoctDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7168
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DQo+ID4gSGkgTWF0aGlldSwgUy5KLA0KPiA+DQo+ID4gQW55IGNvbW1lbnRzIGFib3V0IHRoaXM/
DQo+ID4NCj4gDQo+IEFsbCB0aGUgcXVlc3Rpb25zIHJhaXNlZCBiZWxvdyBoYXZlIGJlZW4gYW5z
d2VyZWQgaW4gbXkgZXhjaGFuZ2Ugd2l0aA0KPiBJdWxpYW5hLCBidXQgSSB3aWxsIGNvbXBsZW1l
bnQgaGVyZWluLg0KPiANCj4gPiBJIGZlZWwgdGhhdCB0aGUgTGludXgga2VybmVsIGRyaXZlciBz
aG91bGRuJ3QgZW5mb3JjZSB0aGUgcG9saWN5IG9mDQo+ID4gd2FpdGluZyBmb3IgYSByZXBseSBv
ciBjb25maXJtYXRpb24gdGhhdCB0aGUgZmlybXdhcmUgYm9vdGVkLg0KPiA+DQo+IA0KPiBUaGUg
cHJvdG9jb2wgZW5hY3RlZCBiZXR3ZWVuIGEgcmVtb3RlIHByb2Nlc3NvciBhbmQgdGhlIGhvc3Qg
aXMgdmVyeQ0KPiBwbGF0Zm9ybSBkZXBlbmRlbnQuICBUaGUgbmVlZCB0byB3YWl0IGZvciBhIHJl
cGx5IGluIHRoZSBJTVggRFNQIGRyaXZlcg0KPiBwcmVkYXRlcyBteSB0aW1lIGFzIG1haW50YWlu
ZXIgb2YgdGhpcyBzdWJzeXN0ZW0gYW5kIGFzIHN1Y2ggY2FuJ3QNCj4gY29tbWVudCBvbiB0aGUg
cmVhc29ucyBpdCB3YXMgaW50cm9kdWNlZC4gIFRoYXQgc2FpZCBJIGFtIHZlcnkgZGlzYXBwb2lu
dGVkDQo+IGJ5IHRoZSBjb21wbGV0ZSBzaWxlbmNlIGZyb20gUy5KIGFuZCB0aGUgcmVzdCBvZiB0
aGUgcGVvcGxlIG9uIHRoZSBsaW51eC1pbXgNCj4gbWFpbGluZyBsaXN0IHJlZ2FyZGluZyB0aGlz
IGlzc3VlLg0KDQpTb3JyeSBmb3Igc2lsZW5jZSwgYmVjYXVzZSBJIGRvbid0IGtub3cgd2hpY2gg
aXMgYmVzdCBzb2x1dGlvbi4NCg0KVGhlIHJlYXNvbiB3aHkgd2FpdCBmb3IgYSByZXBseSBpbiBJ
TVggRFNQIGRyaXZlciBpcyB0byBtYWtlIHN1cmUgdGhlIERTUA0KYm9vdCBzdWNjZXNzZnVsbHkg
YW5kIHRoZSBmaXJtd2FyZSBpcyBjb3JyZWN0LiANCg0KU28gZm9yIHRoaXMgaXNzdWUgbXkgZmly
c3QgaW5pdGlhbCBpbnRlbmQgaXMgdG8gYWRkIHRoZSByZXBseSBpbiB6ZXBoeXIgZmlybXdhcmUs
IA0KYmVjYXVzZSBhcyBhIGRyaXZlciBvd25lciBJIHdhbnQgdGhlIGRyaXZlciBjYW4gYmUgYXBw
bGllZCB0byBhbGwgdXNlIGNhc2UNCndpdGhvdXQgYW55IG1vZHVsZSBwYXJhbXMuIA0KDQpNeSBv
cGluaW9uIGhhcyBvYnZpb3VzIHBlcnNvbmFsIHRlbmRlbmN58J+Yig0KDQpCZXN0IHJlZ2FyZHMN
ClNoZW5naml1IFdhbmcNCg0KPiANCj4gPiBUaGUgTGludXgga2VybmVsIGRyaXZlciBzaG91bGQg
b2ZmZXIgYSBtZWNoYW5pc20gZm9yIGNoZWNraW5nIHRoaXMgYW5kDQo+ID4gdGhlIHBvbGljeSBz
aG91bGQgYmUgc2V0IGVpdGhlciBpbiB1c2Vyc3BhY2Ugb3IgdmlhIGR0cy4NCj4gPg0KPiANCj4g
VGhpcyBoYXMgYWxyZWFkeSBiZWVuIGRpc2N1c3NlZC4gIEFkYXB0aW5nIHRoZSBMaW51eCBrZXJu
ZWwgZHJpdmVyIGZvciBhbGwgdGhlDQo+IHByb3RvY29scyB0aGF0IGNhbiBiZSBlbmFjdGVkIGJ5
IHJlbW90ZSBwcm9jZXNzb3JzIGRvZXNuJ3Qgc2NhbGUuICBUaGlzIGlzDQo+IHNvbWV0aGluZyB0
aGF0IG5lZWRzIHRvIGhhcHBlbiBpbiB0aGUgRlcgYW5kIEl1bGlhbmEncyBhcHByb2FjaCBpbiBb
MV0gaXMNCj4gYXBwcm9wcmlhdGUuDQo+IA0KPiBJIHRoaW5rIHRoZSBwdXNoYmFjayBpcyBjYXVz
ZWQgYnkgYSBsYWNrIG9mIHVuZGVyc3RhbmRpbmcgb2YgdGhlIHByb2JsZW0gYnkNCj4gdGhlIG1h
aW50YWluZXJzLg0KPiANCj4gWzFdLg0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWINCj4gLmNvbSUyRnplcGh5
cnByb2plY3QtDQo+IHJ0b3MlMkZ6ZXBoeXIlMkZwdWxsJTJGNjE3MDkmZGF0YT0wNSU3QzAxJTdD
c2hlbmdqaXUud2FuZyU0MG54cC5jDQo+IG9tJTdDZmJiOWZjMDQzMTQ4NGMxMTJiNDAwOGRiYTNm
NDE4ZGElN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OQ0KPiBjNWMzMDE2MzUlN0MwJTdDMCU3QzYz
ODI4NDA0MTAwOTIyOTMxMiU3Q1Vua25vd24lN0NUV0ZwYkdacw0KPiBiM2Q4ZXlKV0lqb2lNQzR3
TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4NCj4gMCUz
RCU3QzMwMDAlN0MlN0MlN0Mmc2RhdGE9MzdUM3JKYXQwZUNvd3hxM2VrTSUyQnNFUGRpWTVKa2Mx
WnINCj4gVmdqa2hBNjZ5dyUzRCZyZXNlcnZlZD0wDQo+IA0KPiA+IEZpcnN0IG9wdGlvbiB3b3Vs
ZCBiZSB0byBoYXZlIGFuIGlvY3RsIGJ1dCB3ZSBuZWVkIHRvIGFsc28gbWlycm9yIHRoaXMNCj4g
PiBpbiB0aGUgc3lzZnMgaW50ZXJmYWNlLiBTZWNvbmQgb3B0aW9uIHdvdWxkIGJlIHRvIGhhdmUg
YSBwcm9wZXJ0eSBpbg0KPiA+IHRoZSBkdHMuDQo+ID4NCj4gPiBXaGF0IGRvIHlvdSB0aGluaz8N
Cj4gPg0KPiA+IFdlIGFyZSB0cnlpbmcgdG8gZml4IHRoaXMgaW4gdGhlIGZpcm13YXJlIHNpZGU6
DQo+ID4NCj4gPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZnaXRoDQo+ID4gdWIuY29tJTJGemVwaHlycHJvamVjdC0NCj4g
cnRvcyUyRnplcGh5ciUyRnB1bGwlMkY2MTcwOSZkYXRhPTA1JTdDMDElN0NzaGUNCj4gPg0KPiBu
Z2ppdS53YW5nJTQwbnhwLmNvbSU3Q2ZiYjlmYzA0MzE0ODRjMTEyYjQwMDhkYmEzZjQxOGRhJTdD
Njg2ZWExDQo+IGQzYmMyYg0KPiA+DQo+IDRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2
MzgyODQwNDEwMDkyMjkzMTIlN0NVbmtub3duJTcNCj4gQ1RXRnBiR1pzDQo+ID4NCj4gYjNkOGV5
SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJ
Nk1uDQo+IDAlM0QNCj4gPiAlN0MzMDAwJTdDJTdDJTdDJnNkYXRhPTM3VDNySmF0MGVDb3d4cTNl
a00lMkJzRVBkaVk1SmtjMVpyVmdqDQo+IGtoQTY2eXclMw0KPiA+IEQmcmVzZXJ2ZWQ9MA0KPiA+
DQo+ID4gYnV0IHdlIGFyZSBnZXR0aW5nIHNvbWUgc2V0YmFja3MgdGhlcmUgdG9vLg0KPiA+DQo+
ID4NCj4gPiBEYW5pZWwuDQo+ID4NCj4gPiBPbiBXZWQsIEp1bCAyNiwgMjAyMyBhdCAxMToyNuKA
r0FNIERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAZ21haWwuY29tPg0KPiB3cm90ZToNCj4g
PiA+DQo+ID4gPiBIZWxsbyBhbGwsDQo+ID4gPg0KPiA+ID4gSSB3YW50IHRvIHN0YXJ0IHRoaXMg
dGhyZWFkIGluIG9yZGVyIHRvIGNsYXJpZnkgd2hhdCBhc3N1bXB0aW9ucyBhDQo+ID4gPiByZW1v
dGVwcm9jIGRyaXZlciBpcyBhYmxlIHRvIG1ha2UgYWJvdXQgYSBmaXJtd2FyZSBsb2FkZWQgb24g
YQ0KPiA+ID4gcmVtb3RlIHByb2Nlc3Nvci4NCj4gPiA+DQo+ID4gPiBEaXNjdXNzaW9uIGlzIGdl
bmVyYXRlZCBieSB0aGlzIHRocmVhZDoNCj4gPiA+DQo+ID4gPiBbMV0NCj4gPiA+DQo+IGh0dHBz
Oi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRnd3DQo+ID4gPg0KPiB3LnNwaW5pY3MubmV0JTJGbGlzdHMlMkZrZXJuZWwlMkZtc2c0ODU3
NzMzLmh0bWwmZGF0YT0wNSU3QzAxJTdDc2hlDQo+IG4NCj4gPiA+DQo+IGdqaXUud2FuZyU0MG54
cC5jb20lN0NmYmI5ZmMwNDMxNDg0YzExMmI0MDA4ZGJhM2Y0MThkYSU3QzY4NmVhMWQNCj4gM2Jj
Mg0KPiA+ID4NCj4gYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzgyODQwNDEwMDky
MjkzMTIlN0NVbmtub3duJQ0KPiA3Q1RXRnBiDQo+ID4gPg0KPiBHWnNiM2Q4ZXlKV0lqb2lNQzR3
TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2DQo+IE0NCj4g
PiA+DQo+IG4wJTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT1WJTJGc2RsZkZVdGNubVlQU1hQS01X
dEw3dkxlWiUyRg0KPiAzQU5qSGVaaQ0KPiA+ID4gdWlwTGVLNCUzRCZyZXNlcnZlZD0wDQo+ID4g
Pg0KPiA+ID4gaW14X2RzcF9ycHJvYyBkcml2ZXIgYXNzdW1lcyB0aGF0IHRoZSByZW1vdGUgZmly
bXdhcmUgd2lsbCBzZW5kIGENCj4gPiA+IG5vdGlmaWNhdGlvbiBvbmNlIGl0IGhhcyBib290ZWQg
dXAgYW5kIHRoaXMgaXMgdGhlIGRlZmF1bHQgYmVoYXZpb3IuDQo+ID4gPg0KPiA+ID4gVGhpcyBk
b2Vzbid0IHdvcmsgd2VsbCB3aXRoIFplcGh5ciBzYW1wbGVzIHdoaWNoIGRvIG5vdCBzZW5kIHN1
Y2gNCj4gbm90aWZpY2F0aW9uIQ0KPiA+ID4NCj4gPiA+IEkgd2FudCB0byBnZXQgYW4gYWdyZWVt
ZW50IGZvciB0aGUgZm9sbG93aW5nIHF1ZXN0aW9uczoNCj4gPiA+DQo+ID4gPiAxKSBXaGF0IHNo
b3VsZCBiZSB0aGUgZGVmYXVsdCBiZWhhdmlvciBvZiBhIHJlbW90ZSBwcm9jIGRyaXZlcj8NCj4g
PiA+DQo+ID4gPiBJbiBteSBvcGluaW9uIGl0IHNob3VsZCBub3QgbWFrZSBhbnkgYXNzdW1wdGlv
biBhYm91dCB0aGUgcmVtb3RlIHBhcnQuDQo+ID4gPiBUaHVzIGJ5IGRlZmF1bHQgdGhlIGRyaXZl
ciBzaG91bGQgbm90IHdhaXQgZm9yIGFueSBtZXNzYWdlIQ0KPiA+ID4NCj4gPiA+IDIpIEhvdyBj
YW4gd2Ugc3VwcG9ydCB2YXJpb3VzICJwcm90b2NvbHMiIG9mIHN0YXJ0aW5nIHVwLiBFZyAod2Fp
dA0KPiA+ID4gZm9yIGZpcm13YXJlIC8gbm8gd2FpdCBmb3IgZmlybXdhcmUpLg0KPiA+ID4NCj4g
PiA+IEluIHBhdGNoIFsxXSBJdWxpYSBwcm9wb3NlZCB0byBhZGQgYSBmbGFnIHRoYXQgd2lsbCBz
ZWxlY3QgdGhlDQo+ID4gPiBjb3JyZWN0IGJlaGF2aW9yLiBBcyBwZXIgTWF0aGlldSdzIGNvbW1l
bnRzIHRoaXMgZG9lc24ndCBzY2FsZSB1cCwNCj4gPiA+IGZvciBuZXh0IGZsYWdzLg0KPiA+ID4N
Cj4gPiA+IEhvdyBjYW4gd2Ugc29sdmUgdGhpcz8gSW4gbXkgb3BpbmlvbiB1c2luZyBhIGtlcm5l
bCBtb2R1bGUgcGFyYW1ldGVyDQo+ID4gPiBPUiBhIGRldmljZSB0cmVlIHByb3BlcnR5IHNob3Vs
ZCBiZSBlbm91Z2guDQo+ID4gPg0KPiA+ID4gV2hhdCBkbyB5b3UgdGhpbms/DQo+ID4gPg0KPiA+
ID4gdGhhbmtzLA0KPiA+ID4gRGFuaWVsLg0K
