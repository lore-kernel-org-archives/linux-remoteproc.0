Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1614C76195
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Mar 2023 02:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjC1CHB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Mar 2023 22:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjC1CHA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Mar 2023 22:07:00 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967122689
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 19:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qs+znN1jgD1/9tX1ZVTAICJOxc8x3RwZqkZNkrQFycUnDmvugh7PvBgwBAAYsbaKmrPdHojJ+G1wsP0y3XHsyaN2WxoMCbJzw0hqQ262fhx47cJmdcAJlacSIMQq8A8IEK3x9cvf/rHTiSqa/1UG5HwmM0CfB2skPC+R9m1OqM89qZwxuyWWAnpi0IcmxpNLAgP5+tKqu09O2PjiVEj+m9R5IdHvl60IwXeBL2mQsM6/lHBjSXJadRnmikef8LinOtaXWH27luxitR5ACMUp37T4B+hZ4GdmHoMckufeeQQW1y0ON/icpEOkQpIMmBn78iCRNeYhIBgTGzNdQkwv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwHAkS1uAMv4QNAEHERnlvDF4d+kfkkXyow8VUyzIiA=;
 b=dbUBcvKsP4edGSYXWDNNwSOtJ9dV3ri0/A+VREkDm+bufeRMHSVuMOYBWuwgAtmnvbQPMTx6fHMPE9GQRyMAsCJSkKfeOmK5YX8NsbCr9dkwEVMlTRiTcAaAoPK+dLaNtBRV4EGCQ6c1Hb4i4iGc5XIff03WcyGNpiD+G8vOWcQZ1QHvDGbbNJQmVmm9y6DvKEGM5DUzQLXSw3HG+IWQz7u9y1Ia7xiXOm7yp4QzMiA1FyZgWEIPSoApWWmEo/XC6FQx7/s4+m3/VNSR/LxikmCX5s1QpwmK/5iHFunuT+3ig2O/BuxuxBRG1T+TX+P5J7dxmhzBEHSINaQsntgs9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwHAkS1uAMv4QNAEHERnlvDF4d+kfkkXyow8VUyzIiA=;
 b=ETDc582CkNkutPs7d2V/3jqmfY1aHMpBWaRVqYste+3ElzgfOn9ayTs992A/b0wlu00Y/kMKA2NLzrngIUAhKkv+kyPtOeOQD+j4DAiu6hmr/dR/CBMjNK5vZjxXmJO/WVucxfVQLjJVx/g8DXeaZG/d0bOMRgfo01mz7t2XAz4=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 02:06:57 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::778e:19d0:cba0:5cc0]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::778e:19d0:cba0:5cc0%4]) with mapi id 15.20.6222.028; Tue, 28 Mar 2023
 02:06:57 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: Race condition between Linux and M4 app with rpmsg link init
Thread-Topic: Race condition between Linux and M4 app with rpmsg link init
Thread-Index: AQHZYKIzMsPaS/maDEWdMIVJbfIT968Pcbuw
Date:   Tue, 28 Mar 2023 02:06:57 +0000
Message-ID: <DU0PR04MB9417B9C2F3145F39A1E0FAD788889@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <ed554149-5671-0c59-5add-5d1dc8f1f898@kontron.de>
In-Reply-To: <ed554149-5671-0c59-5add-5d1dc8f1f898@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|VI1PR04MB7055:EE_
x-ms-office365-filtering-correlation-id: 14ec5c78-6a16-4b13-b4f4-08db2f311be9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLK/Lsi34W5QjfYXSjggNBL3igrac7LqIeFyX7tif2Nj54pc82A5t2By/f/epxgciHYBdKJSxy5/c1zlcFKZt9ECVB4o8n3/4G8InCHTbXeR/lPVbfer6Ljeeq+TjF5bykccvXdoQiQ2cNTQH8vyiEZkrJWqQl1d+2s52s+7pdJDAdxJX9jezBsaMBSTkiIuCZPzwAvVHr7KsxbOh+Txa/j9NhwRdJPq/C9amfnU0pwVUK8YKxomFWl/61XTJOVusFIDxGP4mn82NLAg7YDaXpQU8fqSwCx+HbD++VWpPlYimEbqWrKXaYYwZ+2A+SNoRfqQzqTxU2GlJWcjvZyDb385N6IrlLcfhKiBRB2wZUbM7C1+grP0Hm+Mw8Omv9lafQZvVvtNjEJbm8AefkhX6C1dyIVgDEv9zB0by4i1zjZxZTtlHrjXOakh5QBZpu+dv5n7iEv1dalZPNlMX1S2PdtNvqZQM9eQNQR/bj3Xxto1NbPa62AmqldX9CEjDebP+UGg2bKcoqsS70SdR/Jhq+RxlfMgkQR0NMxzgXqqmvQK3LEQb5ouW65h95OX6Qq04LdYpSlMuMOLKYA8oZirGKEbO9qpEsBLMtaP4OG2Xlc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(2906002)(71200400001)(33656002)(38100700002)(44832011)(966005)(7696005)(64756008)(66446008)(76116006)(66476007)(66946007)(316002)(66556008)(110136005)(4326008)(8676002)(41300700001)(54906003)(122000001)(5660300002)(478600001)(55016003)(8936002)(38070700005)(52536014)(186003)(83380400001)(6506007)(26005)(9686003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXNvU2s4UlR4dkQrdFFQanBhcldJSmZRSlhCTjZLcmwyOWF3aUFqMEJYcTZI?=
 =?utf-8?B?b21TTE4yck5heUlaTmEzaDFOQ2JrbUc3V1Via0tiejk3MUdiOWIvaWVSZkdw?=
 =?utf-8?B?cFVNblpDMlNUSXhwNkFac2VQVUVYTWlmZXZ1ZU5HUThDeGlQUmgzUDlLdkhq?=
 =?utf-8?B?T2dBb2FlUThzeGpoZEhQZTFVVktVNmNmUkkwd09abXJmczJweVY1Z0kvdTJP?=
 =?utf-8?B?TGVreC95SHNoOWkrdWlFV0MzdTNqLzVPUGRwRGtmRDZySXhMY0RxQS80ZXg4?=
 =?utf-8?B?Q3g2T3dza0QvRWNqSUUxdmZycTc1ejluYkhGZDVmQm5xVHo4dHlMamNzSmpM?=
 =?utf-8?B?TEJMMzRsMkkxc1Y2cUw5UDBQQ2pkR2gyTnkxVmdvK1p1c293TXloVGlsZXhw?=
 =?utf-8?B?eS9EbGU1QUVxdTlpK1QwSFVCdW1tVGM4bnlDampMaXp2YkVIVlkrdkZ0dGVi?=
 =?utf-8?B?TEhWczJqdlZwUTc2Q2wzRm5vWmVXQ2ExbnJOdE5BS1FmSG9XT3lDNUMrQzdR?=
 =?utf-8?B?ZkZ2dENYMlE5T2dhaVN2TUtHTTcxR0Y3ZHltMUY1cFZtYks4K2gvTFYxM1o2?=
 =?utf-8?B?aFN6bFNzL3BuN0wvOTFBS1hzY2s5cDAzdldNVEdKZWxyUy9BUXRwU2QzQmFK?=
 =?utf-8?B?RmxINDRPd3I2NFhyOFNObXVwUlBjeTNzQisrNUNFellqWDhpZUZ4c0lyMFYr?=
 =?utf-8?B?UHAwVkMvdm5leWJBSDVnY2lKRkxhYXBWZVJwbkdLaVBsMzlMa3dEbDBKZU5U?=
 =?utf-8?B?ckVOTXVTK3ZPekY2YmNXNURzcGtQRVBRaUZxLzNyRDdHNS9YMFRUdWVSUCtQ?=
 =?utf-8?B?N2JEZmZUMFVkWG9kY2FCb050UjNWZ0JCNzAzblVhSUxUVHZneEJ2dVFtRjJv?=
 =?utf-8?B?bGhnWnNSWW1weUd6bjFsUkxjTm9MWXR1bUNHOVdnQ3M4ZTNzaGhNQ3NVeHVV?=
 =?utf-8?B?dWh6cDVjcDYrYTlybTNhb0kxbGNoZVFQRXNOTkt0UGxzYVJ5MXkxSVk3MzZk?=
 =?utf-8?B?Y1l5Ymwza3oxbTN6S0Q2K1hSRXlRUytRL3NiZEhzU1FERnF1bEEzRHE3Zmhs?=
 =?utf-8?B?dVZ2OXNOaG9hdzdUM2tEbFFNVlhkcHI4d2d1Wmt6TTlhVW5ObzBqYTAzSDB4?=
 =?utf-8?B?bksreWtLQnhoZGM3QmNwWjNpanlPR0ZwNWE4L3dGR3NjK0tuUUd5d2RydGMz?=
 =?utf-8?B?SStkQ2duaCtQbDdxRnFLQ1FSMy9ueGdVaU5XVVZoeDZpRW51WDgzenRFUkNs?=
 =?utf-8?B?YXNITEg4TWxhY0J4ZWZIL3B3aHk4TkVLeXluckxTVlRKamw0TFRrakJoV3dD?=
 =?utf-8?B?NVdkcEUxQVBJQllGWmRnRGp6Ym9IbnZzc083bWgwSk9SMVJPeW0xVWpPU0pP?=
 =?utf-8?B?ck5HaDlLYTYvc0J4SEg0bGg5OStaQUg3NnkzZjd0SnZhZS81WXR4SVQ0MTZT?=
 =?utf-8?B?dU5wRkJETGR2Y0JUdndKRjNjOXQrUEZyOHZpanhoWjhoRjZjTVFnaWoyTDF1?=
 =?utf-8?B?MWlCL1dlS2U3ZkxWSkl5TmUyOFpOTlluemJBZXVOTUZTS2VaNmdtVkc3UUpG?=
 =?utf-8?B?TE4wKytsRGNuaGxNdkM3WHl0aFNEOHFqekpjcytOSXptS08yNzBxak9mcTBh?=
 =?utf-8?B?UlZUOUMrYkpvNFVRb3kvUzMvNnU0V0V0N3pHUXdtczNjNjB2NmRHUmVMc0Nw?=
 =?utf-8?B?SFplZlJXbVhWL3FBZ3kyd3ZsaWcxazQvQ0VRenZMSTFTVVl1YW9qNUhRd29M?=
 =?utf-8?B?UnVBZzZXbm51VTNFMjJHdlYrY0JRRllWZDdBV0E3Sk44VzY3VjVLRnRTQkk4?=
 =?utf-8?B?SXo1Tk5qNjczak05MVRGdUZtVHAvMHo2ZDlsdThQa1VmVENsNnowZE5XVUI2?=
 =?utf-8?B?Wmp6anNQUDZKbW9uU1BUMWQ4NitqNnBTcFdHMjRZU0l3MHdaUlNwZ3NyRkJS?=
 =?utf-8?B?L09PeVNEajA3Z2NMNFAxelhIRVkwMFFjd05rYU93M0VFQmptZDVoUnZoUW1G?=
 =?utf-8?B?b0Z1S0tlR2pxcG80U1B0cVJvZXVuOXRyVWZ5QnMzQjhhRFFVLy8yMVpvcEdX?=
 =?utf-8?B?MlJMdXdHSU90Q2FtQU11QkNzekF3YXp3Z1VXcEljK1Q5bTVLRzVXV1dnWFVG?=
 =?utf-8?Q?oL0E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ec5c78-6a16-4b13-b4f4-08db2f311be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 02:06:57.0869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6QMbQRkklZ7HRzettI/g+uhpshmLD1RK1peRgE8ulffPkJvx0lwT+ahpnC+RKToLNmfHLbXFijfX5G+iZ1khQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7055
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGkgRnJpZWRlciwNCg0KPiBTdWJqZWN0OiBSYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIExpbnV4IGFu
ZCBNNCBhcHAgd2l0aCBycG1zZyBsaW5rIGluaXQNCj4gDQo+IEhpLA0KPiANCj4gSSBoYXZlIGEg
cHJvYmxlbSB3aXRoIGEga2luZCBvZiByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIExpbnV4DQo+IHJl
bW90ZXByb2MvcnBtc2cgb24gdGhlIEE1MyBjb3JlIGFuZCB0aGUgYXBwIG9uIHRoZSBNNCBjb3Jl
IHdoZW4NCj4gc3RhcnRpbmcgdGhlIHJlbW90ZSBjb3JlIGFuZCBpbml0aWFsaXppbmcgdGhlIHJw
bXNnIGxpbmsuIFRoaXMgaXMgd2hhdA0KPiBoYXBwZW5zOg0KPiANCj4gfCBBNTMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIE00ICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfCAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIHwgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIHwN
Cj4gfCAqIGxvYWQgdGhlIEVMRiBmaWxlICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwNCj4gfCAqIHN0YXJ0IHRoZSBNNCBjb3JlICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwNCj4gfCBycHJvY19zdGFydCgpICAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfCAgIGlteF9ycHJvY19zdGFydCgpICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgKiBNNCBhcHAgc3RhcnRzICAgICAgICAgICAgIHwNCj4gfCAgIHJwcm9j
X3N0YXJ0X3N1YmRldmljZXMoKSAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4g
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgKiBNNCByZWNlaXZlcyBtYWlsYm94IElS
USAgIHwNCj4gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgKiBNNCBhcHAgZG9lc24n
dCBoYW5kbGUgICAgIHwNCj4gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICBJUlEg
YXMgdGhleSBhcmUgbm90ICAgICAgIHwNCj4gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICByZWdpc3RlcmVkIHlldCAgICAgICAgICAgIHwNCj4gfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgKiBNNCByZWdpc3RlcnMgSVJRIGhhbmRsZXJzIHwNCj4gDQo+IA0KPiBXaGVu
IEkgYWRkIGEgZGVsYXkgaW4gcnByb2Nfc3RhcnQoKSBiZXR3ZWVuIHRoZSBjYWxscyB0bw0KPiBp
bXhfcnByb2Nfc3RhcnQoKSBhbmQgcnByb2Nfc3RhcnRfc3ViZGV2aWNlcygpIHRoaXMgZ2l2ZSB0
aGUgTTQgYXBwIGVub3VnaA0KPiB0aW1lIHRvIGZ1bGx5IHN0YXJ0IGFuZCByZWdpc3RlciB0aGUg
SVJRIGhhbmRsZXJzLiBJbiB0aGlzIGNhc2UgdGhlIHJwbXNnIGxpbmsgaXMNCj4gaW5pdGlhbGl6
ZWQgY29ycmVjdGx5Lg0KPiANCj4gV2hhdCBpcyB0aGUgcHJvcGVyIHdheSB0byBmaXggdGhpcz8g
SXMgdGhlcmUgYWxyZWFkeSBhIG1lY2hhbmlzbSB0byBoYW5kbGUNCj4gc3VjaCBjYXNlcz8NCkkg
aGFkIHBhdGNoZXMgWzFdLCBidXQgdGhvc2Ugd2VyZSByZWplY3RlZC4gSSBub3QgZmluZCBwcm9w
ZXIgd2F5IHRvIGFkZHJlc3MgdGhlIGlzc3VlDQppbiB1cHN0cmVhbSBrZXJuZWwuDQpbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMTEwNDE1MzMwMy5HQjE4NzMwNjhAcDE0cy90
LyNtZDBjNTZlOTZmNjFmNmE0MjM4NTJhZTY5NzE0N2QwMzk0YzdmMDM2Nw0KDQpSZWdhcmRzLA0K
UGVuZy4NCj4gDQo+IFRoYW5rcyBmb3IgYW55IGhlbHAhDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4g
RnJpZWRlcg0K
