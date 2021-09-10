Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7D7C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 08:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B18360FC2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 08:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhIJI7Q (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 04:59:16 -0400
Received: from mail-vi1eur05on2082.outbound.protection.outlook.com ([40.107.21.82]:43936
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231771AbhIJI7L (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 04:59:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXiY9a7yb//KjiSqlHhkBkjOwqS/lzZQXwKnS1GDhjCAxF//u2lLjWZnxlHWJa589xjN2G6HlpicK2fe1fwyoAongUnOsFong/HF+C+3d1PHFvDgs1cPJh4AP0diC0ez2Jv6V0vqGV3qN5eJePYXza2Xc/sXsPMnbvT4MsQ8KCy8/LyIR7MEfYN7BkBqRtVUuch+ZwOq8bnJmqK9Rm98DV5+eyoDh4uIX82XfdS+lTgpfS81Dx+1WAH/MPmEwTVwgkTPX/CjhZlY92rc7N+0uX0oF7oJ9/P/wg6gaTUFdWOwb9CbQAPBg4bKMs3cerkaG2g806pega1tjm4R35CHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mlN7y+QRqtWW3PH4bOSTtKpVqMvQ8taervytXUPD2is=;
 b=cOc14Wk0mq1/M0XEvgj+Kzc9a3f4wsF7/bhz48vUD+bkfFjxqKgM78Wt4QxMBXG76drOxDQuKJxMpfyUzc4JsBFvnyOaDdfaY8AhjOJ/6JyRP7MyLdZZvISJlV2KORBrRo8mkEw5DR6z62iuHQehnL1H/TVWQ8tPgze1s81qK60d3XNNvxb12/51hiiDInv4OmCezOO+jqBvQE1Q0TV1G0VfllPI3l81SuOIl98emj71rr3i1walmWJcFCFPpZb2XUloh+FAhvs7vL0vjgPs04y/xH5L7VoK1pmyLCZEJgJEHWjsjJ06m11PmKPNb1wJRyoY+poBKM6HgCVzMEsh7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlN7y+QRqtWW3PH4bOSTtKpVqMvQ8taervytXUPD2is=;
 b=niPG3M/Y0JoXDVNEZiB080P21iW5BrdnC372ShU2KkrRS/CxQp6uU74A2Rsh1q7J9Ix+zIJO9XyCpeQ0JUFunAowFeXRIZ3fk1vGrGzR5veV9cPBylSaGVfV7TB6sU97NxMsSsoxEKkcgxz6Hb3uy/Nokwjkd5p5AiE/2+b+QQw=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6715.eurprd04.prod.outlook.com (2603:10a6:10:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 08:57:58 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:57:58 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "cleger@kalray.eu" <cleger@kalray.eu>
Subject: RE: [PATCH v3 5/5] remoteproc: imx_rproc: change to ioremap_wc for
 dram
Thread-Topic: [PATCH v3 5/5] remoteproc: imx_rproc: change to ioremap_wc for
 dram
Thread-Index: AQHXiaqd7cYLytShwkSrk1tiAg3a+atkrQxggABvtwCAOBJfAA==
Date:   Fri, 10 Sep 2021 08:57:58 +0000
Message-ID: <DB6PR0402MB27605430F6F18F28481B60E088D69@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
 <20210805033206.1295269-5-aisheng.dong@nxp.com>
 <AM5PR0402MB275630A505C7828931043F1988F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <20210805163632.GC3205691@p14s>
In-Reply-To: <20210805163632.GC3205691@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b94b1d4-89c8-44ae-8a06-08d97439165e
x-ms-traffictypediagnostic: DB8PR04MB6715:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6715061ECB6B7DC3D247324788D69@DB8PR04MB6715.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p1+EGVOu74WYWeHkJDK2vdeoDaD8LSa5ChDlhVakOZNXwn4K/sTs7D8bN0QXZiCJvN/RO1ULCH9IBzvpT4vyTuQfj4zhNcwAqgWyuJfE02ixrlhkheNCPHnNGS/B95SZJ1HyYO/gEifm08HnYU9n4dMNn7fLGktbf2QbJYB3RSa9lx14QUXtaWA947jGKSKWuSlIu/508ZC40geplx0YMLjygz562p9OoJRFKU4j2qbiVOBkVs1DeSCf41KyWy7WLzX8p/24SZ0vXOrdwicAtZxEVsKLaew1ArbMFFP3bBBPVVY2OpGVYqK/HI4eydj+b156Sqh66fkFrEio6Wu2unBfDIqMafO2Ht4ZkwIo7+yCVUhbAIa20skPL2lGCZEUgpBnLaqjXjGn8RFkiHqV/2RWefwKsS8PsLB89sz85lMPvdGOOlZTlrx5J5c3VWJ8aardTyrDE5ytqlAR66QyRZzUnhFqrxnoObGEWaVadnzBHare0Zn8KHepD3Y63uHeYnU2ZwqvzrtgPmYusOqUsS+dxP7VTne0hvhP0WiTCPY2+9WEFt2wOKELoisYKFUfswQb7FztczolpxKkPoEskIFh/8J5TJFqlDAZjTP7AhV9pAZOWRcv2RIAyy8TDTr4X/yS8GT7rxJp4pROetHkQvaTU/2laRQw+0fPdnTm0X7DIjtzv2dUfQvBqQUxSiq2y3U2k+Mog/fA9R2t+m62pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(6506007)(33656002)(53546011)(54906003)(76116006)(5660300002)(8936002)(316002)(38070700005)(55016002)(52536014)(66946007)(44832011)(186003)(8676002)(83380400001)(64756008)(66446008)(110136005)(71200400001)(9686003)(66476007)(66556008)(2906002)(38100700002)(122000001)(26005)(7696005)(86362001)(478600001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SlRTNXZGbDdTQ05FVkRUNjQzREtFeXRsQ2NxV2E0ZW9GRFRGQ3pwQXp1bldY?=
 =?gb2312?B?TFR6MU1sa1hJbUVhdjN5eUJnMDhWVU9yRUJrdGtTakRWTE4xUGkvdjREUFFk?=
 =?gb2312?B?eURQK1d5MXdBZzl2OEdNaTFwcllMdUkwZzErYjBOM1dzY3NZNk9RazlMQnRR?=
 =?gb2312?B?Wkl1NFZXaGhkYlNXTEc2UGtCSHBEUmp5SEJ5TlRodXZENFlYbHk1dGZjL3Zr?=
 =?gb2312?B?cC90L1VhVFJ2VHZteitqVGVOQjVxaE5lbUdjOGxTSVBuSm8raWQ3eGtMTFp4?=
 =?gb2312?B?TGZFaDlySXVvWWhFZTBGdjBJNmhTM29FYzRzVjhRRVY4bHhVVFRIRDBXbmhJ?=
 =?gb2312?B?cU0xUXFDQW9MTjVjU1RLUHZXb0M4WCsyRG56RUk0ZHRHZGo1ek5pakFpVjNl?=
 =?gb2312?B?elBOUG40YXJaTFZ1cllzeTVaMkZrbUF1aW9MRklvdjdLSEhzZWxDamVHVzA0?=
 =?gb2312?B?UG1nY2JoWVZzaFpIMlJvZ0lBclFreUxzeXExaFB2MG1UaGx4Tlp5eDlvSExQ?=
 =?gb2312?B?eUNTdlJDTEU5RFBIME1xU0dQeWZNTmZtTm55bWdKdm8yS052M1NNTjFvYWJ6?=
 =?gb2312?B?S05IeVpSVVlpREo2ZSswR1VuTitDUW55VVJCN3JLRE4wbDJwZWt1SHZ1Wk1l?=
 =?gb2312?B?US9RVytxeENqSmpjZlMxMkRVSVpkMHNhWFlZVUVidENMdEF0cHM3U25lS1VH?=
 =?gb2312?B?VzArS2haLyt5Zmd1QzJwZTNNMlI4dWFFTHhzZHhjM0J4dmkrY3NOUE1hMXdD?=
 =?gb2312?B?VTJVMXRIb3lMM3c5OVZ3OVdpckF4bDBlN0dJUGpDRlBWZDRoZmlSUERMcjhR?=
 =?gb2312?B?Y1ZMdVBtRHc3U0JMQmVwd2djSmZkYmtjNlE4eW9FVnVIUGt4VmlaVThxWTVv?=
 =?gb2312?B?RVNtWi9BR3J2Mm0rNERUbVYxS2xYVzEzRGJ0MExJWFgybjMwRjdIaElYSmFS?=
 =?gb2312?B?ZzhBQVdJcDdTbU43V05TZWpjcGUvQTdsTlhKand5QXNMaTYrTW42QitFK2pO?=
 =?gb2312?B?ZUFmaHIrb0lxS3lYQUduSnMvbWZVM0E5bUtSWnBxRHhla2ZZY0RiOGlSenp3?=
 =?gb2312?B?RGlEdDNnTlI3bERVR1JWNEdianZua3dINit6QWFMbUF1MWhBenRFZmt4UDQz?=
 =?gb2312?B?VGhjamIyd0hENG0vMm44S0ZuUWdueVZjZU1HRFZNS1RYeDZtQXhDd0g2N2hH?=
 =?gb2312?B?Y2tlT2x5OW90ait4b3RrelhYQTRtRmR4bkI5KzRHRFg1c1IwZnVvc0pEN0RG?=
 =?gb2312?B?aFlVbFZCdXJBV280akpMc05raW5EVkdWTUFjQzcwZngxSzE1WmIwNUg0MkJS?=
 =?gb2312?B?UGZmMlJzMlVMRjdTRHZCbXdseElUejhCNUJCYTdUSDhHcDh1WHV5ODkrNSsz?=
 =?gb2312?B?eEFlSUVyczJFaHFhbjN5MjA0cG01L0VudE1PdnhFc1duWkhxTVNHTjJFNkhi?=
 =?gb2312?B?a2w3OXBpdTh4V3J6di81Ymhyc2xkb3BEenpEaDlLS3REeHRXTTBOald2WTIx?=
 =?gb2312?B?TlFHanVPNHJwRytSTlhNcEgvMEF0QkF1b2ZyNkxOT3VPM3FtMEdFTHBta2Mw?=
 =?gb2312?B?dER1eFNlL2x2UUx3WEdXbTNkeWk0bXhVM3cwY0t3YjE3bDdOcFFzVDE1S1BC?=
 =?gb2312?B?d0xSemlFalM3Sm9WVHJlTWc1cW5nbkl5T3E3NDE2Zm5RSlFmZWxXZEZzbk1E?=
 =?gb2312?B?WU5iYWNNc3M1dm93SXc1WnFwNDlmUmg1VVRYRkNkM2xrdlkzS0pBdklQK1Iy?=
 =?gb2312?Q?qZ/a6MclvzL5nzCGuLl+xcjlpcK7AI22WKaKhNR?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b94b1d4-89c8-44ae-8a06-08d97439165e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 08:57:58.5378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ioEHIC/lC2rBeQXXS8BX4ZVWTtsULS+RcUb9SHLmzkejR0EImAwsM8+1O13QyHpTHf/ijAwwBqg1ek4CVAWWDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6715
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IFBvaXJpZXIgW21h
aWx0bzptYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZ10NCj4gU2VudDogMjAyMcTqONTCNsjVIDA6
MzcNCj4gVG86IFBlbmcgRmFuIChPU1MpIDxwZW5nLmZhbkBvc3MubnhwLmNvbT4NCj4gQ2M6IEFp
c2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+Ow0KPiBsaW51eC1yZW1vdGVwcm9jQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBv
aGFkQHdpemVyeS5jb207IGRvbmdhczg2QGdtYWlsLmNvbTsgYmpvcm4uYW5kZXJzc29uQGxpbmFy
by5vcmc7DQo+IGNsZWdlckBrYWxyYXkuZXUNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1LzVd
IHJlbW90ZXByb2M6IGlteF9ycHJvYzogY2hhbmdlIHRvIGlvcmVtYXBfd2MNCj4gZm9yIGRyYW0N
Cj4gDQo+IE9uIFRodSwgQXVnIDA1LCAyMDIxIGF0IDA5OjU3OjEwQU0gKzAwMDAsIFBlbmcgRmFu
IChPU1MpIHdyb3RlOg0KPiA+ID4gU3ViamVjdDogW1BBVENIIHYzIDUvNV0gcmVtb3RlcHJvYzog
aW14X3Jwcm9jOiBjaGFuZ2UgdG8gaW9yZW1hcF93Yw0KPiA+ID4gZm9yIGRyYW0NCj4gPiA+DQo+
ID4gPiBEUkFNIGlzIG5vdCBpbyBtZW1vcnksIHNvIGNoYW5nZWQgdG8gaW9yZW1hcF93Yy4gVGhp
cyBpcyBhbHNvDQo+ID4gPiBhbGlnbmVkIHdpdGggY29yZSBpbyBhY2Nlc3Nvcmllcy4gZS5nLiBt
ZW1jcHkvbWVtc2V0IGFuZCBjcHUgZGlyZWN0DQo+IGFjY2Vzcy4NCj4gPiA+DQo+ID4gPiBDYzog
Qmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4NCj4gPiA+IENjOiBN
YXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPg0KPiA+ID4gQ2M6IFBl
bmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRG9uZyBBaXNo
ZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBQZW5nIEZh
biA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gPg0KPiANCj4gRGlkIHlvdSB0ZXN0IHRoaXMgb25lIGFz
IHdlbGw/DQoNClllcywgVGVzdGVkLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCg0K
SSdsbCB0YWtlIHRoZSBwYWNoc2V0LCByZXNwaW4gdGhlIHRhZ3MgYW5kIHNlbmQgYSB2NC4NCg0K
VGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gPiA+IC0tLQ0KPiA+ID4gdjItPnYzOg0KPiA+ID4gICog
cGF0Y2ggY29udGVudCB1bmNoYW5nZWQuDQo+ID4gPiAgICBPbmx5IGRyb3AgdGhlIHdyb25nIHRh
ZyBpbiB2Mg0KPiA+ID4gICAgVGVzdGVkIG9uIE1YOE1RIGFuZCBNWDhNUCwgTVg3VUxQLg0KPiA+
ID4gdjEtPnYyOg0KPiA+ID4gICogbmV3IHBhdGNoDQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJz
L3JlbW90ZXByb2MvaW14X3Jwcm9jLmMgfCAyICstDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYw0KPiA+ID4gYi9kcml2ZXJzL3JlbW90ZXByb2Mv
aW14X3Jwcm9jLmMgaW5kZXggZmY2MjA2ODhmYWQ5Li40YWU0MTZiYTUwODANCj4gPiA+IDEwMDY0
NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMNCj4gPiA+IEBAIC01OTcsNyArNTk3LDcg
QEAgc3RhdGljIGludCBpbXhfcnByb2NfYWRkcl9pbml0KHN0cnVjdCBpbXhfcnByb2MNCj4gKnBy
aXYsDQo+ID4gPiAgCQkJYnJlYWs7DQo+ID4gPg0KPiA+ID4gIAkJLyogTm90IHVzZSByZXNvdXJj
ZSB2ZXJzaW9uLCBiZWNhdXNlIHdlIG1pZ2h0IHNoYXJlIHJlZ2lvbiAqLw0KPiA+ID4gLQkJcHJp
di0+bWVtW2JdLmNwdV9hZGRyID0gZGV2bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHJlcy5zdGFydCwN
Cj4gPiA+IHJlc291cmNlX3NpemUoJnJlcykpOw0KPiA+ID4gKwkJcHJpdi0+bWVtW2JdLmNwdV9h
ZGRyID0gZGV2bV9pb3JlbWFwX3djKCZwZGV2LT5kZXYsDQo+ID4gPiByZXMuc3RhcnQsDQo+ID4g
PiArcmVzb3VyY2Vfc2l6ZSgmcmVzKSk7DQo+ID4gPiAgCQlpZiAoIXByaXYtPm1lbVtiXS5jcHVf
YWRkcikgew0KPiA+ID4gIAkJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlbWFwICVwclxuIiwg
JnJlcyk7DQo+ID4gPiAgCQkJcmV0dXJuIC1FTk9NRU07DQo+ID4gPiAtLQ0KPiA+ID4gMi4yNS4x
DQo+ID4NCg==
