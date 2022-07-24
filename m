Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22280C43334
	for <linux-remoteproc@archiver.kernel.org>; Sun, 24 Jul 2022 12:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiGXM5k (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 24 Jul 2022 08:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiGXM5j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 24 Jul 2022 08:57:39 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4790855BE
        for <linux-remoteproc@vger.kernel.org>; Sun, 24 Jul 2022 05:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UX1X1mqypHOnlB5pjFcPQQ0OGoUR28hA/nH7/e7yYV85GSPvKHK52iutgtSMiB0uZ9mw9ifI8my52YOmUxdV387jpa8OJjwCWBdrewYuwpBsne5BQlLGg2gYojPJ/Tz+/G9yjMfYOkKkBuP8TlGQU+AW0ctASmg5QC1g+amGq3CiufSLgDZITc6wpdbAb7x2++EKgLRw1Eruq0iggmRmChkpxocgDQQ0QekJCMGcuUZCZ5Iih+1CDki09MuBHWvik6E3hx3XavH9qkzMLwb2Jxzq9JXwkORIId8mc8uUntLTBSe2OnmSemCEK8qgFAFMxBlU12zewnoYHQ2U2surjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBtY+837aqqcjjrB1TeLPQWJwgnssvvtsEMr+sP/X54=;
 b=m863e7JnY6Pyqu/4Ps/cWsHiHA64iLk2pzMipfbScy6R6epZZiC+ZhUhqF8lkVpVx4n7TKYbJKzPwyn7bqtKvDxbu5xZkGOcxhOyzuxpjc3hir+cA7IyrCHKIqr516dbX9ia/TlmJIVAIvn0uTgX6XGes3lt3ZOK3TVHiACHrHhyFcUN3rX95tj5wvVAtJdnZStUDSBc/4RFFM8OhM6Gk23QZbLLEuomHZgZWgCsAWktnKTY7eFvn95G5P0ixbq5/zJn4b80tFHYqhxpl1hKoG8nUsBBYB1rj+b4iX4p9zDOsEfYVaJd4+fSairJN2LYHZxqVPR1vN/8S1MxUTQ4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBtY+837aqqcjjrB1TeLPQWJwgnssvvtsEMr+sP/X54=;
 b=NgYiTCwWxctu+f4ygeSQKh17vCk1ciLiDf+KSWinmRPR9mGZ/WssdopHNqQ5168V9XM9Bn/o94vsPDnt/KtTBtdsIv1WKKUPtetNLMF3fprXNJkRYIq+RVtD08VmlbVk8yt5msfWMKzXEbaA/mI/hlIr4bEkP6xu2IEfKPix/gw=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI1PR04MB3965.eurprd04.prod.outlook.com (2603:10a6:803:3e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Sun, 24 Jul
 2022 12:57:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c0c2:ede7:3b85:1597]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c0c2:ede7:3b85:1597%3]) with mapi id 15.20.5458.021; Sun, 24 Jul 2022
 12:57:30 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>
Subject: RE: [INFO] Remoteproc/RPMSG patchset review order for July 14th 2022
Thread-Topic: [INFO] Remoteproc/RPMSG patchset review order for July 14th 2022
Thread-Index: AQHYl4/wEUTpGqBAOEW4KWSpnRIiLq2NilCg
Date:   Sun, 24 Jul 2022 12:57:30 +0000
Message-ID: <DU0PR04MB9417B9A8B692CB496556F87288929@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <CANLsYkxuRtF-bfhz+UJXRWD_b5buUuncYeD2j_xFxYstFQqevw@mail.gmail.com>
In-Reply-To: <CANLsYkxuRtF-bfhz+UJXRWD_b5buUuncYeD2j_xFxYstFQqevw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d5aa464-c4f2-4e73-e439-08da6d74118f
x-ms-traffictypediagnostic: VI1PR04MB3965:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MA1t5nyDvFBAAOnLgdRbdPBtzCtRwVVjlrkOzpPigi4kPH7MbyF8i2UAzjdwmIdwrweRRhNrijx/78GMw37nkIHx7Ri4Fo70CZvpJx9jbFXET5COcH4x2BRvdoKN1dHuH2qaXrJmfrwI6xdH2G/xrx5Ugoy0k5wRttoVFEYoc+2Pam/GRv1cNw4S/xEGoFSwt32Pmd075D6PsIS4yzCTLv2Nk1MtCBfwC3/tJsVNFUDR6h4ftInJveYLEULRJlSsDj2jv8cyYyVtXEL00R1Q0eZJDAIWKiSJE0zD29mUb4PRk7UPqoASdNfKIMTM+3X7WUKTittIxjhDi+5yjYqui96qQw8GvfQLuPSDLe+XfUlibPhN4hre+Wb9PtfYhV4vxJivIQIlyd5avYKFG27PSFMdhl1xrvtaPqm2UrfkeBguHZWdoFDTgD+zzpc5b0tD65xqpCpO5Xc+a1w0K/aA2llQyxpLjbUgRpVwuEHsJDUL4Y3Gz2G5/H9OogyM3P46Cfnp7nUn9RPBFgNPH1/TIXghlwwXzwVYKQCl0jEZEFVOvDdNlVYsHTDe/q/AMcDgv2V4DJ+TH2XhXGmlHcYSFt/n3sDsE+k/U+vclwXGA3ob5renT85PTfDKLsRcrZiO3CELm26UdcJ2PMxp3qzKW3dN69UrVZkL4dJu+nbniOySDr8A7T15dr1jK6bLpBYkGWQ7kuCRoDs6QOB7z/eX5qsUnJpcs+rs4C8b8snPsguGAvzKoJha32TLYJH8rA2qUT5Zq7YllTCDQ6ko/sdQiXbAxp6d89Y+ArrMaps5xcc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(346002)(39850400004)(66946007)(26005)(64756008)(44832011)(9686003)(83380400001)(110136005)(66556008)(186003)(66446008)(76116006)(66476007)(8676002)(41300700001)(6506007)(7696005)(2906002)(55016003)(33656002)(38100700002)(4744005)(5660300002)(122000001)(71200400001)(478600001)(316002)(52536014)(38070700005)(8936002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVJCQkd0ak5FNjZnQzJwNXFWaHRvUW5VTmM2dGtWYVJpSUlKVFEyWGdlRFFs?=
 =?utf-8?B?cUltU09QT3dPRHlzNE9VNW9HNWhINGlDNWZMaXRGVDNkSFQ5WWd3WTRQWkxj?=
 =?utf-8?B?Wk9GOUJKYTZRVS9wTHRBZi8rMS9hVC80dnl0dkFFZXdZL1hxbHlyRzkwd2Nu?=
 =?utf-8?B?cGdzNjRJOERUbjVrVm9kZ1R5UldZazNJamRmaXRxdGlHYjVUalM0dlVWQTg1?=
 =?utf-8?B?TEpSMXNESWFHV3lxdGlYcEdENXQ2NGhzUWRYbFUxeUVkdzRPc0ppZC9ibW9S?=
 =?utf-8?B?T053VzFyeTJjbkhKQUc0dWRienBSU0xCVm5XdGxQc3FDYkhwWEFCUVl5ZXU4?=
 =?utf-8?B?a1VIZGhqeVhxVElDNTA2YmtYSXNkNkVhT2tjdEMzWHlTVkkzbzJIc2d6S2Jk?=
 =?utf-8?B?K1NCWjd0TkM2bkNyY0xPWm1TMEhQeHUvYWFkZHltemlCVysxaGRYWGpyOXlE?=
 =?utf-8?B?d0FycXdlOWNmS1IwM2RYeCtOTmlXc1NMQjRta3JIc0lUSFR2MFI2K09oeTBn?=
 =?utf-8?B?c3Z4NDU3SFdrTHkyZHdhaGZDTjNDczhtQThqOUZUV2MySko4eHY2Y0J3bG5V?=
 =?utf-8?B?cFc2UThrV3M2emlSSURFZ3JlclEzRmQ2WXBFMjQ2RHE1Z3dSRWtpcUlTeEZD?=
 =?utf-8?B?anhKVVV0LzdybDNjc29UalU1R1ZTaUY4Rm9CcFpiU3VKNjA0bWp1N3dvakds?=
 =?utf-8?B?ck5HWXc0czdqMExWSGs3VUdaN091ZXRnZnpjN3RpUitsdjJUcGIveFVjb3pS?=
 =?utf-8?B?a3dRVjZ2dlN2bkx1S2dsOVR2WnJ4U01HNzhnQldaUDBoR05MWmh2SWxyemY2?=
 =?utf-8?B?WjdQVWU0cVYxL2hicEg0bENUOG9sUG1kdTh3VkVXTVFVYUM3dXlIbFdvNG1t?=
 =?utf-8?B?MHJoYjBaSEdBdzB3empySVd2WmxwdWNnZDU5bytLT25icVBjTGNJQjBQOXg1?=
 =?utf-8?B?ZXVld08zSUoxL3pzRjVwZllSQWZ5ZzRwSllNU2tjNmlRZXVDOFpJT3lDNm1O?=
 =?utf-8?B?M3pXT2orakdQYlJYa1pkcHVxUXg4b1NkajNxdVYzaHNvMmZkZHdJaUk1bmdP?=
 =?utf-8?B?U3REdnFtSVplMStibjhkcXkvcFB6UXpvV0FnZlRNTHVhQUhrNFlFVHpjeGs4?=
 =?utf-8?B?REk0LzV4Qmw4cVFtRDBhY3dPaTZDeWRPdXk3VFlUZzRQTnE1bTFkdkMyL0lP?=
 =?utf-8?B?THBNV2tCaE0zMFdPZjhLT1JJVGNNV25IczdmQS9VeFc4Uk42ZTVjK20zdEJm?=
 =?utf-8?B?K2g5OXczWXl2Rzc0c1o4UlNHSDdVZG44alNRcFBpVUhmbHpKVU91bk5KL3ZV?=
 =?utf-8?B?MGZGTkI3TEFMSS9xNEljdzQyTUJQUVNlY0dpNjFWemRDcVZTeWlLSU5mRzFX?=
 =?utf-8?B?dm04cUtFNGV4cUx6M1lpa2ZaY056TG8xYkJ4OW9kRTV2RXRnazlXejI0TlRY?=
 =?utf-8?B?aUUwaEMyb3FldytFRmI0TENqcjdxRjcrQzltNGRQdTdyUXNjQVlVbzBiMkNI?=
 =?utf-8?B?WnMxVWpoM1ZRaERON3FOWklBR3Z4ZmVwSVM3dUs4MGZqc2RxanhzTG1JVUJO?=
 =?utf-8?B?NndMZjVIN0tVWVZndjhuYkhsTERNVGN6ZW5CTXVqc0xkQS9BMGtYKzZvendQ?=
 =?utf-8?B?WUJCd2haaDhIdGpuV0ZQWlVLM3pRRVFKMjE3aEdMeFo3TDg4VkROZlNtN3Qr?=
 =?utf-8?B?aXhobVZzcFpRWDlQMk84d0NrWWpHUzdQKzFyYTRlVzhYS2tZdGNRWHp0WWhS?=
 =?utf-8?B?aXhKQnovL2FqZEJDVVhJWFBtSGJjNkJhOU4yWVQwemJXZVhCa2YwN3VtbWsw?=
 =?utf-8?B?UTJWNDd3RXhnRVFzazZqUUdrVTJBeVgvME5kSG1LMndpOXJILzBxTmVEYU5T?=
 =?utf-8?B?MVhYMm5NVHZyaFlDREdtSHplcTVJSHdhMGtqSlNvRnVPUGVCTms1eDdwWVJ3?=
 =?utf-8?B?V2JqM0hQbUNSMXp4QmdvTXhFOVpzQ3BpVnNuR3RaV2lnY1ZhbFhZeVcrMWZ5?=
 =?utf-8?B?dWV2eEQydysxQ2liSlNKN3BlUlVVYytzVDc5NU9oVHA1THlPSWpDNTFGNTY2?=
 =?utf-8?B?em1LWGt2TEZIODhmVzlqN2NXMHFhNHo1K21wNko0MVduM0pCRVhXVCsxL3Zr?=
 =?utf-8?Q?vN0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5aa464-c4f2-4e73-e439-08da6d74118f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2022 12:57:30.4467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Et+v//vGrBPLkrddjZvAxSybkTDQxyapp8/ZHpAm6tHPKL/sD2zb42QRtCDfBEm00+dBP0VvagLiNhqTBPYAVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3965
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGkgTWF0aGlldSwNCg0KPiBTdWJqZWN0OiBbSU5GT10gUmVtb3RlcHJvYy9SUE1TRyBwYXRjaHNl
dCByZXZpZXcgb3JkZXIgZm9yIEp1bHkgMTR0aA0KPiAyMDIyDQoNCltQQVRDSCAwLzJdIHJlbW90
ZXByb2M6IGlteDogYWRkIHN0YXJ0IHVwIGRlbGF5DQpTaG91bGQgYmUgcXVldWVkIGFmdGVyDQpb
UEFUQ0ggVjQgMC82XSByZW1vdGVwcm9jOiBpbXhfcnByb2M6IHN1cHBvcnQgaS5NWDhRTS9RWFAN
Cg0KVGhlIHN0YXJ0IHVwIGRlbGF5IHBhdGNoIGlzIGJhc2VkIG9uIHRoZSBwYXRjaCB0byBzdXBw
b3J0IGkuTVg4UU0vUVhQLg0KDQpUaGFua3MsDQpQZW5nLg0KPiANCj4gW1BBVENIIHY1IDAvNl0g
SW50cm9kdWNlIFBSVSByZW1vdGVwcm9jIGNvbnN1bWVyIEFQSSBbUEFUQ0ggMC80XQ0KPiBJbnRy
b2R1Y3Rpb24gb2YgcnBtc2dfcnhfZG9uZSBbUEFUQ0ggdjIgMC85XSBBZGQgc3VwcG9ydCBmb3Ig
TVQ4MTk1DQo+IFNDUCAybmQgY29yZSBbUEFUQ0ggdjkgMC82XSBBZGQgWGlsaW54IFJQVSBzdWJz
eXN0ZW0gc3VwcG9ydCBbUEFUQ0ggdjcNCj4gMC80XSByZW1vdGVwcm9jOiByZXN0cnVjdHVyZSB0
aGUgcmVtb3RlcHJvYyBWaXJ0SU8gZGV2aWNlIFtQQVRDSCAwLzJdDQo+IHJlbW90ZXByb2M6IGlt
eDogYWRkIHN0YXJ0IHVwIGRlbGF5IFtQQVRDSCBWNCAwLzZdIHJlbW90ZXByb2M6IGlteF9ycHJv
YzoNCj4gc3VwcG9ydCBpLk1YOFFNL1FYUA0K
