Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F69C433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Apr 2021 23:28:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 828EE613A9
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Apr 2021 23:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhDWX2m (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 23 Apr 2021 19:28:42 -0400
Received: from mail-eopbgr50080.outbound.protection.outlook.com ([40.107.5.80]:46109
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229520AbhDWX2l (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 23 Apr 2021 19:28:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieICkbPqh55/V+yo73KW+kVEYlrbYB/Y7Geqin0YgQCo94SShnMf16L1dzzRaRp6AnuQsXBwxVb/tDPMTqQDG1xMw1nbvQNqf6g8W7VMAHClyE6Y5Yk6WtnGt8Wb6s/1d6itk3x15IPV1ErcDNIUX+UoJ3120REw06Egn8CXS+ZW/u24KIkkjA7gLrYa2GgLuO7YTd3AcgtllE+4p41i0cBc9OQ4vOVAIPRuBtSvtsdj9c9NtRW7Y+H/tDm9bntTGnM5WJjuYCsTT9M+iUtZALMu9nv1kSaouRu2u3BGRX2Ba9cIZhbIuISdPICtU9oyRm5ZmZcfgWS9LF0Lae1jTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlXNq31Qq0SdgJSD92Hybqx0NSiS7FKFXd+IFfwrj5s=;
 b=IphuFNB1xJp7MS8T56o3Rl0zFQy8Ug/s0gOqMTDOHmIMIRpLdRC+7vnAWK+BH/Fsfru0+kHTtU5lTPOFwgualup4abLZys5Z8ghaPBUu1RUYFABHmqg8e3RyMsvYHOmQZ5Cmk82JPgzIKQkAkKgKwI1etip7/sQbCGDhcFqjLXfvTkyEC3LWumaVUWKot0a0reMJnhFNnYxvqlqvpj/yjlekRyJruDXNlWXbk5/4mmaXvUUCGxPeUvw1KKgteozKtb21H9pcddOtV94npwV58QLdzWnNvnCCywm+8uisOwxMqR8e30z7dvyFRi1HIrvvOcT78kzm58k7aNEkF9NAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlXNq31Qq0SdgJSD92Hybqx0NSiS7FKFXd+IFfwrj5s=;
 b=XeWT9yTiPV57G9oh6iX2o49WF0ix7j4mIDngN2Y4LZz4+0Xobwtd6ZufO2tAPqtkWdu4p/oExvsNbMCOaG2mqB9Z6NkMCIcdr+fDqQj/qW86XJUSQfFftnvOyKzaJRWRutNnfVcbknFbLSui8n37KNsEgfypHgZUe/Sy5U+muWI=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5081.eurprd04.prod.outlook.com (2603:10a6:10:23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 23:28:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.026; Fri, 23 Apr 2021
 23:28:01 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V5 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Thread-Topic: [PATCH V5 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Thread-Index: AQHXNlcHJ8Q3g7yLQEORmdDszDNiVarAxDgAgACGXzCAAOivAIAAjmMQ
Date:   Fri, 23 Apr 2021 23:28:00 +0000
Message-ID: <DB6PR0402MB2760EA88942E5549BA9CC4B588459@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
 <20210422165634.GD1256950@xps15>
 <DB6PR0402MB2760E471A0391FF8A31980BA88459@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CANLsYkwoS+3qYq=FHRLMjrJSr5cj_PiHaU+a+M17C+8-VJ+b9g@mail.gmail.com>
In-Reply-To: <CANLsYkwoS+3qYq=FHRLMjrJSr5cj_PiHaU+a+M17C+8-VJ+b9g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8558bd92-234a-4037-0b7c-08d906af6f91
x-ms-traffictypediagnostic: DB7PR04MB5081:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB50814E98CEB2B9A5EF7E04C988459@DB7PR04MB5081.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: npOyUgFvGAkBATB9cvenCB128H//Z54WT+Dfd5mVscyvTHkLNTI7a1AnqthqdDACUJazu8SySvnbxtpRTIdav1rN2AZz8QurUIO46QEP2JKjE+fQWchDXQEfcD9LW7iB0PP5SvrI8P95GTBVI+fHD4t9ktTODg+9clYf5x7OW7ZOrHCWdU+UT2uA4PPZATseAL9HEVL4jQRYjOoujSOK0kCFwbyD0D4owPsbk/3MPGBq2tTumLkZEG++VL481Lv6Xd/skWpC0hfM/d5KCxfk6IdSNQH3HfV2XZBs/BBQbxjeSjlZ8txeQEGhrThCnJ8RuZ49GOKGUpz372K53a+v6X8uoCUYjg1Y6NNeMqXkR9XYSonEak4HiRipOHkbL8DSz5Ln4tc5VsNrx2VzPu+oUoTqNVigfNK+ksPa1eSOiBY2gdjVTaKhVBofFKyFLgVXE5yVcir0XavrVNZPXcxbyusrLrrHTSbKCqi4tgzJShRmpDiBsS2GmPDrGEoU375pyOX+tPExBxk5F8CwNifxa7sdRJIsSQc6+THa8XfMUfHN2bLukaFc7K3ka04l7RIfeU52S2bRsTrIp8ibvAOxzVtB0efvr7gxxuxUjUVsHLk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(26005)(8676002)(44832011)(64756008)(66556008)(66476007)(76116006)(66946007)(8936002)(71200400001)(186003)(33656002)(55016002)(54906003)(316002)(66446008)(86362001)(9686003)(6916009)(52536014)(2906002)(5660300002)(478600001)(6506007)(4326008)(38100700002)(83380400001)(122000001)(7416002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eUxSK0pvZVl5dEFiTFo2VVdxOWdmQkdnM0l4Nm94cmlDSk9xdVVQN1QvTVFx?=
 =?utf-8?B?OFgvcUoyVmZvODlLcFErN0Nacy9mK1JVeFpTZnMxaFZTdnhTRmlXZE82cm42?=
 =?utf-8?B?aURidy9CMzdWYVc1Skl4cGgyRDRWL2U2RkFwSjVuMk9mNU1PM0R6cVdqM1da?=
 =?utf-8?B?em5SN1pvVFVhSTdoTTVGQ1RkNUdzU1lMV3k3RE5EMGVnQWY4eHB1dWRIcU5J?=
 =?utf-8?B?aFM5V2ZEY2s3VGFjNkhIUlBVdllDc0NDZXlxL2lUWTJxOFpJb2twQ3N4TUpt?=
 =?utf-8?B?enkvT0V0cHNEZGJpVXhaRWp0QUc2T3ZYSmFUVnhzVURCRUU4UVVmY0hqY0Iw?=
 =?utf-8?B?dFlQdDJTTndmWG1MWmszcnJBQi9lWktlVmVldnRMbjNtYXZOd295SkcwQlJ1?=
 =?utf-8?B?cGU0MHZUT1JjQlVOMGJzOHJ4R1lTa2NTUWozVXRrVlVzUVdZejFjODBrYktT?=
 =?utf-8?B?OEpZWHNrMVFOcDNNWGduZWs3K0dHRkVka3NUMldvU3Fsa250K3NybzVJd3FK?=
 =?utf-8?B?RjJ6N3pjb3k0S2M3eUlkaTVyU1UzaGF4emJ6R3oxWkJETHVFa2JUSGdreHY1?=
 =?utf-8?B?RnBOckFjclMxYzYybmpZNmc2RDZzbHRtZzJoMTVSMURiR1k5MVZFSGRpRDdC?=
 =?utf-8?B?YWl6ZWN2bUptd0dpbXVPR2tQRVRhbzVIK1BnMTN6dE1kaFpMMk5TMEFOVURo?=
 =?utf-8?B?eERsZEprbkt1ZnE5c2hPVkpYZzk5NE1rc1hoS1hvUm11K0U5L2pFVWJmWHVq?=
 =?utf-8?B?WjIrYXFDSjJnRDQ3WEhKZmJ1bW1xbzNlVXAra2JNRG04M01qQ0pKVTB6K3Fn?=
 =?utf-8?B?NzB4Unp2SDc1TWZLV0pUOVVMcDUwWW5RMHFaZTRENGx0cTdJS2ZGMDVLZEVk?=
 =?utf-8?B?VE9vMjY4TDJNN3JoZ0JlOWlQN2hRZVFmOE9RQUlyZXdaT2xpenZKblhFOU10?=
 =?utf-8?B?ZUlaeDBTVVcrb051LzdGeDU4cGFRSDFjM3E2VTJkMjhzcTNPeUpzOXlUOEZv?=
 =?utf-8?B?c3FkK1hXWkt2cTdTUzduZmdCODdoc3QzVGRzT3Y5ZDVwQnZGNVV5ZzVmQU9k?=
 =?utf-8?B?WXNyK3hYSTVMUzNTb0RlN1pscllHZEM5ck5TZVNaSTMzallzUHJ6YXJEdDFZ?=
 =?utf-8?B?NUtzY3hxSit2aXZSNEFqbXN3MHJEWXJUVk9tbVhmYi9sbDYvK2VGK2dUV0to?=
 =?utf-8?B?SDBUUWdvejBPTEZ2dmtCeUdHcHJXMkM0TDN1YnBOQTRZbUNudk0reWhCVGVT?=
 =?utf-8?B?cXJXMWNKU0U3SlBJeVNMaVBvakN2aXU2QWdTVjhhVmdDZkpMMTZONXBlbmV5?=
 =?utf-8?B?SlVyMUFXRUpBTjRnL0pPL3FhcnJ5WExESTVFQ1A5NXRQRkhyZHFkOWp2cnFK?=
 =?utf-8?B?MWFvRkVkb24rbXVoTkdWMSsvVWI5ZmxxbmxBT3FMaVF3QXZ1YTF2UFlKRndU?=
 =?utf-8?B?L1Nvd0ZHbmJFMGUrVUdHcnJ4MGtHZnd6ckZ4dVRoZGlGcG9ZVHpsSDRWcm5P?=
 =?utf-8?B?d3FoUlhKRnhMdEhJS0cxSHB4UlpDUXdqaVlZcnlGMTh3NHkrbUZ6LzF1dmJz?=
 =?utf-8?B?REJjYnFKRUZXdWlrVWhOTmRwMkphVHRFQXg5b29kUjl6dVFkR1U0SjZKbGkw?=
 =?utf-8?B?ekc2M2hFZVNrVElsK2w0WUFXQi93YUFSWjFDWW1NM3ZMZjRTa0dQU05KQ2Zn?=
 =?utf-8?B?OGJxcXJtTW9iNkp1MnBJMDA4Tmdxc2xvRENwNkVhMHh0QlpGbUlkVzV0NFJE?=
 =?utf-8?Q?CPV7S8hIkNebsu0wY7WJc6MQerRZY+hGLpoaKx4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8558bd92-234a-4037-0b7c-08d906af6f91
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 23:28:00.9316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r56bJhF+VKv09L1/RoMfKnAAZxRTnEpAbHN1d8PXIlIwIGbt82AW3v9qZ5GrKtUCWOb0hw5kNVj1xrXLW8fwaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5081
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIFY1IDAvOF0gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBzdXBw
b3J0DQo+IGkuTVg3VUxQLzhNTi84TVANCj4gDQo+IE9uIFRodSwgMjIgQXByIDIwMjEgYXQgMTk6
MDEsIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIE1hdGhp
ZXUsDQo+ID4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjUgMC84XSByZW1vdGVwcm9jOiBp
bXhfcnByb2M6IHN1cHBvcnQNCj4gPiA+IGkuTVg3VUxQLzhNTi84TVANCj4gPiA+DQo+ID4gPiBP
biBXZWQsIEFwciAyMSwgMjAyMSBhdCAxMDoyMDoxNEFNICswODAwLCBwZW5nLmZhbkBvc3Mubnhw
LmNvbQ0KPiB3cm90ZToNCj4gPiA+ID4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
DQo+ID4gPiA+DQo+ID4gPiA+IFY1Og0KPiA+ID4gPiAgQWRkIFItYiB0YWcNCj4gPiA+ID4gIE1v
dmUgdGhlIGNoYW5nZSBpbiBkZXRlY3QgbW9kZSBvZiBwYXRjaCA1IHRvIHBhdGNoIDcgUGVyDQo+
ID4gPiA+IE1hdGhpZXUncyBjb21tZW50cw0KPiA+ID4gPg0KPiA+ID4gPiBWNDoNCj4gPiA+ID4g
IFR5cG8gZml4DQo+ID4gPiA+ICBwYXRjaCA0OiB0YWtlIHN0YXRlIGFzIGEgY2hlY2sgY29uZGl0
aW9uICBwYXRjaCA1OiBtb3ZlIHJlZ21hcA0KPiA+ID4gPiBsb29rdXAvYXR0YWNoIHRvIGlteF9y
cHJvY19kZXRlY3RfbW9kZSAgcGF0Y2ggNjogYWRkDQo+ID4gPiA+IGlteF9ycHJvY19jbGtfZW5h
YmxlIGZvciBvcHRpb25hbCBjbGsgIHBhdGNoIDg6IHVzZSBzd2l0Y2gvY2FzZSBpbg0KPiA+ID4g
PiBpbXhfcnByb2NfZGV0ZWN0X21vZGUNCj4gPiA+ID4gVjM6DQo+ID4gPiA+ICBBZGQgQS1iIHRh
ZyBmb3IgUGF0Y2ggMS8yDQo+ID4gPiA+ICBGaXggdGhlIGNoZWNrcGF0Y2ggd2FybmluZyBmb3Ig
UGF0Y2ggNiw4DQo+ID4gPiA+DQo+ID4gPiA+IFYyOg0KPiA+ID4gPiAgUGF0Y2ggMS84LCB1c2Ug
ZnNsIGFzIHZlbmRvciwgdHlwbyBmaXggIEJlY2F1c2UgcGF0Y2hzZXQgWzFdIGhhcw0KPiA+ID4g
PiB2MiB2ZXJzaW9uLCBwYXRjaCA1LDYsNyw4IGFyZSBhZGFwdGVkIHRoYXQgIGNoYW5nZS4NCj4g
PiA+ID4NCj4gPiA+ID4gVGhpcyBwYXRjaHNldCBpcyB0byBzdXBwb3J0IGkuTVg3VUxQLzhNTi84
TVAsIGFsc28gaW5jbHVkZXMgYQ0KPiA+ID4gPiBwYXRjaCB0byBwYXJzZSBmc2wsYXV0by1ib290
DQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gT25lIG9mIHRoZSByZXF1ZXN0IEkgaGFkIGZyb20gdGhl
IGxhc3QgcmV2aXNpb24gd2FzIHRvIGV4cGxpY2l0bHkNCj4gPiA+IGxpc3Qgd2hhdCBvdGhlciBw
YXRjaHNldCB0aGlzIHdvcmsgZGVwZW5kcyBvbiBhbmQgd2hhdCBicmFuY2ggaXQgaXMNCj4gPiA+
IGJhc2VkIG9mLCBzb21ldGhpbmcgSSBjYW4ndCBmaW5kIGhlcmUuDQo+ID4NCj4gPiBTb3JyeSwg
dGhhdCBwYXRjaHNldCBoYXMgYmVlbiBtZXJnZWQsIHNvIEkgcmVtb3ZlIHRoYXQgbGluZS4NCj4g
PiBJIHNob3VsZCBtZW50aW9uIHRoYXQgdGhhdCBwYXRjaHNldCBoYXMgYmVlbiBtZXJnZWQgaW50
byBMaW51eC1uZXh0IHRyZWUuDQo+ID4NCj4gDQo+IEFuZCB3aGF0IGJyYW5jaCB0aGlzIHNldCBz
aG91bGQgYmUgYXBwbGllZCB0byBpcyBtaXNzaW5nLg0KDQpJIHRha2UgbGF0ZXN0IGxpbnV4LW5l
eHQvbWFzdGVyIGZvciBteSB1cHN0cmVhbSBuZXcgZmVhdHVyZSB3b3JrLg0KDQo+IA0KPiA+ID4N
Cj4gPiA+IEFzIHN1Y2ggSSBhbSBkcm9wcGluZyB0aGlzIHNldCBhbmQgd29uJ3QgbG9vayBhdCBh
bm90aGVyIHJldmlzaW9uDQo+ID4gPiBiZWZvcmUgTWF5IDIybmQuDQo+ID4NCj4gPiBBaC4gSXMg
aXQganVzdCBiZWNhdXNlIHRoYXQgdGhlIGRlcGVuZGVuY3kgcGF0Y2hzZXQgbm90IGJlZW4gbWVu
dGlvbmVkDQo+ID4gb3IgeW91IGhhdmUgaXNzdWUgYXBwbHlpbmcgdGhlIHBhdGNoc2V0IHRoYXQg
ZGVsYXkgdGhlIHBhdGNoc2V0IGZvciBvbmUNCj4gbW9udGg/DQo+ID4NCj4gDQo+IEJvdGguDQoN
CkkgcmVwbGF5IG15IGZsb3c6DQpnaXQgZmV0Y2ggbGludXgtbmV4dA0KZ2l0IGNoZWNrb3V0IGxp
bnV4LW5leHQvbWFzdGVyIC1iIG1hc3Rlci1uZXh0LTQtMjQtMjAyMQ0KcHdjbGllbnQgbGlzdCAt
dyAiUGVuZyBGYW4gKE9TUykiIC1zIE5ldyB8IGdyZXAgVjUgfCBhd2sgJ3twcmludCAkMX0nIHwg
eGFyZ3MgLUkge30gcHdjbGllbnQgZ2l0LWFtIHt9DQoNCkl0IGNvdWxkIHN1Y2Nlc3NmdWxseSBh
cHBseSB0aGUgcGF0Y2hzZXQuDQpBcHBseWluZyBwYXRjaCAjMTIyMTUyOTEgdXNpbmcgJ2dpdCBh
bScNCkRlc2NyaXB0aW9uOiBbVjUsMS84XSBkdC1iaW5kaW5nczogcmVtb3RlcHJvYzogaW14X3Jw
cm9jOiBhZGQgZnNsLGF1dG8tYm9vdCBwcm9wZXJ0eQ0KQXBwbHlpbmc6IGR0LWJpbmRpbmdzOiBy
ZW1vdGVwcm9jOiBpbXhfcnByb2M6IGFkZCBmc2wsYXV0by1ib290IHByb3BlcnR5DQpBcHBseWlu
ZyBwYXRjaCAjMTIyMTUyOTMgdXNpbmcgJ2dpdCBhbScNCkRlc2NyaXB0aW9uOiBbVjUsMi84XSBk
dC1iaW5kaW5nczogcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBhZGQgaS5NWDdVTFAgc3VwcG9ydA0K
QXBwbHlpbmc6IGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBpbXhfcnByb2M6IGFkZCBpLk1YN1VM
UCBzdXBwb3J0DQpBcHBseWluZyBwYXRjaCAjMTIyMTUyOTUgdXNpbmcgJ2dpdCBhbScNCkRlc2Ny
aXB0aW9uOiBbVjUsMy84XSBkdC1iaW5kaW5nczogcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBzdXBw
b3J0IGkuTVg4TU4vUA0KQXBwbHlpbmc6IGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBpbXhfcnBy
b2M6IHN1cHBvcnQgaS5NWDhNTi9QDQpBcHBseWluZyBwYXRjaCAjMTIyMTUyOTcgdXNpbmcgJ2dp
dCBhbScNCkRlc2NyaXB0aW9uOiBbVjUsNC84XSByZW1vdGVwcm9jOiBpbXhfcnByb2M6IHBhcnNl
IGZzbCxhdXRvLWJvb3QNCkFwcGx5aW5nOiByZW1vdGVwcm9jOiBpbXhfcnByb2M6IHBhcnNlIGZz
bCxhdXRvLWJvb3QNCkFwcGx5aW5nIHBhdGNoICMxMjIxNTI5OSB1c2luZyAnZ2l0IGFtJw0KRGVz
Y3JpcHRpb246IFtWNSw1LzhdIHJlbW90ZXByb2M6IGlteF9ycHJvYzogaW5pdGlhbCBzdXBwb3J0
IGZvciBtdXRpbHBsZSBzdGFydC9zdG9wIG1ldGhvZA0KQXBwbHlpbmc6IHJlbW90ZXByb2M6IGlt
eF9ycHJvYzogaW5pdGlhbCBzdXBwb3J0IGZvciBtdXRpbHBsZSBzdGFydC9zdG9wIG1ldGhvZA0K
QXBwbHlpbmcgcGF0Y2ggIzEyMjE1MzAxIHVzaW5nICdnaXQgYW0nDQpEZXNjcmlwdGlvbjogW1Y1
LDYvOF0gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBtYWtlIGNsayBvcHRpb25hbA0KQXBwbHlpbmc6
IHJlbW90ZXByb2M6IGlteF9ycHJvYzogbWFrZSBjbGsgb3B0aW9uYWwNCkFwcGx5aW5nIHBhdGNo
ICMxMjIxNTMwMyB1c2luZyAnZ2l0IGFtJw0KRGVzY3JpcHRpb246IFtWNSw3LzhdIHJlbW90ZXBy
b2M6IGlteF9ycHJvYzogc3VwcG9ydCBpLk1YN1VMUA0KQXBwbHlpbmc6IHJlbW90ZXByb2M6IGlt
eF9ycHJvYzogc3VwcG9ydCBpLk1YN1VMUA0KQXBwbHlpbmcgcGF0Y2ggIzEyMjE1MzA1IHVzaW5n
ICdnaXQgYW0nDQpEZXNjcmlwdGlvbjogW1Y1LDgvOF0gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBz
dXBwb3J0IGkuTVg4TU4vUA0KQXBwbHlpbmc6IHJlbW90ZXByb2M6IGlteF9ycHJvYzogc3VwcG9y
dCBpLk1YOE1OL1ANCg0KDQpJZiBhbnl0aGluZyB3cm9uZyBteSB3b3JrIGZsb3cgY29uZmxpY3Rz
IHdpdGggTGludXggcmVtb3RlcHJvYyBzdWJzeXN0ZW0gdXBzdHJlYW0gZmxvdywNCnBsZWFzZSBj
b3JyZWN0IG1lLCBhbmQgSSdsbCBmb2xsb3cuDQoNClRoYW5rcyBmb3IgeW91ciB0aW1lIGFuZCBw
YXRpZW5jZSBvbiByZXZpZXdpbmcgbXkgcGF0Y2hlcy4gU29ycnkgZm9yIHRoZSBpbmNvbnZpbmNl
DQp0aGF0IEkgYnJpbmcgaW4uDQoNCkFueXdheSBwbGVhc2Ugc2hhcmUgbWUgeW91ciBmbG93IHRv
IGFwcGx5IHBhdGNoZXMsIEkgd2lsbCB0cnkgdG8gYXZvaWQgdW5oYXBweSB0aGluZ3MNCmluIGZv
bGxvd2luZyBwYXRjaGVzLiANCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gPiBUaGFua3MsDQo+
ID4gUGVuZy4NCj4gPg0KPiA+ID4NCj4gPiA+ID4gUGVuZyBGYW4gKDgpOg0KPiA+ID4gPiAgIGR0
LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBpbXhfcnByb2M6IGFkZCBmc2wsYXV0by1ib290IHByb3Bl
cnR5DQo+ID4gPiA+ICAgZHQtYmluZGluZ3M6IHJlbW90ZXByb2M6IGlteF9ycHJvYzogYWRkIGku
TVg3VUxQIHN1cHBvcnQNCj4gPiA+ID4gICBkdC1iaW5kaW5nczogcmVtb3RlcHJvYzogaW14X3Jw
cm9jOiBzdXBwb3J0IGkuTVg4TU4vUA0KPiA+ID4gPiAgIHJlbW90ZXByb2M6IGlteF9ycHJvYzog
cGFyc2UgZnNsLGF1dG8tYm9vdA0KPiA+ID4gPiAgIHJlbW90ZXByb2M6IGlteF9ycHJvYzogaW5p
dGlhbCBzdXBwb3J0IGZvciBtdXRpbHBsZSBzdGFydC9zdG9wIG1ldGhvZA0KPiA+ID4gPiAgIHJl
bW90ZXByb2M6IGlteF9ycHJvYzogbWFrZSBjbGsgb3B0aW9uYWwNCj4gPiA+ID4gICByZW1vdGVw
cm9jOiBpbXhfcnByb2M6IHN1cHBvcnQgaS5NWDdVTFANCj4gPiA+ID4gICByZW1vdGVwcm9jOiBp
bXhfcnByb2M6IHN1cHBvcnQgaS5NWDhNTi9QDQo+ID4gPiA+DQo+ID4gPiA+ICAuLi4vYmluZGlu
Z3MvcmVtb3RlcHJvYy9mc2wsaW14LXJwcm9jLnlhbWwgICAgfCAgMTEgKy0NCj4gPiA+ID4gIGRy
aXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYyAgICAgICAgICAgICAgICB8IDE5Ng0KPiA+ID4g
KysrKysrKysrKysrKysrLS0tDQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE3MyBpbnNlcnRp
b25zKCspLCAzNCBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4z
MC4wDQo+ID4gPiA+DQo=
