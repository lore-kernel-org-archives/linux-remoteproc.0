Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE96C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 21:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C463264F50
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 21:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbhCOVct (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Mar 2021 17:32:49 -0400
Received: from mail-eopbgr760083.outbound.protection.outlook.com ([40.107.76.83]:41892
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232883AbhCOVcn (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Mar 2021 17:32:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5gFfJ/1iAFtXFhJI5CQ/S4ObcGfRnsvzOUlUOPiMC5ndwiYZKQy+k3H7NcJ3gj0BeBwzw3OpCt+flP38etgbaWD21DbFMj70G5BwX0+B9iZUIFS5OPEXcDmMkxb6AncWC+ZEnwYUs+1L9Dmc0I2kbOGOrhVL4BNJbae3V1p3Sg9d6TaBb1p78vgxn9Fpn9Ei0stGvxlQLiTVZwmq89rrzlSWTwbBens1p6VqFBLovho39xJmQQmGm22jFzDps0FNsKqLcPUnOinQbtFzUbjBYByuquS3SImMR11en9l/OA2OFMA2wuJkmjw0LkmYzE6H+1M48WRElCTM7tmRDAhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr34ONpJVlqK9WAMGpDHFOrVLaST1DFYREWu1TgyC20=;
 b=Dwsys7z6Eoq3IM/KK/P/mveN/L99bVWzZdFobJvSfNl3AHu1w9lXdE6Ba1cexEcaJbH7iwJxxCKfjq/N+XkIk3Qzb4bCiBxOfREcTEAI4mkfa04RWGQsiYfcs/XxtkQdAF+rVgiRddEdoN3gijeU2ERz8dd/37SWRipC0DaKe3OdfeFUUG5aQXRn6WlTYRz81PL/Z6bAQ3ZZGGZojnAoUMVwbbyiwCeEGCir73HOeQWwhaXULSYdWdppsZtlo7dtiNMAkyULYOKRggUt/20J97Jm6tz9SmCCC7eRIdwPXBaEi/eXYftn/4L9HJVhraShcMdVf7RG5jCA92TSGNYjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr34ONpJVlqK9WAMGpDHFOrVLaST1DFYREWu1TgyC20=;
 b=fWSDELv6MDydhzWICiWpDiUsL1yeZJ4kY/aQt3c5it9O37KHG+2o36ZkmSD5P0TZJKUMC7mkcVkfSHK6+gM2sSRl6fxSwdtJZ5slg9xAoVh6IyztWyUnHsxFiHZjS5bTjEYzR70/LCoRqneuErjhnKZwQPc0Ov83035A0yVXN4U=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by SJ0PR02MB7663.namprd02.prod.outlook.com (2603:10b6:a03:32f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 21:32:41 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::2cf3:79d2:d169:7fdb]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::2cf3:79d2:d169:7fdb%3]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 21:32:41 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <michals@xilinx.com>,
        "Ed T. Mooring" <emooring@xilinx.com>
Subject: Re: [PATCH v26 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v26 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHXCfsr2E1q1mchlUeHFfIK6xXzWap79YAAgAMSswCABmeOAP//zGMA
Date:   Mon, 15 Mar 2021 21:32:40 +0000
Message-ID: <09895E3D-AED4-4DBF-A48C-684271275D49@xilinx.com>
References: <20210223154447.13247-1-ben.levinsky@xilinx.com>
 <20210223154447.13247-6-ben.levinsky@xilinx.com>
 <20210309165330.GA4013290@xps15>
 <38527B70-FE3A-4D05-8C2E-6A95A3D4ADF3@xilinx.com>
 <20210315173724.GB1342614@xps15>
In-Reply-To: <20210315173724.GB1342614@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.46.21021202
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56b512c6-a97d-44ba-4f4c-08d8e7f9dd04
x-ms-traffictypediagnostic: SJ0PR02MB7663:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB76636ED44274594B82679B33B56C9@SJ0PR02MB7663.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DzAF3MhuDQVf+PU5GvBqwmBfRbQxm72AMLqzskUadYNf5DOnsQoLcWvwSNfQfO4pMJoWfTt7wftsJk05nKzLi875STJiYsHcbOBRq9L+zOHXRJKg2YHy7Z938Efrupyk5hcxQpv1iv/f6aM4NFTw0AU04smFqaX104VFFXGPflvGhdfHDG8qYxgp6E454TYxmMdoEw61UUKcZ7Ez5kLLK2rC/vZrSes9H6xcFlCb/usio7I9kosOjbXVFCJ54RoEztDjxULeeliEi9pxnDeZpzAZPvsMCwDGUUQwbypvINp8CRXBxoW+Mof08zP/6jy9yInxPJ4xdf/S2QUaTqtCWX7KrUwUEYqxK5hun0uK/W9lUGT10isFcHi8gxwRm9EV829mD2nZy8Qy3ylCXkD0rnzJGCw2Zr7x+Ws7n9H5q2z/hJMLgOpw0gA3nzBKhxN7BknY89yi0eq7oURIA7ovRBgzQaArhm5YO7Z4a1GA0qLm6KeFtxLMG8193Juz8zEtRk8kpyRXlO3lqB7KDSF2LZthF6WnRAOQhQSSE9C709k+gSMrUldvWAzqAutoQWIZxTMc/grUpjR4mkcKjPkGZvbbzNraA+QIR4YMh1xSC1brXuzIFqzNjo2TA8qLgbDQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(83380400001)(64756008)(316002)(5660300002)(86362001)(478600001)(6916009)(4326008)(26005)(36756003)(2616005)(107886003)(6486002)(8676002)(76116006)(66556008)(66446008)(6512007)(186003)(8936002)(66476007)(33656002)(2906002)(6506007)(54906003)(71200400001)(66946007)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NEpFTHYrQi8zUzhpeXVMYTIzMHpUelRyUnpGQ0FxS0ExdGxsYnVOejlRZXZj?=
 =?utf-8?B?bEpwdGVRbXhRV0JQWExVd1NpclMxNXlIZTNJWWFMaUhvZ3B0RnRQa1VDR3pJ?=
 =?utf-8?B?T1NYbTBXTnBzTFhIY2F4NTJjR09NR29kT1JXcmRyTGFYMzdiVlhyOXlMZDJK?=
 =?utf-8?B?bU96WnlYMVlKY3FFSGQ2a1ltT1JuYVNVemJpL2VFNXZxUTdFN3pCQlAyMDQ3?=
 =?utf-8?B?UjA1ZlpyVG4ySndKM1YxUG9ESnZnL1ozTHdubHN1d3pFMTByT2h4eWoxdG5G?=
 =?utf-8?B?a3dWbHh5TnBDU2FDOXRYQWh1RUc5YUprdUpTUHlZUDBQTGdwZXVOOWkvTmI0?=
 =?utf-8?B?U2tTQ2pCaW9tL0hOL284RExIdEwyWjBuUks3d1hKcVVqSFJPY2RxWk81aVB4?=
 =?utf-8?B?dDZyNzYwcnArQ24wTjNaUGRMOHk3cEh6NzI2WXlxV0ZZaG80VUdnVWtBTXdw?=
 =?utf-8?B?MEVVc1VXWEZiWVR6ZUtvb0E2V3ZWcG9ObytFZDJoZUs2ZnlOdnJxOGI0TnZr?=
 =?utf-8?B?S3RiY09HWjRhcjFLWVhhZVVJazJ0em9BYUpOVVhrd1dwd1crTWVOdGYyQUZY?=
 =?utf-8?B?MDJwSzY2RXNMSGczVWoxSFlQdTFRWC9qTE52OEpvdkhpZUlVUmo2ZTZXeC9p?=
 =?utf-8?B?cmY3SWVkdGZidmJBczVXU2ZwNjdMdTZXQytlLzBZU2tuYjdJa21uMkUya3hC?=
 =?utf-8?B?eUgrTzI2anA0bUVEKzhqalAwSnA0aTVNMjFDNVk4cHVGWkFuZ2NQcmN1Tmc0?=
 =?utf-8?B?NlI3UmpJZ0RlK3hwRHJLVG41Rm1iVnhGdHVzL0tUdzNZK3AwcGhmRkdaZ1BZ?=
 =?utf-8?B?N1JjQWc2aGd2VUhvNlhtc01zNm53eVM3NEU3SkpOUTYzb2cwSERuNFA3cjNK?=
 =?utf-8?B?SkNpbHdJbmVyRy9SMXE4TG94NnNQQW1CS2VEKzZkUlZUc2FXTVVyanZLbHFZ?=
 =?utf-8?B?L04vanFBZFkxU0JoYlYvT3BpS3F5d2RtUHkwZyt2NkJmQ2tEcW5odUlraWZz?=
 =?utf-8?B?Vnd6VlZjQ2lESkttbFQwdCtubHFySUVjUUNjRWFSem9pNzhFK245UVJadHNm?=
 =?utf-8?B?Vzh4NnNOdkxla2NUblRZeUdUc0dDQjMwS2lRMU51Vlc5N3paTEVTYnUveU9k?=
 =?utf-8?B?YTFjT2ZEWXQ0NXZ0MERJczFvUUpXYkswMGI2dTdJWEZvdWNxcXBpK3N1Rnht?=
 =?utf-8?B?akQ3Q0U1RWtsRzhHQVFCbVdNdjFLMEdIK1pHZFkxTlMwdU1FZTdOQ0ZpSWVT?=
 =?utf-8?B?dDVHQ3c0dVZBYTVlZzM2RUdNVjFyekRtY29KNDJiNEFWd1I2ZnBZWWNvaG5D?=
 =?utf-8?B?WXZBRXdjZHI5K25WUG1mL0d0K0hGeWhtbFozT0VNTjYxQlYxaUcwcWJtVTdv?=
 =?utf-8?B?WDZGbStkWFVXT0Z4Ky9RNEp5blFpQzlsNEpvU3R0VUtHaFpwcnRhMG1oMEdJ?=
 =?utf-8?B?ZmlQTHVxb3NvQ2lHL29zWjJlWElCSzZRUmxReFNSOFlyY1pWWE1RYkFpMXBE?=
 =?utf-8?B?TzlOTWg4dFVaZG5ZT0Y2cU5ueU1PSFVhRndZdVBvMmlFQkdLWEQyVVo2YUM0?=
 =?utf-8?B?ZDZHL2tuU3pNTTNhYzA5MW9uR29PVlQwV0pLVndFVk5CNStMZUY1UWZsOTM2?=
 =?utf-8?B?d2pGdUYrTzdMcXhQVkRLNnBlMW5ubWdZMU5LbHdwd3pIQ0o1RzM4RGxPZ1lB?=
 =?utf-8?B?WTUzTUFuUk9HMUFnTm9ady9ybnFYbGJkdlNJUjVnT0dqdlBHMW5FT3BoaHFX?=
 =?utf-8?B?a1dSZkZCZ1MrU3JFbGg0SWl1RW9wR2JRWnBvcVF6djNkNmtJRnRiTDJ1eWo1?=
 =?utf-8?B?TERxb2NOWE5WQnBxVXZiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <012206B4B0716E4E8059307647896754@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b512c6-a97d-44ba-4f4c-08d8e7f9dd04
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 21:32:41.0557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRVMu6sLvMLIrUI10L92F9Ds3P2opxFbG0S+B3E1wKeGBAl2CaFvKHIXWVsSZnjhq4sAOx/Txy0YJjMjY79uYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7663
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DQoNCu+7vy0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNYXRoaWV1IFBvaXJpZXIg
PG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPg0KRGF0ZTogTW9uZGF5LCBNYXJjaCAxNSwgMjAy
MSBhdCAxMDozNyBBTQ0KVG86IEJlbiBMZXZpbnNreSA8QkxFVklOU0tAeGlsaW54LmNvbT4NCkNj
OiAiZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmciIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zz4sICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIgPGxpbnV4LXJlbW90ZXByb2NA
dmdlci5rZXJuZWwub3JnPiwgImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciIDxsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgImxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZyIgPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4sIE1pY2hhbCBTaW1l
ayA8bWljaGFsc0B4aWxpbnguY29tPiwgIkVkIFQuIE1vb3JpbmciIDxlbW9vcmluZ0B4aWxpbngu
Y29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MjYgNS81XSByZW1vdGVwcm9jOiBBZGQgaW5pdGlh
bCB6eW5xbXAgUjUgcmVtb3RlcHJvYyBkcml2ZXINCg0KICAgIE9uIFRodSwgTWFyIDExLCAyMDIx
IGF0IDExOjQ5OjEzUE0gKzAwMDAsIEJlbiBMZXZpbnNreSB3cm90ZToNCiAgICA+IEhpIE1hdGhp
ZXUNCiAgICA+IA0KICAgID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCiAgICA+IEZyb206
IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+DQogICAgPiBEYXRl
OiBUdWVzZGF5LCBNYXJjaCA5LCAyMDIxIGF0IDg6NTMgQU0NCiAgICA+IFRvOiBCZW4gTGV2aW5z
a3kgPEJMRVZJTlNLQHhpbGlueC5jb20+DQogICAgPiBDYzogImRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnIiA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+LCAibGludXgtcmVtb3RlcHJvY0B2
Z2VyLmtlcm5lbC5vcmciIDxsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZz4sICJsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4s
ICJsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmciIDxsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc+LCBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT4N
CiAgICA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjI2IDUvNV0gcmVtb3RlcHJvYzogQWRkIGluaXRp
YWwgenlucW1wIFI1IHJlbW90ZXByb2MgZHJpdmVyDQogICAgPiANCiAgICA+ICAgICBbLi4uXQ0K
ICAgID4gDQogICAgPiAgICAgPiArDQogICAgPiAgICAgPiArLyoqDQogICAgPiAgICAgPiArICog
enlucW1wX3I1X3Byb2JlIC0gUHJvYmVzIFp5bnFNUCBSNSBwcm9jZXNzb3IgZGV2aWNlIG5vZGUN
CiAgICA+ICAgICA+ICsgKgkJICAgICAgIHRoaXMgaXMgY2FsbGVkIGZvciBlYWNoIGluZGl2aWR1
YWwgUjUgY29yZSB0bw0KICAgID4gICAgID4gKyAqCQkgICAgICAgc2V0IHVwIG1haWxib3gsIFhp
bGlueCBwbGF0Zm9ybSBtYW5hZ2VyIHVuaXF1ZSBJRCwNCiAgICA+ICAgICA+ICsgKgkJICAgICAg
IGFkZCB0byBycHJvYyBjb3JlDQogICAgPiAgICAgPiArICoNCiAgICA+ICAgICA+ICsgKiBAcGRl
djogZG9tYWluIHBsYXRmb3JtIGRldmljZSBmb3IgY3VycmVudCBSNSBjb3JlDQogICAgPiAgICAg
PiArICogQG5vZGU6IHBvaW50ZXIgb2YgdGhlIGRldmljZSBub2RlIGZvciBjdXJyZW50IFI1IGNv
cmUNCiAgICA+ICAgICA+ICsgKiBAcnB1X21vZGU6IG1vZGUgdG8gY29uZmlndXJlIFJQVSwgc3Bs
aXQgb3IgbG9ja3N0ZXANCiAgICA+ICAgICA+ICsgKg0KICAgID4gICAgID4gKyAqIFJldHVybjog
MCBmb3Igc3VjY2VzcywgbmVnYXRpdmUgdmFsdWUgZm9yIGZhaWx1cmUuDQogICAgPiAgICAgPiAr
ICovDQogICAgPiAgICAgPiArc3RhdGljIHN0cnVjdCB6eW5xbXBfcjVfcnByb2MgKnp5bnFtcF9y
NV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KICAgID4gICAgID4gKwkJCQkJ
ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwNCiAgICA+ICAgICA+ICsJCQkJCSAgICAg
ICBlbnVtIHJwdV9vcGVyX21vZGUgcnB1X21vZGUpDQogICAgPiAgICAgPiArew0KICAgID4gICAg
ID4gKwlpbnQgcmV0LCBudW1fYmFua3M7DQogICAgPiAgICAgPiArCXN0cnVjdCBkZXZpY2UgKmRl
diA9ICZwZGV2LT5kZXY7DQogICAgPiAgICAgPiArCXN0cnVjdCBycHJvYyAqcnByb2NfcHRyOw0K
ICAgID4gICAgID4gKwlzdHJ1Y3QgenlucW1wX3I1X3Jwcm9jICp6X3Jwcm9jOw0KICAgID4gICAg
ID4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKnI1X25vZGU7DQogICAgPiAgICAgPiArDQogICAgPiAg
ICAgPiArCS8qIEFsbG9jYXRlIHJlbW90ZXByb2MgaW5zdGFuY2UgKi8NCiAgICA+ICAgICA+ICsJ
cnByb2NfcHRyID0gZGV2bV9ycHJvY19hbGxvYyhkZXYsIGRldl9uYW1lKGRldiksICZ6eW5xbXBf
cjVfcnByb2Nfb3BzLA0KICAgID4gICAgID4gKwkJCQkgICAgIE5VTEwsIHNpemVvZihzdHJ1Y3Qg
enlucW1wX3I1X3Jwcm9jKSk7DQogICAgPiAgICAgPiArCWlmICghcnByb2NfcHRyKSB7DQogICAg
PiAgICAgPiArCQlyZXQgPSAtRU5PTUVNOw0KICAgID4gICAgID4gKwkJZ290byBlcnJvcjsNCiAg
ICA+ICAgICA+ICsJfQ0KICAgID4gICAgID4gKw0KICAgID4gICAgID4gKwlycHJvY19wdHItPmF1
dG9fYm9vdCA9IGZhbHNlOw0KICAgID4gICAgID4gKwl6X3Jwcm9jID0gcnByb2NfcHRyLT5wcml2
Ow0KICAgID4gICAgID4gKwl6X3Jwcm9jLT5ycHJvYyA9IHJwcm9jX3B0cjsNCiAgICA+ICAgICA+
ICsJcjVfbm9kZSA9IHpfcnByb2MtPnJwcm9jLT5kZXYucGFyZW50LT5vZl9ub2RlOw0KICAgID4g
ICAgID4gKw0KICAgID4gICAgID4gKwkvKiBTZXQgdXAgRE1BIG1hc2sgKi8NCiAgICA+ICAgICA+
ICsJcmV0ID0gZG1hX3NldF9jb2hlcmVudF9tYXNrKGRldiwgRE1BX0JJVF9NQVNLKDMyKSk7DQog
ICAgPiAgICAgPiArCWlmIChyZXQpDQogICAgPiAgICAgPiArCQlnb3RvIGVycm9yOw0KICAgID4g
ICAgID4gKw0KICAgID4gICAgID4gKwkvKiBHZXQgUjUgcG93ZXIgZG9tYWluIG5vZGUgKi8NCiAg
ICA+ICAgICA+ICsJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgInBvd2VyLWRvbWFp
biIsICZ6X3Jwcm9jLT5wbm9kZV9pZCk7DQogICAgPiAgICAgPiArCWlmIChyZXQpDQogICAgPiAg
ICAgPiArCQlnb3RvIGVycm9yOw0KICAgID4gICAgID4gKw0KICAgID4gICAgID4gKwlyZXQgPSBy
NV9zZXRfbW9kZSh6X3Jwcm9jLCBycHVfbW9kZSk7DQogICAgPiAgICAgPiArCWlmIChyZXQpDQog
ICAgPiAgICAgPiArCQlnb3RvIGVycm9yOw0KICAgID4gICAgID4gKw0KICAgID4gICAgID4gKwlp
ZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5vZGUsICJtYm94ZXMiKSkgew0KICAgID4gICAgID4g
KwkJcmV0ID0genlucW1wX3I1X3NldHVwX21ib3goel9ycHJvYywgbm9kZSk7DQogICAgPiAgICAg
PiArCQlpZiAocmV0KQ0KICAgID4gICAgID4gKwkJCWdvdG8gZXJyb3I7DQogICAgPiAgICAgPiAr
CX0NCiAgICA+ICAgICA+ICsNCiAgICA+ICAgICA+ICsJLyogZ28gdGhyb3VnaCBUQ00gYmFua3Mg
Zm9yIHI1IG5vZGUgKi8NCiAgICA+ICAgICA+ICsJbnVtX2JhbmtzID0gb2ZfY291bnRfcGhhbmRs
ZV93aXRoX2FyZ3MocjVfbm9kZSwgQkFOS19MSVNUX1BST1AsIE5VTEwpOw0KICAgID4gICAgID4g
KwlpZiAobnVtX2JhbmtzIDw9IDApIHsNCiAgICA+ICAgICA+ICsJCWRldl9lcnIoZGV2LCAibmVl
ZCB0byBzcGVjaWZ5IFRDTSBiYW5rc1xuIik7DQogICAgPiAgICAgPiArCQlyZXQgPSAtRUlOVkFM
Ow0KICAgID4gICAgID4gKwkJZ290byBlcnJvcjsNCiAgICA+ICAgICA+ICsJfQ0KICAgID4gICAg
ID4gKw0KICAgID4gICAgID4gKwlpZiAobnVtX2JhbmtzID4gTlVNX1NSQU1TKSB7DQogICAgPiAg
ICAgPiArCQlkZXZfZXJyKGRldiwgIm1heCBudW1iZXIgb2Ygc3JhbXMgaXMgJWQuIGdpdmVuOiAl
ZCBcclxuIiwNCiAgICA+ICAgICA+ICsJCQlOVU1fU1JBTVMsIG51bV9iYW5rcyk7DQogICAgPiAg
ICAgPiArCQlyZXQgPSAtRUlOVkFMOw0KICAgID4gICAgID4gKwkJZ290byBlcnJvcjsNCiAgICA+
ICAgICA+ICsJfQ0KICAgID4gICAgID4gKw0KICAgID4gICAgID4gKwkvKiBjb25zdHJ1Y3QgY29s
bGVjdGlvbiBvZiBzcmFtcyB1c2VkIGJ5IHRoZSBjdXJyZW50IFI1IGNvcmUgKi8NCiAgICA+ICAg
ICA+ICsJZm9yICg7IG51bV9iYW5rczsgbnVtX2JhbmtzLS0pIHsNCiAgICA+ICAgICA+ICsJCXN0
cnVjdCByZXNvdXJjZSByc2M7DQogICAgPiAgICAgPiArCQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmR0
X25vZGU7DQogICAgPiAgICAgPiArCQlyZXNvdXJjZV9zaXplX3Qgc2l6ZTsNCiAgICA+ICAgICA+
ICsJCWludCBpOw0KICAgID4gICAgID4gKw0KICAgID4gICAgID4gKwkJZHRfbm9kZSA9IG9mX3Bh
cnNlX3BoYW5kbGUocjVfbm9kZSwgQkFOS19MSVNUX1BST1AsIGkpOw0KICAgID4gDQogICAgPiAg
ICAgVmFyaWFibGUgQGkgaXMgbm90IGluaXRpYWxpc2VkIGJ1dCBpdCBpcyB1c2VkIGFzIGFuIGlu
ZGV4IHRvIHJldHJpZXZlIGEgaGFuZGxlDQogICAgPiAgICAgdG8gdGhlIHNyYW0gYmFua3MuICBU
aGF0IGNvZGUgX3Nob3VsZF8gaGF2ZSBmYWlsZWQgZnJlcXVlbnRseSBvciBhdCBsZWFzdCBoYXZl
DQogICAgPiAgICAgeWllbGRlZCBhYm5vcm1hbCByZXN1bHRzIG9mdGVuIGVub3VnaCB0byBiZSBu
b3RpY2VkLiAgV2h5IHdhc24ndCBpdCB0aGUgY2FzZT8NCiAgICA+IA0KICAgID4gICAgIEkgd2ls
bCBzdG9wIGhlcmUgZm9yIHRoZSBtb21lbnQuDQogICAgPiANCiAgICA+IFtCZW5dDQogICAgPiBZ
ZXMgdGhpcyBzaG91bGQgYmUgaW5pdGlhbGl6ZWQuIFRoZSByZWFzb24gdGhpcyBnb3QgdGhyb3Vn
aCBpcyB0aGF0IGFzIGkgZGVmYXVsdHMgdG8gMCBhbmQgdGhlIDB0aCBiYW5rIGhvdXNlZCB0aGUg
cmVxdWlyZWQgZGF0YS4gdGhlIGNhc2Ugd2hlcmUgU1JBTVMgdGhhdCBjYW4gYmUgd3JpdHRlbiB0
bywgMHhGRkUyMDAwMCBpbiB0aGlzIGNhc2Ugb2Ygc3BsaXQgbW9kZSBhbmQgb24gUjUtMCwgd2Fz
IG5vdCBjYXVnaHQuDQogICAgPiANCg0KICAgIEhlcmUgQGkgaXMgYSB2YXJpYWJsZSBhbGxvY2F0
ZWQgb24gdGhlIHN0YWNrIGFuZCBhcyBzdWNoIGl0IGlzIGdhcmFudGVlZCB0byBiZQ0KICAgIGdh
cmJhZ2Ugb24gaW5pdGlhbGlzYXRpb24gLSBpdCB3aWxsIGRvIGFueXRoaW5nIGJ1dCBkZWZhdWx0
IHRvIDAuDQoNCk9rLg0KDQogICAgPiBJbnN0ZWFkIG9mIGkgSSB3aWxsIHVzZSANCiAgICA+IA0K
ICAgID4gICAgICAgICAgICAgICAgIHNyYW1fbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUobm9kZSwg
QkFOS19MSVNUX1BST1AsICAgICAgICAgICAgICANCiAgICA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG51bV9iYW5rcyAtIDEpOyANCg0KICAgIERvIHlvdSBo
YXZlIHRvIHN0YXJ0IHdpdGggdGhlIGxhc3QgYmFuaz8gIElmIG1lbW9yeSBzZXJ2ZXMgbWUgd2Vs
bCBpdCBpc24ndCB0aGUNCiAgICBjYXNlIGluIHRoZSBwcmV2aW91cyByZXZpc2lvbnMuICBXaHkg
bm90IGdvIGJhY2sgdG8gdGhlIGltcGxlbWVudGF0aW9uIHlvdSBoYWQNCiAgICBpbiBWMjU/ICAN
Cg0KTWFrZXMgc2Vuc2UuIFdpbGwgcmV2ZXJ0IGFzIHN1Z2dlc3RlZC4NCg0KDQo=
