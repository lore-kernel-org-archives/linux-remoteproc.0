Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FC8ECAAD8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Sep 2022 00:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiIVAzR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Sep 2022 20:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiIVAzQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Sep 2022 20:55:16 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0550583065
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 17:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTWhgqrJXOsCbEjo1+WrJppDEPoLkljMqD+x0H9iZNH1OAgSPe0twxfMroRT2DTg/DsTntjXVP3sNqbTq5COh3s2OaHzQPiKnQ3lPED8iSZ8RAnqESOdjYnGMqNPVIJdyPngcjVX83BWMXcshOrAYwNs/vs3iuIS8fNvkwbKNz0wYhTZ6KLG1P2dNXIsdKOaO7hETWP3EwWCP0AT4r0MthMODjVujoHX9GH9bxzPBX3wFPZUen+23cnc7bLh7W20LTE7xFSgGVeGIV3NwFb4sb0vHMwWwuGyAQVd+OEB1ZauMa857Go9zQC6DViRiOyga+mCJK2kRZ9JfJnGkFGyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvL999dXYTUFPXXWzfJuFJ/rOVtGLrTIVvtdlFVMWU8=;
 b=UtnBeYwuhaLIc8QS6NA4Cfx8hhHrUXdrNzmsceuxs18lxv14Xw4+uNGQeu69DGaX/mC0RceiMpwXxVsWWbtK9FvvzSCGAXfwIXU7qhEMv223ox4qJUdzcLmuBn2KwZYUoYGUItRow5BPnwiqoF9qNcKveYiX7N1/BtHwh98BRpscEIWxM3+jZIZDRzHY2AtVQ/Hhr4wpw/T5K/6KzyzGr8yusq3ToE5TeIrvCw7w1wNk3jYG1n2VYDyVROwt1lHvTIsKuEz2Ze1tpndV9KKPjXob665/g1NxolGIC9OnVuIc2lMuq1R0n1VyfNn8EHg2a4e6VKImwpmKr3tAhDPyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvL999dXYTUFPXXWzfJuFJ/rOVtGLrTIVvtdlFVMWU8=;
 b=VM11AoPJEQF/dmcXZLs++xhqZoCkAMICL9bPSnpo/AW7SZiPux2HtSl2gYzj+pyP5IMCku8J0sDvONVuFg0mvBEg0Qzl0DAqc2zfp2NpEvVouBtYPm5qY/EfVHhh+rsLAmA+KoJKnQtMRrePAqLHpU7WiO2QcVAgx7jfZDvMQ90=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBAPR04MB7398.eurprd04.prod.outlook.com (2603:10a6:10:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 00:55:12 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1eb:dcf:8fd7:867]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1eb:dcf:8fd7:867%5]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 00:55:12 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>
CC:     Kestrel seventyfour <kestrelseventyfour@gmail.com>,
        Maria Yu <quic_aiquny@quicinc.com>,
        Deepak Kumar Singh <quic_deesin@quicinc.com>
Subject: RE: [INFO] Remoteproc/RPMSG patchset review order for September 21st
 2022
Thread-Topic: [INFO] Remoteproc/RPMSG patchset review order for September 21st
 2022
Thread-Index: AQHYzeJDvtak9kjUrEOC0LdWH8F3363qnqSQ
Date:   Thu, 22 Sep 2022 00:55:12 +0000
Message-ID: <DU0PR04MB9417D52A272538C18E893FA7884E9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <CANLsYkzPfdHRHLSMzz=+b8Vdafr7oYdPqJozSNC2YfdyU1=V8g@mail.gmail.com>
In-Reply-To: <CANLsYkzPfdHRHLSMzz=+b8Vdafr7oYdPqJozSNC2YfdyU1=V8g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DBAPR04MB7398:EE_
x-ms-office365-filtering-correlation-id: b3926c9d-0a15-400e-6278-08da9c351b00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AqmqvjLqzmJ8IwAyhnSbggktPNdkz0N0reQ3s2dBLI/n0/gkpWkilEYGJE7R7uez74lbfMTEsZ+RNDb66dvFiqPHYSGlexWI69KrvWQZ4qzgWu2s/zW8Pis5j6s3ZyJafDgY1DdXrBTzEzkO6kZ8G4HAq8C0x+fMYxUR+KqqvuDbiA/0GcVe+jKo2qpvyLXdck2AxNaWkdhj6PPLLiOxSX4UlCpsgnyefjWTTeuk8c73q2dznVnlvm30IVzbIa3rthwmqDqnCYo9JhTNFmDmAxyqH54p2hAlqay/Rwe9d/vrj0vCkzhkxSEkPfJacCVGrsRDUsileF5KKymALAusE2WrU8KlnaixrqUd9QmC5R4CKlak36j0rFpauAOQs15S6KXThQQWkKZjAYqQEcrOWcVjcTuS2bUdVlRCgSvN8JmA5EaHZEDclGcaanI9RAuQk/NFCvGMgJWwY5EoZPx7fdjkATU+WZ3MQynEQd66vUMuA5GplKk1FLvpnK02cGtQ6FwEBE5y8Fxkw3Yrl+AmQ2h/po1Bfk7nFdzbfX7YS83YNd52z+/rI5V3ENmsHap/aRGkyms+pignshbYzFUstFNa5tTOJne+EbRdnqZSb+pSt9hCHlfwprkUNvIZnSl1WhSTWu0QUFURbmsiop/xnBjqpz6p4XPi0SnMFMC9KKkAB8YuXBuHdWuwEW2kZAh4qfpn5f1fQpkE2SyqlSn4ESfNZOIMlsGXokoVTdS05pyci2yXHWbx0uBMQbOf3n2rSq8jex1PQUbnIJOlktUy9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(55016003)(38070700005)(4744005)(2906002)(86362001)(33656002)(38100700002)(8936002)(52536014)(54906003)(44832011)(186003)(110136005)(41300700001)(5660300002)(66574015)(478600001)(71200400001)(9686003)(7696005)(26005)(6506007)(66556008)(316002)(66476007)(66946007)(4326008)(66446008)(64756008)(122000001)(76116006)(83380400001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUpzYjl5S0p6bjhES0FPa280L1FrVStBQTB4aGV1N29KUzZNZ2hpa1pFQWNM?=
 =?utf-8?B?RmtMbWVXd21WdHR2UUlqZkl1MW9LWUtjNEFZZStUMzdyRG5TOStPY3lZSFJT?=
 =?utf-8?B?V1E5MjBkSjRHdTc4K0l4dXlhTDhEQ3NLTkp6TjV4UThUa2ZjdlEyRW9wUGNQ?=
 =?utf-8?B?a2NXU2RFbnBuaDNyZG5TS2RwS3hjOGg5bElFbW1KL2tyaGRkWGVpQ1JlQ3Fj?=
 =?utf-8?B?UU5XcS9FV3B1NTMrM1VnVkh6YStoWEFOYytNM2NLQ3I1MDR2NHFtQ3Z5dU50?=
 =?utf-8?B?c0dnazluWlZkZVBLK0VTZjRsTUo1VStZTmU4a3RFeHJMUkhLeWdGdWppR3RF?=
 =?utf-8?B?aVJuek1qMWVDazNxSWVYQVBUWVlnMzJGaUFYWGJEaDE0N0wrNzRLenlkNzVR?=
 =?utf-8?B?aEo1dG1rVWpJNmVYKzlZcDRhekhoNmlIWEVKRHV6K1Z5dFhmRlZSOW5aQ2t5?=
 =?utf-8?B?WTlISzJOMXcvNFdtMVVwS2o5aWhPYlEzbzN4VTJNQ1RBR0gycE5MQVZuQWdh?=
 =?utf-8?B?eTRNdkY2ZmxON0tBaExzRWVTWHR2NUlkcmtqU2Q1Q0UxNnZjREFHOWdPaW0r?=
 =?utf-8?B?ZUVORGRJWE83dnFIZGZxMWNQdFZzNjcxc3kzMzZWdDlSaUFZYi81Y3BHUGts?=
 =?utf-8?B?c3JxU3JDdDYrVkErWlR6dzRXS3lSU3FOUzQvK2JYdDNNMzZ0ZVpLMTNrK3FX?=
 =?utf-8?B?SXFUMEozaG41RUVGT1FDek9NdkU2SUc5TGExVy90bzljOEJVRWU4VzZlNHZR?=
 =?utf-8?B?QjFGL3BtaGNPRS9vZ2pRUXZZVVVELzBvOVREU0VzY1NOb2R6QlM1YXZxdE9C?=
 =?utf-8?B?Z3ZXZFhVTU1EaHExRk1HbEdBMFFQcnQyeEJxTk00T2Ewb0tyeEUvTGE0SG5h?=
 =?utf-8?B?bG5hVk9SMzZJajdVc2c4eGdlTTNxQnBTSm05K1dGaDBVTHhiQlBTYmg3R3ZU?=
 =?utf-8?B?MTFPRk5yUUFrUUV0cHRDamVMYmxjVUJGc2tkUHA3bDdJaStSa2JOc1NGci9E?=
 =?utf-8?B?MU5td3lDZWdGOGxoZkliQ2xGWFZFUUZEcnZ4djU1bnJOMEZCQVNzdHJzUndz?=
 =?utf-8?B?d2ZKQzhRbUNZd05DdWpJT2lIdGJUU1NJWXdRQ0xOaTczYStYUW5LbTcybGo5?=
 =?utf-8?B?T28rSGpoTmJqUHgxVEdaTWdPSWdVQVA4SXVlS2pTRXpsS3pISCtaYVh2aGYy?=
 =?utf-8?B?SWtmNE1GejVmcnFZWkw0S3UramhiRUVlYjlsQlEwK0x2WHVnVUxFVXRaeGlS?=
 =?utf-8?B?MWtKeUI4aG0wSTZ3ZXZLc1hDaG9PVHpTV2lNMm9zSXYzcEI4ZmdsaWtMUWEz?=
 =?utf-8?B?Z1hJR2ZSQlRMYy9YNXZZL3ZwckpPZURrajhvSUFZcGJkVk9KZjhONVJuRk56?=
 =?utf-8?B?clc2VFpYZ0xmZW1oMzMxdWoyQytYSUUxTnRkU1NaZ1FFMk1iTVkrN1FQT2FV?=
 =?utf-8?B?UDExcG9VSXdYRzI5VHl1OWQ1UXlKdTR0OUJPbDRjVW0yVVZ4bG1XSnAxdHdj?=
 =?utf-8?B?SmszVHR2N0NvejJGdXVrdU9WVXJKZ0FINDZUbTZhN2NyUW13NFk2VkFUYUl1?=
 =?utf-8?B?cTlzckZQRkVKOFhCY1ljKzhodERzOCtvOUE0WnFEZUovUTNWcTJlZitSeU4w?=
 =?utf-8?B?SzdNWDRvakZNN0ExeW9RZnJxemsySHE0UHZPZnFtRUNYNHBXK05OQzNVeUZ4?=
 =?utf-8?B?MzFyWkhPbnRqN1lrY1RQWWhxQ0lnUFBrUVVnb24yeUZOM1BTbmtyRVlxeksv?=
 =?utf-8?B?ZFBkZytJWTJTY0prb2Y4UWJxYTh6RnluQkFsdE11MnNDdDF1dlFmcUg1YkZG?=
 =?utf-8?B?azRZb3Zodjdab2VncTB3cFRUdDJEWkNDWmRFaWFaSzRHeXVWeU0vOW53bGJF?=
 =?utf-8?B?OVdDQy9JRWY5QS9zdFJPN0p6TTdxYzd1dDA5UlZZZHB2Z25FUGxsd0c3Q1Bu?=
 =?utf-8?B?MEpqWlZrVDZydTh1YWFXMTJOWXY2d0kzSUdnL3N5dms4d1JZbkJBL2xaRzVB?=
 =?utf-8?B?bXZmL2JSdmpjWTF3TGtPTmtUWGd2M1RSTFg3K1MwYWlyTnhNWDBTUUhKaW1t?=
 =?utf-8?B?WmQxNWpxbjRJb1JnNFFOdjhJOXRrbDZ6TnhZOG9nTlY4RDJGU2VQY0FNVjcr?=
 =?utf-8?Q?3El0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3926c9d-0a15-400e-6278-08da9c351b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 00:55:12.6244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j/ix+Edi1Gw8qpSFNtl+/OGVgzXtFA7s8bRFqkn1DfBbRtUBfjMtQ9QcMEagChGQICu4BRyDqoiPOpTkbZA3QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7398
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGkgTWF0aGlldSwNCg0KPiBTdWJqZWN0OiBbSU5GT10gUmVtb3RlcHJvYy9SUE1TRyBwYXRjaHNl
dCByZXZpZXcgb3JkZXIgZm9yIFNlcHRlbWJlcg0KPiAyMXN0IDIwMjINCj4gDQo+IFtQQVRDSCBW
NyAwLzJdIHJlbW90ZXByb2M6IHN1cHBvcnQgc2VsZiByZWNvdmVyeSBbUEFUQ0ggdjRdIHJlbW90
ZXByb2M6DQo+IGNvcmU6IGRvIHBtIHJlbGF4IHdoZW4gaW4gUlBST0NfT0ZGTElORSBbUEFUQ0gg
VjUgMC82XSByZW1vdGVwcm9jOg0KPiBpbXhfcnByb2M6IHN1cHBvcnQgaS5NWDhRTS9RWFANCg0K
W1BBVENIIDAvMl0gcmVtb3RlcHJvYzogaW14OiBhZGQgc3RhcnQNCj4gdXAgZGVsYXkNCg0KUGxl
YXNlIGRyb3AgIltQQVRDSCAwLzJdIHJlbW90ZXByb2M6IGlteDogYWRkIHN0YXJ0IHVwIGRlbGF5
Ig0KSSBvdmVybG9va2VkIFJvYidzIGNvbW1lbnQgb24gdGhlIERULCB3aWxsIHN0YXJ0IHYyIGxh
dGVyIGFmdGVyDQp0aGUgaS5NWDhRTS9RWFAgc3VwcG9ydCBkb25lLg0KDQpUaGFua3MsDQpQZW5n
Lg0KDQogW1BBVENIIHY1IDAvM10gQWRkIHN1cHBvcnQgZm9yIFdBU1AgU29DIG9uIEFWTSByb3V0
ZXIgYm9hcmRzDQo+IFtQQVRDSCBWMyAwLzNdIHJwbXNnIHNpZ25hbGluZy9mbG93Y29udHJvbCBw
YXRjaGVzIChvbiBob2xkKQ0K
