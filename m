Return-Path: <SRS0=zBsu=DQ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD621C433DF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Oct 2020 02:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79D2022258
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Oct 2020 02:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XBRgyffU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbgJICCv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Oct 2020 22:02:51 -0400
Received: from mail-db8eur05on2061.outbound.protection.outlook.com ([40.107.20.61]:58395
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729908AbgJICCv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Oct 2020 22:02:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcFKR0+Xqc7i5mJYC5ZYMOYceaVjKg2q4NI4kCrumMqWVwpasYciKvELNjeopIi8ZVThWqtVIj3tY8QuymwOQqeiCIT/Yi+5O/vzGBmpvMOTnf7/PhdXUWCDPrCqASfjLLtPKij9cfJqlFMcLBL1bN/cojLLWfWQ1lH3OV4M8kCntBzY9AB7oEZ5nyuuxldkHv37rdVCPaG6qdKe2KA5zGLdz8Dyb7XDN/6mgB009+vHVW4jj2Mbsuu9en+rUt9Va4lF5PA6s+UhE2FVK9MiwHdEBsNPOppAqFuWnrqlNzAP5EiOfOLg5uAuh+I3cP9QH8OEaeFMZrtEDjx5XZCJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6somqzxDP/7kjZIziupnZQumfIcXhmdPOxkaKKlSBFQ=;
 b=lRo7iIZT/gP129LevWkkOwjgvp7o2NhdK/xago3q1zeVXXzvLGD0Alscb1Avi3peNtdhU51qxP4alDIOECATIQ4gWJhagbQ1I2UhaSIIOoFIxIM7ulb3ik1Y5RVoPSCKJuQw+R1e1x2h6zoxzhWhzDISV63FB5PiMGPHUmWBtsHucvrALdRkpv5tDAJoiF9TenfyYPE3tE94lTYGgYy8cshHxG1XQj+GIe45ySJzUVkQ7oxpSKLjFTeAfO3FyIHIQJiJ/nQOI1uJ7h6PqSjsJoo5WOn4Cho7mKRfABefv87qO6D0MZVp8S2EozkG9GJHW1gU4pKFRIunjE5l+PzDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6somqzxDP/7kjZIziupnZQumfIcXhmdPOxkaKKlSBFQ=;
 b=XBRgyffU3Pipf2w4JKxgkm1p1Iy7usvIdtRSRdlnJGrdvdYbB51xVhCHTkbkErUJGqBgQxJJ7PC3CX1hZ5Qbr26ebhhUtq5CljuLJ0SBFBKbbUnUpzmj3ecDiaG/TlYlE4Pokf0b30Lp+h6R2oCBeAkThC7nO9cU5ahf1uzIuUs=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 9 Oct
 2020 02:02:47 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.024; Fri, 9 Oct 2020
 02:02:47 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V2 0/7] remoteproc: imx_rproc: support iMX8MQ/M
Thread-Topic: [PATCH V2 0/7] remoteproc: imx_rproc: support iMX8MQ/M
Thread-Index: AQHWlJWVukYQqBZsrEmEkGtIBsfyNqmM8R8QgADnnACAAL4OAA==
Date:   Fri, 9 Oct 2020 02:02:47 +0000
Message-ID: <DB6PR0402MB2760AB16AC188C915C2271BC88080@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200927064131.24101-1-peng.fan@nxp.com>
 <DB6PR0402MB2760EA531095AADAA1B967D9880B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CANLsYkxXZdFdLYRY6kEj4Fa_LsR4TVfCxqtX=2_N7OEsgjgEXg@mail.gmail.com>
In-Reply-To: <CANLsYkxXZdFdLYRY6kEj4Fa_LsR4TVfCxqtX=2_N7OEsgjgEXg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 88470242-550f-4fc5-8d8b-08d86bf76b55
x-ms-traffictypediagnostic: DB6PR0402MB2760:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB276090BEC366D89F6F1A454688080@DB6PR0402MB2760.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q+NmldXSQnTZeZTR4difVK/bCe2yTM4x54v4pW7AqmiY0dWGjX3Pu9OoZAXXZU7+SjYqarHDgVTqIx1WbBei3+QyC9L4pWIqSsaE770KQLLOf7vbcJOqEvYvNda2Jn0gb4woC/22R6s4BHvQcwMmY7o/u5rSVB3aEJtMd1cyZ7nlop7s2z3bHdCB2GYWLvuilE5H8Lb86yxCJmbB8HL6oGK1xP9nrODofF6qSeUO1BztQi8qcd8gT1OO9N4TRIC4voFcGAQN5fI2kwVyoy5y6L1I+D4PZvjp+1TEwjjgIQ32m9MQsB9Fhps8oh1RO4Q39ZkCRI7P3ZG6eX9NCAtw7Ygx2M5KImAZtP6FO2zMlWa0N29uijjx7nR/6yQ6eJo3a827vnt0saHEEcnLbu0g8kFK+OMQkQob1RaT3AugRUF0dMCC5mhRlt8nuO61AQqX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(9686003)(33656002)(186003)(83080400001)(2906002)(316002)(83380400001)(54906003)(26005)(7696005)(86362001)(6506007)(55016002)(4326008)(6916009)(44832011)(45080400002)(71200400001)(8676002)(7416002)(478600001)(52536014)(5660300002)(8936002)(66476007)(66446008)(966005)(64756008)(66946007)(66556008)(76116006)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HUAGdHYg1cKiapfQDGJQVAdRDNvUXlS+JAF1EYj5EWtRFkfb1ecEDGcjRypSgvEH/FD2t4TEkiUiuingZR74Tcvq2q32PSNMggc/lIpDrO4QhUboP6xRc+dT9wH07fbVAyhXNdc23XfRcluqKvwAtzTlxSAvqtW9pYed6gzSFwsyILmSfgiNhieB+pi/ouFXEN0vbN7HyystToE3j/4UuAtqkro5W2QPUsks9qbAlaKcq4AgGscASiAvKPR9YBy2dFZNG2tMP+Up3zflQkJCAwcl/1wDGBRCPwfUKHqRtWtzTVUudPuP8gAlkHdlQtL+R2fYhtUw0JVFMlOZk3qu92UI+hhYzBO7MBxUuIdmFXMsbxg2rWlmX55fXftCQmlVqds5weikmKdBpIXaBIOQJwby7jusItQkw16dN8jq3SymOSaYV8LwkdvqpLYmq9SzULwNvYHLr1BJJEVhz8k+fcJr5OE2BziTeK+KnfmwksJd2no6jku+BkgqyzZwnWMDkWCBpWlJ5XUUHnYQajtGkdIG7hgg170e3OBQPhCe+0/V5Gbvj3oAn1nngcSofvYxEo6TOKBoUFgPvJHMs66ZQh4q4UeuOthx/HbWJ9MQMbV88dC43KV/Ua3Cl7XX6oXjV4GNxqMf2+WsK8g1ijhksQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88470242-550f-4fc5-8d8b-08d86bf76b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 02:02:47.4418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 739oHeK+AtYKfaUA9Ke5y84q/X4qWIphnBmjW4zU9yrDVxU/pOUB3VlAHDEakPx1P8cscoh5KYqINB6pTTq9Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2760
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDAvN10gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBzdXBw
b3J0IGlNWDhNUS9NDQo+IA0KPiBPbiBXZWQsIDcgT2N0IDIwMjAgYXQgMTg6NTIsIFBlbmcgRmFu
IDxwZW5nLmZhbkBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IE1hdGhpZXUsIE9sZWtzaWoNCj4g
Pg0KPiA+ID4gU3ViamVjdDogW1BBVENIIFYyIDAvN10gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBz
dXBwb3J0IGlNWDhNUS9NDQo+ID4NCj4gPiBEbyB5b3UgaGF2ZSB0aW1lIHRvIGdpdmUgYSBsb29r
IGF0IHRoaXMgcGF0Y2hzZXQ/DQo+IA0KPiBJIHdpbGwgcmV2aWV3IHlvdXIgcGF0Y2hzZXQgYWZ0
ZXIgeW91IGhhdmUgcmV2aWV3ZWQgbWluZVsxXS4NCg0KRmFpciBlbm91Z2g6KQ0KDQpJIG5vdCBm
b2xsb3cgdGhlIG1haWxpbmcgbGlzdCB0aWdodGx5LCB3aWxsIHJlYWQgeW91ciBwYXRjaHNldCBz
b29uLg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBbMV0uDQo+IGh0dHBzOi8vZXVyMDEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnBhdGNoDQo+
IHdvcmsua2VybmVsLm9yZyUyRnByb2plY3QlMkZsaW51eC1yZW1vdGVwcm9jJTJGbGlzdCUyRiUz
RnNlcmllcyUzRDMzDQo+IDkwNzkmYW1wO2RhdGE9MDIlN0MwMSU3Q3BlbmcuZmFuJTQwbnhwLmNv
bSU3QzdlZDM3NzFmYzYyNTQ5MDhjDQo+IDdlMzA4ZDg2Yjk4MWQ3YiU3QzY4NmVhMWQzYmMyYjRj
NmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0MNCj4gNjM3Mzc3NjQ4MzU2MjYzNzcxJmFtcDtz
ZGF0YT1QbzY3Zjd5cUx1b1RTWjZsY0FMS3FveHQwV3B3eGs2TVcNCj4gcU5pUHglMkIlMkJWWDgl
M0QmYW1wO3Jlc2VydmVkPTANCj4gDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gUGVuZy4NCj4gPg0K
PiA+ID4NCj4gPiA+IFYyOg0KPiA+ID4gIFJlYmFzZWQgb24gbGludXgtbmV4dA0KPiA+ID4gIERy
b3BwZWQgZWFybHkgYm9vdCBmZWF0dXJlIHRvIG1ha2UgcGF0Y2hzZXQgc2ltcGxlLg0KPiA+ID4g
IERyb3AgcnNjLWRhDQo+ID4gPg0KPiA+ID4gVjE6DQo+ID4gPg0KPiBodHRwczovL2V1cjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXRjaA0K
PiB3b3JrLmtlcm5lbC5vcmclMkZjb3ZlciUyRjExNjgyNDYxJTJGJmFtcDtkYXRhPTAyJTdDMDEl
N0NwZW5nLmZhDQo+IG4lNDBueHAuY29tJTdDN2VkMzc3MWZjNjI1NDkwOGM3ZTMwOGQ4NmI5ODFk
N2IlN0M2ODZlYTFkM2JjMmINCj4gNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzM3
NzY0ODM1NjI2Mzc3MSZhbXA7c2RhdGE9QUkNCj4gWFh6UmolMkY4bXYlMkJMTE9JQjF5SVFIYkRK
N215dCUyQk4zYkpZcnVuUEFMbXMlM0QmYW1wO3Jlc2Vydg0KPiBlZD0wDQo+ID4gPg0KPiA+ID4g
VGhpcyBwYXRjaHNldCBpcyB0byBzdXBwb3J0IGkuTVg4TVEvTSBjb3Byb2MuDQo+ID4gPiBUaGUg
ZWFybHkgYm9vdCBmZWF0dXJlIHdhcyBkcm9wcGVkIHRvIG1ha2UgdGhlIHBhdGNoc2V0IHNtYWxs
IGluIFYyLg0KPiA+ID4NCj4gPiA+IFNpbmNlIGkuTVggc3BlY2lmaWMgVENNIG1lbW9yeSByZXF1
aXJlbWVudCwgYWRkIGVsZiBwbGF0Zm9ybSBob29rLg0KPiA+ID4gU2V2ZXJhbCBwYXRjaGVzIGhh
dmUgZ290IHJldmlld2VkIGJ5IE9sZWtzaWogYW5kIE1hdGhpZXUgaW4gdjEuDQo+ID4gPg0KPiA+
ID4gUGVuZyBGYW4gKDcpOg0KPiA+ID4gICByZW1vdGVwcm9jOiBlbGY6IHN1cHBvcnQgcGxhdGZv
cm0gc3BlY2lmaWMgbWVtb3J5IGhvb2sNCj4gPiA+ICAgcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBh
ZGQgZWxmIG1lbW9yeSBob29rcw0KPiA+ID4gICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IGNvcnJl
Y3QgZXJyIG1lc3NhZ2UNCj4gPiA+ICAgcmVtb3RlcHJvYzogaW14X3Jwcm9jOiB1c2UgZGV2bV9p
b3JlbWFwDQo+ID4gPiAgIHJlbW90ZXByb2M6IGlteF9ycHJvYzogYWRkIGkuTVggc3BlY2lmaWMg
cGFyc2UgZncgaG9vaw0KPiA+ID4gICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IHN1cHBvcnQgaS5N
WDhNUS9NDQo+ID4gPiAgIHJlbW90ZXByb2M6IGlteF9wcm9jOiBlbmFibGUgdmlydGlvL21haWxi
b3gNCj4gPiA+DQo+ID4gPiAgZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jICAgICAgICAg
ICAgIHwgMjczDQo+ID4gPiArKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+ICBkcml2ZXJzL3Jl
bW90ZXByb2MvcmVtb3RlcHJvY19lbGZfbG9hZGVyLmMgfCAgMjAgKy0NCj4gPiA+ICBpbmNsdWRl
L2xpbnV4L3JlbW90ZXByb2MuaCAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiA+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgMjg3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+
ID4gLS0NCj4gPiA+IDIuMjguMA0KPiA+DQo=
