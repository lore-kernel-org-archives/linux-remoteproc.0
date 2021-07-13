Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EA7C07E9A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Jul 2021 02:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0373B610A7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Jul 2021 02:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbhGMCuf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 22:50:35 -0400
Received: from mail-db8eur05on2043.outbound.protection.outlook.com ([40.107.20.43]:38433
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230105AbhGMCuf (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 22:50:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtFetdpOPrLhXxkIN3Fpv22l5ixxq7mZBlzLzgS2K4tr5OMEtnhvc67BFxei+US1G72O+ziiTpVw6rx41eucnYT8GC7peHgqkMKjuWza50idsIsbnRSz1Qyx6QhazdvWpXDXJKqfbDuW30Ffz/D6S1RHF6aRffS8InfoWDMetHIbSorj/vp7R40sOO076mhw7ZaoKhS1JsgLpiB3kIYVmrIu8Yjr9HgI8aQVogXj1kVYPCALPUH+odFAAgrdMlMRaYNzEUu7hk/wtGtGri9tFcWxO7YAEfTwsyrv4L1RDcAMQsyh5NlL6pw7F9jL9CHFRSUCYJ/0TQUw2wQCx8TT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK7ih3zuox30tJBViFIji4TcwpKCwKUnNSAsXRpQ2wE=;
 b=dN9fhbQXnLR6KT/Yc+AiC3VlwAUc1Q3pelZlTZWaT/lz204qKT6Zg500PuxjU5jse/14j0EAffeiljurwDeoP+q7ZkoFXqF9pw33+Kqa2OAoxBVzzDBxN2i6I3YhEjOArHiD0FrdeppvZyGE60RsJlZsjN8fB7Y+gLSgpuYQxmCL6UNW5QBlSx5N/ZpmX8FDcecQNfBQINTCCO+XMGCSR8mY0mpM/vHKaHi/xhetrgI9KKzt+wSGOvwda0NyrocvTkGwEHSI8mnJ5pXh8SMkImJAJDxBNc17TqDsM7Gpx+67oapicWXimAt6m75M5fVMd3hJ8QqfokBB9U+i6G9vDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK7ih3zuox30tJBViFIji4TcwpKCwKUnNSAsXRpQ2wE=;
 b=ZkhxBh3MBqgeDlXHlyk6fvE0QwFFK4zhd/t1wSE0nufBhIYecVibSAYWLvODuPVRvn9LzmpVgXqBILr+zS54XOj3RLjP6qzCqtPKMiGyTXmLnsgrgU8nIvqeJQzygHIqSc374Hqa5bEZh/PlZEHIKzx1+B16fZnwRTuks6bH+/s=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8886.eurprd04.prod.outlook.com (2603:10a6:10:2e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 13 Jul
 2021 02:47:44 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 02:47:44 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 4/4] remoteproc: imx_rproc: fix rsc-table name
Thread-Topic: [PATCH 4/4] remoteproc: imx_rproc: fix rsc-table name
Thread-Index: AQHXcnKr5qSZyjkGn02ijU+hzf1TzKs/rROAgACOPEA=
Date:   Tue, 13 Jul 2021 02:47:44 +0000
Message-ID: <DB9PR04MB84772D8DAA30CF992F9076E180149@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
 <20210706142335.952858-4-aisheng.dong@nxp.com>
 <20210712180859.GC1779922@p14s>
In-Reply-To: <20210712180859.GC1779922@p14s>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bcc94aa-e62c-43cd-05d6-08d945a89768
x-ms-traffictypediagnostic: DU2PR04MB8886:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB888669B354E9AF1A3E2EC65380149@DU2PR04MB8886.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2zfu6JRcJKsOKU2o0y5/U1T0U4BvUnHmULiuUwEVzpBHRMHTXFnSPO6w4mUc7qRuKfViSl/Sx2dEbEC6IIavakn+dsCFCTOd3FYuYbQwII5ih0MsMY4T5/hC/dn1KJ+SHUM3A4pq2KXUuP89WAMkoqxAwMUGVW1/Qy1cik8+09WK+ygasCrIOZbaRRAtGTFJCbxMAtIN5czoHl08YRrvrc8iJXglJ3tTw1tTv1y3u9MU5cWhkUBWI15org4VVatkiYnAebLVkE8xTZjnkbxDup7NHBEmrScQ03gEpZAKWJSzLs/rB934Z5ivOkjTMQo5kt26dn/ykhoNSm7JCACvK0EmCiwFLfOd8QBUxFc5pxIupqXeQW43+c6l0Bi7T3cAe7sD4eyeHM3WHgr11MOJbvkbbiBu6JAyf+CrbpsH93qEUSeyB0lRYy8++tiSgm80x/sGyoPGwz2zKZkPDbWBhIQ45koAFlyfDRS7/FRgcC4sH9Oh4C8PIn2CWpMgPJkNHN32+rysKZNpbJ1Yv6yT/wBlvXqfqyLPwr9qQruRbvf0ng6QaVUzYwv+KS0heaXhwtKeFXIMaFm3x/GN5T+dQBd2prjclYqgbldoOk+NfzK9V0I4qFGzFwrvfKMCokoDKN3tYy13rtMMUPYPMnoBmk6fw7UVoBgzN2bBCCT9u9vzmm8XfQ7zRCH3r+eqgGa2Z8QLNxSLklGpdUZ+4yW8nIwK+IFG7C7oUG2eVnTUmao=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(316002)(33656002)(6506007)(8936002)(76116006)(9686003)(66476007)(5660300002)(122000001)(966005)(7696005)(8676002)(71200400001)(52536014)(2906002)(26005)(66946007)(55016002)(478600001)(4326008)(54906003)(83380400001)(6916009)(38100700002)(66556008)(86362001)(44832011)(186003)(64756008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3l2TnllTjJKaHlJUmJWS2kxeExvT09ONHJCWW1RV3E4T3NlZm1mekI0eTBB?=
 =?utf-8?B?blZGSU13MUE5KzNRM2dKRmhQaUpsTVVseDRTY05OWnpXRHdiZ0tDYmJuNzBH?=
 =?utf-8?B?aWI1T2lPckF6WUZtWm1GOHdkWUZLQnV4OWJsQWlDaVU5U1lZbS9GbkVqVFcr?=
 =?utf-8?B?OTF6N3E0elpSWFpab1UvdVA3SzdOcVRvdi9ncUJzTS9aVTFhTnFMMXl2Q09N?=
 =?utf-8?B?a2ExRkF5N2pEUU51ZDVtL0o3TzFXNHFNRUJ5eCtGeW1iUXJFMTVhbXhtQVhB?=
 =?utf-8?B?ajl0dUlRb01tdEJDY2RuVWtpcC90STJPQnEwWmloeE9GVExtVCtlVzlLZkgy?=
 =?utf-8?B?YnNveVFIMTBKV2pqa1plWDRjci9jWTg2VzdnQnczbGNBVllMc1JZVUR3OCt6?=
 =?utf-8?B?eE80OVoxS0lhNlZvZ0hmbkdsZzVBYWlpcWI5N3A0NkxTdVhrc2dTVGFtYVF3?=
 =?utf-8?B?NU9hR28xdzFHSDA5QnplbWZZMUlzOWo3V2g1NE5hUlpoNUo1NmNDRjV2N0VV?=
 =?utf-8?B?cjg2eXVPc0pQWE9UdEk3NlBWU05YQlkwQ0QrQURmQ1RKTVRuWTIzalJWOW1J?=
 =?utf-8?B?SkpocFcyR1dsNnF3bkcrWERqWW9jYXB5Y3FsbkVvUkEzZWhxd29HWERSY0h4?=
 =?utf-8?B?Y1plOUF5dWxVMG8weVFhNU5EOFVDa2lJbUsvZ3JXZXJ6NUIxdWRPWXFBZHVh?=
 =?utf-8?B?bDVuL2R4VGRqa0g5cmVyL3V1eXM1UVE1anFFTXU0em1NMjRnaW02RS8xNlNV?=
 =?utf-8?B?dWN4algrRHVaQUN6VjFhdDhiNXB6ckdCdWcwL3Z6NGdDUXYwa1BxQUUxK1Yy?=
 =?utf-8?B?RUdSWm1NTkNmRzExbmZRZzRka2F5a2kvSDdMNDRDVmMxTFh3YjFXRStXV2s1?=
 =?utf-8?B?czFBaUVOcHd5Z0VGSUMzVGRJTllwUHBhZHBucmxnTkNxS21peFNQaVJjSWVI?=
 =?utf-8?B?YmVZRE1ua0FhL0czOGw4eW0vUlk1RHpJZnJsWEJqS0JmanpRckdEQkxXaVpz?=
 =?utf-8?B?Y2xtc3hJNTVOYUducVpPUjU4YitVSUZEcDAzMU12cU8xVitIK0xsTXdiNFJ0?=
 =?utf-8?B?Ull4MHBhS0FLTFl2bkxMUkk5bFNKUkJvNHc1Z25yQmwrUXdLT3hrYmEyVThw?=
 =?utf-8?B?OFM3VnBaa1RWMFBkRzJ0dzBnYVZNcDdXRWxaYUlhNEdMdkhsQkJKR2VjV0I4?=
 =?utf-8?B?b0ZEcU8wMWNZTm1rcE9BVDFCUTFhdEVUOHg0N0RRRTBxank1dmpyRDlFN3NG?=
 =?utf-8?B?ejB0RGRmT1p2NnRUbXdBd0lVaWRNOGN0TVk0VXNMd1RpWjAxK1M5SG80VTA4?=
 =?utf-8?B?TCtuVGtRV2RCTEtoVW50QWh5MlA3LytLTVd4bWdPQ3hXTHMvSUFYaUNxak80?=
 =?utf-8?B?KzJhR3BnV1lMRVZUNFZiOGpoNUNkaVdGNTdYMVVNNFR0SlhkaEl0SmJDcUYy?=
 =?utf-8?B?WXBCZmZOTUt1WS9ZSG1jSUxYQUE2OHJzV2ZjS1d4MitkMnNjOWo1WUNaYzUy?=
 =?utf-8?B?MytuMTIxRG9YRFlQR0VFUmJGOTBRKzRiSTFPTmF1eHU3YkNPL0NUdDNSOXgr?=
 =?utf-8?B?ckxiRi90aHhvYTFtbzJpTk56bldFRXo1TzU2SUJmZndaTndWakFzYTFFUGk1?=
 =?utf-8?B?NVNkWTUyNFBZLy9VNGJmS3JhSVQ0YlhRNXErU0xaMmszRWdYekp6NlZyUWd6?=
 =?utf-8?B?cjlZcjhUT1NMaHF3UXNxcTNsTHZXR1VxcnlGRzJwY2hPNzhZMllJUmxPM2dF?=
 =?utf-8?Q?O9V5fMSdIT/wYqWVdDqJ4nlr7zRmB9oORln2gk3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcc94aa-e62c-43cd-05d6-08d945a89768
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 02:47:44.5290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RJQTbBSSZGBE7KqC59nStDpLm9bxKfMPfESASSUkMCPIPotRs7lmHjPgq5A3hjPcg5l2KWOzENGT/FoCJvcDSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8886
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGkgTWF0aGlldSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gRnJvbTogTWF0aGll
dSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwg
SnVseSAxMywgMjAyMSAyOjA5IEFNDQo+IA0KPiBPbiBUdWUsIEp1bCAwNiwgMjAyMSBhdCAxMDoy
MzozNVBNICswODAwLCBEb25nIEFpc2hlbmcgd3JvdGU6DQo+ID4gVXN1YWxseSB0aGUgZGFzaCAn
LScgIGlzIHByZWZlcnJlZCBpbiBub2RlIG5hbWUuDQo+IA0KPiAuLi4gQW5kIHlldCB0aGUgRFQg
YmluZGluZyBzaG93cyAmbTRfcmVzZXJ2ZWRfc3lzbWVtMSBhbmQNCj4gJm00X3Jlc2VydmVkX3N5
c21lbTIuDQo+IA0KPiBFaXRoZXIgY2hhbmdlIGl0IGFsbCBvciBsZWF2ZSBhcyBpcy4NCg0KVGhl
c2UgYXJlIHBoYW5kbGVzIGFuZCBub3Qgbm9kZSBuYW1lcy4NClNvIHNob3VsZCBiZSBvay4NCg0K
QlRXLCBJJ3ZlIHNlbnQgVjIsIGNvdWxkIHlvdSBoZWxwIHJldmlldyBWMiBzZXJpZXM/DQpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYXJtLWtlcm5lbC9wYXRjaC8y
MDIxMDcwNzA5NDAzMy4xOTU5NzUyLTEtYWlzaGVuZy5kb25nQG54cC5jb20vDQoNClJlZ2FyZHMN
CkFpc2hlbmcNCg0KPiANCj4gVGhhbmtzLA0KPiBNYXRoaWV1DQo+IA0KPiA+IFNvIGZhciwgbm90
IGR0cyBpbiB1cHN0cmVhbSBrZXJuZWwsIHNvIHdlIGp1c3QgdXBkYXRlIG5vZGUgbmFtZSBpbg0K
PiA+IGRyaXZlci4NCj4gPg0KPiA+IENjOiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3Nv
bkBsaW5hcm8ub3JnPg0KPiA+IENjOiBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBs
aW5hcm8ub3JnPg0KPiA+IENjOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gPiBGaXhl
czogNWU0YzEyNDMwNzFkICgicmVtb3RlcHJvYzogaW14X3Jwcm9jOiBzdXBwb3J0IHJlbW90ZSBj
b3Jlcw0KPiA+IGJvb3RlZCBiZWZvcmUgTGludXggS2VybmVsIikNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYw0KPiA+IGIvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9y
cHJvYy5jIGluZGV4IDEyZGUxNTNhYmIyZC4uMjZlYjEzMGYzMjYzDQo+ID4gMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jDQo+ID4gKysrIGIvZHJpdmVycy9y
ZW1vdGVwcm9jL2lteF9ycHJvYy5jDQo+ID4gQEAgLTYwMCw3ICs2MDAsNyBAQCBzdGF0aWMgaW50
IGlteF9ycHJvY19hZGRyX2luaXQoc3RydWN0IGlteF9ycHJvYw0KPiAqcHJpdiwNCj4gPiAgCQl9
DQo+ID4gIAkJcHJpdi0+bWVtW2JdLnN5c19hZGRyID0gcmVzLnN0YXJ0Ow0KPiA+ICAJCXByaXYt
Pm1lbVtiXS5zaXplID0gcmVzb3VyY2Vfc2l6ZSgmcmVzKTsNCj4gPiAtCQlpZiAoIXN0cmNtcChu
b2RlLT5uYW1lLCAicnNjX3RhYmxlIikpDQo+ID4gKwkJaWYgKCFzdHJjbXAobm9kZS0+bmFtZSwg
InJzYy10YWJsZSIpKQ0KPiA+ICAJCQlwcml2LT5yc2NfdGFibGUgPSBwcml2LT5tZW1bYl0uY3B1
X2FkZHI7DQo+ID4gIAkJYisrOw0KPiA+ICAJfQ0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4NCg==
